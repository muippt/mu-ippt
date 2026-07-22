# CLAUDE.md

This file provides a project overview for Claude Code. Before executing PPT generation tasks, **you MUST first read `skills/mu-ippt/SKILL.md`** for the complete workflow and rules.

## Project Overview

mu-ippt is an AI-driven presentation generation system. Through multi-role collaboration (Strategist → Image_Generator → Executor), it converts source documents (PDF/DOCX/URL/Markdown) into natively editable PPTX with real PowerPoint shapes (DrawingML).

**Core Pipeline**: `Source Document → Create Project → Template Option → Strategist Eight Confirmations → [Image_Generator] → Executor → Post-processing → Export PPTX`

## Common Commands

```bash
# Source content conversion
python3 skills/mu-ippt/scripts/source_to_md/pdf_to_md.py <PDF_file>
python3 skills/mu-ippt/scripts/source_to_md/doc_to_md.py <DOCX_or_other_file>   # Native: .docx/.html/.epub/.ipynb; pandoc fallback: .doc/.odt/.rtf/.tex/.rst/.org/.typ
python3 skills/mu-ippt/scripts/source_to_md/ppt_to_md.py <PPTX_file>
python3 skills/mu-ippt/scripts/source_to_md/web_to_md.py <URL>    # auto-uses curl_cffi if installed (covers WeChat etc.)
node skills/mu-ippt/scripts/source_to_md/web_to_md.cjs <URL>       # fallback only; use if curl_cffi is unavailable

# Project management
python3 skills/mu-ippt/scripts/project_manager.py init <project_name> --format ppt169
python3 skills/mu-ippt/scripts/project_manager.py import-sources <project_path> <source_files_or_URLs...> --move
python3 skills/mu-ippt/scripts/project_manager.py validate <project_path>

# Image tools
python3 skills/mu-ippt/scripts/analyze_images.py <project_path>/images
python3 skills/mu-ippt/scripts/image_gen.py "prompt" --aspect_ratio 16:9 --image_size 1K -o <project_path>/images

# SVG quality check
python3 skills/mu-ippt/scripts/svg_quality_checker.py <project_path>

# Post-processing pipeline (MUST run sequentially, one at a time — NEVER batch)
python3 skills/mu-ippt/scripts/total_md_split.py <project_path>
# ✅ Confirm no errors before running the next command
python3 skills/mu-ippt/scripts/finalize_svg.py <project_path>
# ✅ Confirm no errors before running the next command
python3 skills/mu-ippt/scripts/svg_to_pptx.py <project_path> -s final
# Output: exports/<project_name>_<timestamp>.pptx + exports/<project_name>_<timestamp>_svg.pptx
# Use --only native or --only legacy to generate just one version

# v1.2.0: Per-page SVG render preview (P0 — render→look→fix loop)
python3 skills/mu-ippt/scripts/svg_preview.py <svg_file> [--output <png>] [--width 1280] [--height 720]
python3 skills/mu-ippt/scripts/svg_preview.py <directory> --batch   # render all SVGs in a directory

# v1.2.0: Element-level PPTX inspection (P1 — path-based query + JSON output)
python3 skills/mu-ippt/scripts/pptx_inspect.py <pptx> '/slide[1]'              # list all shapes on slide 1
python3 skills/mu-ippt/scripts/pptx_inspect.py <pptx> '/slide[1]/shape[2]'    # inspect specific shape
python3 skills/mu-ippt/scripts/pptx_inspect.py <pptx> --query 'shape[fill=FF0000]'  # query by attribute
python3 skills/mu-ippt/scripts/pptx_inspect.py <pptx> outline|stats|issues    # view modes
python3 skills/mu-ippt/scripts/pptx_inspect.py <pptx> '/slide[1]' --json      # structured JSON output

# v1.2.0: Lightweight post-edit CLI (P2 — no need to rerun full SVG pipeline)
python3 skills/mu-ippt/scripts/pptx_edit.py set <pptx> '/slide[1]/shape[2]' --prop text=新标题 --prop color=FF0000
python3 skills/mu-ippt/scripts/pptx_edit.py find-replace <pptx> --find "旧文本" --replace "新文本" [--regex] [--slide N]
python3 skills/mu-ippt/scripts/pptx_edit.py recolor <pptx> --bg 0D0D2B --primary 00FF88 --accent FF6B35 [--dry-run]
python3 skills/mu-ippt/scripts/pptx_edit.py add-slide|remove-slide|move-slide <pptx> [args]

# v1.2.0: Interactive HTML preview (P3 — clickable shape selection)
python3 skills/mu-ippt/scripts/interactive_preview.py <pptx> [--output <html>] [--port 8080]

# v1.2.0: Single binary packaging (P4 — zero-dependency distribution)
bash skills/mu-ippt/scripts/build_binary.sh [--clean] [--name mu-ippt]
# Result: dist/mu-ippt (subcommands: inspect/edit/preview/verify/interactive/create/export)
```

