#!/usr/bin/env python3
"""
svg_preview.py — Per-slide SVG rendering preview (P0 tool)

Purpose:
    Render a single SVG file to PNG so the AI can visually inspect a slide
    immediately after generating it, before moving on to the next slide.
    This is the front-end component of the "render -> look -> fix" loop:
    generate SVG -> svg_preview.py -> open PNG -> look -> fix SVG -> repeat.

Renderer fallback chain (first available is used):
    1. svglib + reportlab (project's existing default dependency)
    2. cairosvg (better gradient/filter support, optional dependency)
    3. rsvg-convert (external binary, via subprocess)

Usage:
    python3 svg_preview.py <svg_file> [--output <png_path>] [--width 1280] [--height 720]
    python3 svg_preview.py <directory> --batch [--width 1280] [--height 720]

If --output is not given, the PNG is written next to the SVG as
<svg_name>.preview.png. In --batch mode, every *.svg file directly inside
the given directory is rendered the same way.

Exit codes:
    0 success
    1 error (missing file, no renderer available, conversion failure)
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path
from typing import Optional

__version__ = "1.2.0"


# ---------------------------------------------------------------------------
# Renderer detection (svglib -> cairosvg -> rsvg-convert)
#
# Import-time availability does not guarantee runtime success (e.g. svglib's
# renderPM may import fine but fail at draw time if no PIL/rlPyCairo backend
# is configured; cairosvg may import fine but fail if libcairo is missing).
# AVAILABLE_RENDERERS lists renderers to try in priority order; render_svg_to_png
# falls through to the next one on failure.
# ---------------------------------------------------------------------------

AVAILABLE_RENDERERS: list = []

try:
    from svglib.svglib import svg2rlg
    from reportlab.graphics import renderPM

    AVAILABLE_RENDERERS.append("svglib")
except (ImportError, OSError):
    pass

try:
    import cairosvg  # type: ignore

    AVAILABLE_RENDERERS.append("cairosvg")
except (ImportError, OSError):
    pass

import shutil

if shutil.which("rsvg-convert"):
    AVAILABLE_RENDERERS.append("rsvg-convert")

# Kept for backwards-compatible introspection (first renderer that appeared
# importable, or None if nothing is available).
RENDERER: Optional[str] = AVAILABLE_RENDERERS[0] if AVAILABLE_RENDERERS else None


def _render_with_svglib(svg_path: Path, png_path: Path, width: int, height: int) -> bool:
    """Render SVG to PNG using svglib + reportlab."""
    drawing = svg2rlg(str(svg_path))
    if drawing is None:
        print(f"Error: svglib could not parse SVG: {svg_path}", file=sys.stderr)
        return False

    # Scale drawing to requested pixel dimensions if we know the source size.
    try:
        src_w = float(drawing.width)
        src_h = float(drawing.height)
        if src_w > 0 and src_h > 0:
            scale_x = width / src_w
            scale_y = height / src_h
            drawing.width = width
            drawing.height = height
            drawing.scale(scale_x, scale_y)
    except Exception:
        # If scaling fails for any reason, fall back to rendering at native size.
        pass

    renderPM.drawToFile(drawing, str(png_path), fmt="PNG", configPIL={"quality": 95})
    return True


def _render_with_cairosvg(svg_path: Path, png_path: Path, width: int, height: int) -> bool:
    """Render SVG to PNG using cairosvg."""
    cairosvg.svg2png(
        url=str(svg_path),
        write_to=str(png_path),
        output_width=width,
        output_height=height,
    )
    return True


def _render_with_rsvg_convert(svg_path: Path, png_path: Path, width: int, height: int) -> bool:
    """Render SVG to PNG by shelling out to the rsvg-convert binary."""
    cmd = [
        "rsvg-convert",
        "-w", str(width),
        "-h", str(height),
        "-o", str(png_path),
        str(svg_path),
    ]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error: rsvg-convert failed for {svg_path}: {result.stderr.strip()}", file=sys.stderr)
        return False
    return True


_RENDER_FUNCS = {
    "svglib": _render_with_svglib,
    "cairosvg": _render_with_cairosvg,
    "rsvg-convert": _render_with_rsvg_convert,
}


def render_svg_to_png(svg_path: Path, png_path: Path, width: int = 1280, height: int = 720) -> bool:
    """Render a single SVG file to PNG, trying each available renderer in order.

    Falls through to the next renderer if the current one raises at runtime
    (e.g. svglib installed but its native drawing backend is missing).
    Returns True on success, False if every renderer failed. Errors are
    printed to stderr.
    """
    if not svg_path.exists():
        print(f"Error: SVG file not found: {svg_path}", file=sys.stderr)
        return False

    if not AVAILABLE_RENDERERS:
        print(
            "Error: no SVG renderer available. Install one of:\n"
            "  pip install svglib reportlab   (project default)\n"
            "  pip install cairosvg           (better gradients/filters)\n"
            "  brew install librsvg           (provides rsvg-convert)",
            file=sys.stderr,
        )
        return False

    png_path.parent.mkdir(parents=True, exist_ok=True)

    last_error: Optional[str] = None
    for renderer_name in AVAILABLE_RENDERERS:
        render_func = _RENDER_FUNCS[renderer_name]
        try:
            ok = render_func(svg_path, png_path, width, height)
        except Exception as e:
            last_error = f"{renderer_name}: {e}"
            print(
                f"Warning: {renderer_name} failed for {svg_path}, "
                f"trying next renderer if available: {e}",
                file=sys.stderr,
            )
            continue

        if ok and png_path.exists():
            return True
        last_error = f"{renderer_name}: produced no output"

    print(f"Error: all available renderers failed for {svg_path} ({last_error})", file=sys.stderr)
    return False


def default_output_path(svg_path: Path) -> Path:
    """Compute the default preview PNG path next to the SVG file."""
    return svg_path.with_suffix("").with_name(svg_path.stem + ".preview.png")


def run_single(svg_path: Path, output: Optional[Path], width: int, height: int) -> Optional[Path]:
    """Render one SVG file. Returns the output path on success, None on failure."""
    png_path = output if output is not None else default_output_path(svg_path)
    if render_svg_to_png(svg_path, png_path, width, height):
        return png_path
    return None


def run_batch(directory: Path, width: int, height: int) -> list:
    """Render all *.svg files directly inside a directory. Returns list of output paths."""
    svg_files = sorted(directory.glob("*.svg"))
    if not svg_files:
        print(f"Warning: no SVG files found in {directory}", file=sys.stderr)
        return []

    results = []
    failures = 0
    for svg_path in svg_files:
        png_path = default_output_path(svg_path)
        if render_svg_to_png(svg_path, png_path, width, height):
            results.append(png_path)
            print(str(png_path))
        else:
            failures += 1

    print(f"\nRendered {len(results)}/{len(svg_files)} SVG file(s) in {directory}", file=sys.stderr)
    if failures:
        print(f"  {failures} failure(s), see errors above", file=sys.stderr)

    return results


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Render SVG file(s) to PNG for immediate visual self-check.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python3 svg_preview.py slide_03.svg
    Renders slide_03.svg -> slide_03.preview.png

  python3 svg_preview.py slide_03.svg --output /tmp/check.png --width 1920 --height 1080
    Renders at a custom size to a custom output path

  python3 svg_preview.py svg_output/ --batch
    Renders every *.svg file in svg_output/ to <name>.preview.png next to it

After rendering, use `open <png_path>` (macOS) to view the result immediately.
        """,
    )
    parser.add_argument("target", help="SVG file, or a directory when --batch is used")
    parser.add_argument("--output", "-o", help="Output PNG path (single-file mode only)")
    parser.add_argument("--width", type=int, default=1280, help="Output width in pixels (default: 1280)")
    parser.add_argument("--height", type=int, default=720, help="Output height in pixels (default: 720)")
    parser.add_argument("--batch", action="store_true", help="Treat target as a directory and render all SVGs inside it")

    args = parser.parse_args()
    target = Path(args.target).resolve()

    if args.batch:
        if not target.is_dir():
            print(f"Error: --batch requires a directory, got: {target}", file=sys.stderr)
            return 1
        results = run_batch(target, args.width, args.height)
        return 0 if results else 1

    if not target.exists():
        print(f"Error: file not found: {target}", file=sys.stderr)
        return 1
    if target.is_dir():
        print(f"Error: {target} is a directory. Use --batch to render a whole directory.", file=sys.stderr)
        return 1
    if target.suffix.lower() != ".svg":
        print(f"Error: expected a .svg file, got: {target}", file=sys.stderr)
        return 1

    output = Path(args.output).resolve() if args.output else None
    png_path = run_single(target, output, args.width, args.height)
    if png_path is None:
        return 1

    print(str(png_path))
    return 0


if __name__ == "__main__":
    sys.exit(main())
