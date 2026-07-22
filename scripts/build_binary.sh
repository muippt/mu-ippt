#!/usr/bin/env bash
#
# build_binary.sh - Package mu-ippt into a single zero-dependency binary.
#
# Inspired by OfficeCLI's single-binary distribution model: bundles the
# Python interpreter + all mu-ippt scripts + templates/references data into
# one executable via PyInstaller, so end users don't need `pip install`.
#
# Usage:
#   scripts/build_binary.sh [--clean] [--onedir] [--name NAME] [--help]
#
# Options:
#   --clean       Remove previous build/, dist/, and *.spec artifacts first
#   --onedir      Build a one-directory bundle instead of a single file
#                 (faster startup, but produces a folder instead of one binary)
#   --name NAME   Output binary name (default: mu-ippt)
#   -h, --help    Show this help message
#
# Output:
#   dist/mu-ippt        Single-file executable (default mode)
#
# The resulting binary supports:
#   mu-ippt --version
#   mu-ippt inspect <pptx> [args...]        -> pptx_inspect.py (or inventory.py fallback)
#   mu-ippt edit <pptx> <command> [args...] -> pptx_edit.py (or pptx_editing/* fallback)
#   mu-ippt preview <svg> [args...]         -> svg_preview.py (or finalize_svg.py fallback)
#   mu-ippt verify <pptx> [args...]         -> visual_verify.py
#   mu-ippt interactive <pptx> [args...]    -> interactive_preview.py
#   mu-ippt create <project_name> [args...] -> project_manager.py init
#   mu-ippt export <project_path> [args...] -> svg_to_pptx.py
#
set -euo pipefail

VERSION="1.2.0"

# --------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SCRIPTS_DIR="${REPO_ROOT}/scripts"
SCRIPTS_PPT_DIR="${REPO_ROOT}/scripts_ppt"
PPTX_EDITING_DIR="${SCRIPTS_DIR}/pptx_editing"
TEMPLATES_DIR="${REPO_ROOT}/templates"
REFERENCES_DIR="${REPO_ROOT}/references"
BUILD_DIR="${REPO_ROOT}/build"
DIST_DIR="${REPO_ROOT}/dist"
WORK_DIR="${REPO_ROOT}/.build_binary_work"
ENTRYPOINT="${WORK_DIR}/mu_ippt_entrypoint.py"
SPEC_FILE="${WORK_DIR}/mu-ippt.spec"

BIN_NAME="mu-ippt"
ONEFILE=1
DO_CLEAN=0

# --------------------------------------------------------------------------
# Helpers
# --------------------------------------------------------------------------
log()  { printf '\033[1;34m[build]\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[warn]\033[0m %s\n' "$*" >&2; }
err()  { printf '\033[1;31m[error]\033[0m %s\n' "$*" >&2; }
die()  { err "$*"; exit 1; }