## Architecture

- `skills/mu-ippt/references/` — AI role definitions and technical specifications
- `skills/mu-ippt/scripts/` — Runnable tool scripts
- `skills/mu-ippt/scripts/docs/` — Topic-focused script docs
- `skills/mu-ippt/templates/` — Layout templates, chart templates, 640+ vector icons
- `examples/` — Example projects
- `projects/` — User project workspace

## SVG Technical Constraints (Non-negotiable)

**Banned features**: `mask` | `<style>` | `class` | external CSS | `<foreignObject>` | `textPath` | `@font-face` | `<animate*>` | `<script>` | `<iframe>` | `<symbol>`+`<use>` (`id` inside `<defs>` is a legitimate reference and is NOT banned)

**Conditionally allowed**: `marker-start` / `marker-end` — the referenced `<marker>` must live in `<defs>`, use `orient="auto"`, and its shape must be a triangle (3-vertex closed path/polygon), diamond (4-vertex), or circle/ellipse. The converter maps these to native DrawingML `<a:headEnd>` / `<a:tailEnd>`. See `shared-standards.md` §1.1 for full constraints.

**Conditionally allowed**: `clipPath` on `<image>` — the referenced `<clipPath>` must live in `<defs>` and contain a single shape child (circle, ellipse, rect with rx/ry, path, or polygon). The converter maps these to native DrawingML picture geometry (`<a:prstGeom>` or `<a:custGeom>`). Only supported on `<image>` elements. See `shared-standards.md` §1.2 for full constraints.

**PPT compatibility alternatives**:

| Banned | Alternative |
|--------|-------------|
| `rgba()` | `fill-opacity` / `stroke-opacity` |
| `<g opacity>` | Set opacity on each child element individually |
| `<image opacity>` | Overlay with a mask layer |

## Canvas Format Quick Reference

| Format | viewBox |
|--------|---------|
| PPT 16:9 | `0 0 1280 720` |
| PPT 4:3 | `0 0 1024 768` |
| Xiaohongshu (RED) | `0 0 1242 1660` |
| WeChat Moments | `0 0 1080 1080` |
| Story | `0 0 1080 1920` |

## Post-processing Notes

- **NEVER** use `cp` as a substitute for `finalize_svg.py`
- **NEVER** export directly from `svg_output/` — MUST export from `svg_final/` (use `-s final`)
- Do NOT add extra flags like `--only` to the post-processing commands
- **NEVER** run the three post-processing steps in a single code block or single shell invocation

## Documentation Sync Rule (MANDATORY)

When the project version is bumped or features are added/changed, the following files MUST be updated in the same commit before pushing:

1. `SKILL.md` — version number in frontmatter
2. `CLAUDE.md` & `AGENTS.md` — new commands in Common Commands section
3. `README.md` & `README_CN.md` — comparison table rows, What's New section, feature descriptions
4. `index.html` (GitHub Pages) — comparison table rows, feature cards, version badges
5. Python scripts — `__version__` variable in each script
6. Shell scripts — `VERSION=` variable

**NEVER push to `main` without verifying all above files reflect the current version.** GitHub Pages auto-deploys on push, so a stale `index.html` goes live immediately.