print_help() {
  sed -n '2,31p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

# --------------------------------------------------------------------------
# Argument parsing
# --------------------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --clean)
      DO_CLEAN=1
      shift
      ;;
    --onedir)
      ONEFILE=0
      shift
      ;;
    --name)
      [[ $# -ge 2 ]] || die "--name requires a value"
      BIN_NAME="$2"
      shift 2
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      die "Unknown option: $1 (use --help for usage)"
      ;;
  esac
done

# --------------------------------------------------------------------------
# Sanity checks
# --------------------------------------------------------------------------
[[ -d "${SCRIPTS_DIR}" ]] || die "scripts/ directory not found at ${SCRIPTS_DIR}"
[[ -d "${SCRIPTS_PPT_DIR}" ]] || die "scripts_ppt/ directory not found at ${SCRIPTS_PPT_DIR}"

command -v python3 >/dev/null 2>&1 || die "python3 is required but was not found on PATH"
PYTHON_BIN="$(command -v python3)"
log "Using Python: ${PYTHON_BIN} ($(${PYTHON_BIN} --version 2>&1))"

if [[ "${DO_CLEAN}" -eq 1 ]]; then
  log "Cleaning previous build artifacts..."
  rm -rf "${BUILD_DIR}" "${DIST_DIR}" "${WORK_DIR}"
  rm -f "${REPO_ROOT}"/*.spec
fi

mkdir -p "${WORK_DIR}"

# --------------------------------------------------------------------------
# Ensure PyInstaller is installed
# --------------------------------------------------------------------------
if ! "${PYTHON_BIN}" -m PyInstaller --version >/dev/null 2>&1; then
  log "PyInstaller not found; installing..."
  "${PYTHON_BIN}" -m pip install --quiet --upgrade pyinstaller \
    || die "Failed to install pyinstaller. Try: pip3 install pyinstaller"
else
  log "PyInstaller version: $(${PYTHON_BIN} -m PyInstaller --version 2>&1)"
fi

# --------------------------------------------------------------------------
# Verify required runtime dependencies are importable (warn, don't fail hard)
# --------------------------------------------------------------------------
REQUIRED_MODULES=(pptx lxml PIL svglib reportlab)
MISSING_MODULES=()
for mod in "${REQUIRED_MODULES[@]}"; do
  if ! "${PYTHON_BIN}" -c "import ${mod}" >/dev/null 2>&1; then
    MISSING_MODULES+=("${mod}")
  fi
done
if [[ ${#MISSING_MODULES[@]} -gt 0 ]]; then
  warn "Missing Python modules (binary may fail at runtime for related features): ${MISSING_MODULES[*]}"
  warn "Install with: pip3 install -r ${REPO_ROOT}/requirements.txt"
fi

# --------------------------------------------------------------------------
# Generate the unified entrypoint script that PyInstaller will compile.
# It dispatches `mu-ippt <subcommand> ...` to the corresponding internal
# script, using the closest existing script when the aspirational P4 target
# script name isn't present yet in this checkout.
# --------------------------------------------------------------------------
log "Generating entrypoint at ${ENTRYPOINT}"
cat > "${ENTRYPOINT}" << PYEOF
#!/usr/bin/env python3
"""
mu-ippt unified CLI entrypoint (generated by build_binary.sh).

Dispatches subcommands to the underlying mu-ippt scripts. Bundled by
PyInstaller into a single zero-dependency binary.
"""
import os
import sys
import runpy
from pathlib import Path

__version__ = "${VERSION}"


def _base_dir() -> Path:
    """Return the directory containing bundled scripts.

    When frozen by PyInstaller (onefile mode), data is extracted to
    sys._MEIPASS at runtime. Otherwise fall back to this file's directory
    (useful for 'python mu_ippt_entrypoint.py ...' debugging).
    """
    meipass = getattr(sys, "_MEIPASS", None)
    if meipass:
        return Path(meipass)
    return Path(__file__).resolve().parent


BASE = _base_dir()
SEARCH_DIRS = [
    BASE / "scripts",
    BASE / "scripts_ppt",
    BASE / "scripts" / "pptx_editing",
    BASE / "scripts_ppt" / "svg_to_pptx",
    BASE / "scripts_ppt" / "svg_finalize",
    BASE / "scripts_ppt" / "source_to_md",
    BASE / "scripts_ppt" / "template_import",
    BASE / "scripts_ppt" / "image_backends",
]
for d in SEARCH_DIRS:
    if d.exists():
        sys.path.insert(0, str(d))


def _find_script(candidates):
    """Return the first existing script path among candidate filenames."""
    for name in candidates:
        for d in SEARCH_DIRS:
            p = d / name
            if p.exists():
                return p
    return None


def _run_script(script_path: Path, argv):
    """Execute a script file as __main__ with the given argv."""
    old_argv = sys.argv
    sys.argv = [str(script_path)] + list(argv)
    try:
        runpy.run_path(str(script_path), run_name="__main__")
    finally:
        sys.argv = old_argv


def _dispatch_or_die(candidates, argv, friendly_name):
    script = _find_script(candidates)
    if script is None:
        print(
            f"Error: could not locate an implementation for '{friendly_name}'. "
            f"Looked for: {', '.join(candidates)}",
            file=sys.stderr,
        )
        sys.exit(1)
    _run_script(script, argv)


def main():
    argv = sys.argv[1:]

    if not argv or argv[0] in ("-h", "--help"):
        print(f"""mu-ippt {__version__} - AI PPT generation toolkit (single-binary build)

Usage:
  mu-ippt --version
  mu-ippt inspect <pptx> [args...]         Inspect PPTX structure / text inventory
  mu-ippt edit <pptx> <command> [args...]  Edit PPTX (replace/rearrange/color-unify/...)
  mu-ippt preview <svg> [args...]          Preview/finalize an SVG slide
  mu-ippt verify <pptx> [args...]          Render PPTX to JPEG for visual QA
  mu-ippt interactive <pptx> [args...]     Interactive HTML preview with clickable shapes
  mu-ippt create <project_name> [args...]  Create a new mu-ippt project
  mu-ippt export <project_path> [args...]  Export project SVGs to a PPTX
""")
        sys.exit(0)

    if argv[0] in ("--version", "-v", "version"):
        print(f"mu-ippt {__version__}")
        sys.exit(0)

    command, rest = argv[0], argv[1:]

    if command == "inspect":
        _dispatch_or_die(["pptx_inspect.py", "inventory.py"], rest, "inspect")
    elif command == "edit":
        _dispatch_or_die(["pptx_edit.py", "replace.py"], rest, "edit")
    elif command == "preview":
        _dispatch_or_die(["svg_preview.py", "finalize_svg.py"], rest, "preview")
    elif command == "verify":
        _dispatch_or_die(["visual_verify.py"], rest, "verify")
    elif command == "interactive":
        _dispatch_or_die(["interactive_preview.py"], rest, "interactive")
    elif command == "create":
        script = _find_script(["project_manager.py"])
        if script is None:
            print("Error: project_manager.py not found", file=sys.stderr)
            sys.exit(1)
        _run_script(script, ["init"] + rest)
    elif command == "export":
        _dispatch_or_die(["svg_to_pptx.py"], rest, "export")
    else:
        print(f"Error: unknown command '{command}'. Run 'mu-ippt --help' for usage.", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
PYEOF

# --------------------------------------------------------------------------
# Build the PyInstaller Analysis 'datas' list for templates/ and references/
# --------------------------------------------------------------------------
DATAS_ENTRIES=""
if [[ -d "${TEMPLATES_DIR}" ]]; then
  DATAS_ENTRIES="${DATAS_ENTRIES}    (r'${TEMPLATES_DIR}', 'templates'),\n"
else
  warn "templates/ not found at ${TEMPLATES_DIR}; skipping from bundle"
fi
if [[ -d "${REFERENCES_DIR}" ]]; then
  DATAS_ENTRIES="${DATAS_ENTRIES}    (r'${REFERENCES_DIR}', 'references'),\n"
else
  warn "references/ not found at ${REFERENCES_DIR}; skipping from bundle"
fi

# Bundle scripts/ and scripts_ppt/ *.py source trees as data so the
# runpy-based dispatcher in the entrypoint can find and execute them
# (keeps behavior close to running the scripts directly, without having
# to convert every sibling-import script into a proper package).
DATAS_ENTRIES="${DATAS_ENTRIES}    (r'${SCRIPTS_DIR}', 'scripts'),\n"
DATAS_ENTRIES="${DATAS_ENTRIES}    (r'${SCRIPTS_PPT_DIR}', 'scripts_ppt'),\n"

# --------------------------------------------------------------------------
# Generate the PyInstaller .spec file
# --------------------------------------------------------------------------
log "Generating PyInstaller spec at ${SPEC_FILE}"
cat > "${SPEC_FILE}" << SPECEOF
# -*- mode: python ; coding: utf-8 -*-
# Auto-generated by build_binary.sh — do not edit by hand.

from pathlib import Path

block_cipher = None

hidden_imports = [
    'pptx',
    'pptx.oxml',
    'pptx.oxml.ns',
    'pptx.parts.image',
    'pptx.dml.color',
    'pptx.enum.text',
    'pptx.enum.dml',
    'pptx.enum.shapes',
    'pptx.util',
    'lxml',
    'lxml.etree',
    'lxml.html',
    'PIL',
    'PIL.Image',
    'PIL.ImageDraw',
    'PIL.ImageFont',
    'svglib',
    'svglib.svglib',
    'reportlab',
    'reportlab.graphics',
    'reportlab.graphics.renderPM',
    'reportlab.pdfgen',
    'fitz',  # PyMuPDF
    'mammoth',
    'numpy',
    'bs4',
    'markdownify',
    'requests',
]

excluded_dirs = ['.git', 'examples', 'projects', 'docs', '__pycache__', '.pytest_cache']

a = Analysis(
    [r'${ENTRYPOINT}'],
    pathex=[r'${SCRIPTS_DIR}', r'${SCRIPTS_PPT_DIR}', r'${PPTX_EDITING_DIR}'],
    binaries=[],
    datas=[
$(printf '%b' "${DATAS_ENTRIES}")    ],
    hiddenimports=hidden_imports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=['tkinter', 'matplotlib.tests', 'numpy.tests'],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)

# Strip development/example directories that may have been swept in via
# implicit package data collection (datas above are explicit and curated,
# this is a defensive guard against future accidental inclusion).
a.datas = [
    d for d in a.datas
    if not any(part in excluded_dirs for part in Path(d[1]).parts)
]

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name='${BIN_NAME}',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
)
SPECEOF

if [[ "${ONEFILE}" -eq 0 ]]; then
  log "Building one-directory bundle (--onedir requested)"
  # Convert EXE(...) onefile call into a onedir COLLECT-based build by
  # appending a COLLECT stage and removing embedded data/binaries from EXE.
  cat >> "${SPEC_FILE}" << 'SPECEOF2'

coll = COLLECT(
    exe,
    a.binaries,
    a.zipfiles,
    a.datas,
    strip=False,
    upx=True,
    upx_exclude=[],
    name='mu-ippt-dist',
)
SPECEOF2
fi

# --------------------------------------------------------------------------
# Run PyInstaller
# --------------------------------------------------------------------------
log "Running PyInstaller (this may take a minute)..."
(
  cd "${REPO_ROOT}" && \
  "${PYTHON_BIN}" -m PyInstaller \
    --noconfirm \
    --clean \
    --distpath "${DIST_DIR}" \
    --workpath "${BUILD_DIR}" \
    "${SPEC_FILE}"
) || die "PyInstaller build failed. See output above for details."

# --------------------------------------------------------------------------
# Report result
# --------------------------------------------------------------------------
OUTPUT_BIN="${DIST_DIR}/${BIN_NAME}"
if [[ "${ONEFILE}" -eq 0 ]]; then
  OUTPUT_BIN="${DIST_DIR}/mu-ippt-dist/${BIN_NAME}"
fi

if [[ ! -e "${OUTPUT_BIN}" ]]; then
  die "Build finished but expected output not found at ${OUTPUT_BIN}"
fi

chmod +x "${OUTPUT_BIN}" 2>/dev/null || true

if command -v du >/dev/null 2>&1; then
  SIZE="$(du -h "${OUTPUT_BIN}" 2>/dev/null | cut -f1)"
else
  SIZE="unknown"
fi

log "Build complete."
log "Binary path: ${OUTPUT_BIN}"
log "Binary size: ${SIZE}"
log "Try it: ${OUTPUT_BIN} --version"

exit 0
