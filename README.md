<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/default-banner.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/default-banner.png">
    <img alt="mu-ippt" src="assets/default-banner.png" width="100%">
  </picture>
</p>

# mu-ippt

> AI-powered PPT creation skill that designs presentations from scratch like a professional designer — for anyone who needs polished slides without design skills.

**English** | [中文](README_CN.md)

[![CI](https://github.com/mupoet/mu-ippt/actions/workflows/ci.yml/badge.svg)](https://github.com/mupoet/mu-ippt/actions)
[![Version](https://img.shields.io/github/v/release/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/releases)
[![License](https://img.shields.io/github/license/mupoet/mu-ippt)](LICENSE)
[![Stars](https://img.shields.io/github/stars/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/stargazers)

## Quick Start

**Step 1: Install**

```bash
pip install -r requirements.txt
```

**Step 2: Configure AI Image Generation (Optional)**

```bash
# Choose one — skip to use all features without AI images
export OPENAI_API_KEY=sk-xxx
# or
export GEMINI_API_KEY=AIzaXXX
```

**Step 3: Start Using**

Tell your AI agent "help me make a PPT" to trigger the workflow.

> All chart and template features work without an API key — only AI image generation requires one.

## Features

### 🎨 15 Design Philosophy Schools

Not "pick a template" — the AI recommends the best visual style based on your topic, audience, and context. Each philosophy has unique Visual DNA, color tokens, and typography logic.

| School | Visual DNA |
|--------|-----------|
| Pentagram | Minimalist black & white, Swiss-style information-first |
| Fathom | Data storytelling, letting numbers speak |
| Ive | Apple-inspired precision industrial aesthetics |
| Rams | Less-is-more Bauhaus classics |
| Zaha | Parametric curves with futuristic feel |
| Massimo Vignelli | Timeless order from the NYC subway designer |
| ... | [14 schools total →](./docs/design-philosophies.md) |

> 📥 **[Download the showcase PPTX](./examples/design-philosophies/muippt-design-philosophies_202606.pptx)** — 31 slides demonstrating all 15 philosophies.

### 📊 119 Chart Types

From basic charts (bar, line, pie, radar) to advanced visualizations (waterfall, Sankey, sunburst, treemap), consulting charts (funnel, Gantt, KPI dashboard, org chart), and technical diagrams (architecture, sequence, flowchart, UML, ER, deployment).

### 🏛️ 40 Consulting-Grade Templates

Benchmarked against McKinsey / BCG / Bain: SWOT, Porter's Five Forces, BCG Matrix, KPI Dashboard, Gantt Timeline, Org Chart, Talent 9-Box, Growth Flywheel, and more.

### 🖼️ 6,732 Vector Icons + 8 Canvas Formats

All SVG vector, lossless scaling, fully built-in. Canvas formats: 16:9 widescreen, 4:3 classic, 9:16 portrait, 1:1 square, A4 portrait/landscape, LinkedIn banner, and custom sizes.

### 🔄 Document to PPT

Supports PDF, DOCX, Markdown, HTML, and EPUB — intelligently splits content and auto-matches layouts.

## Five Workflows

| Workflow | Scenario | Trigger |
|----------|----------|---------|
| **0** | Multi-page smart routing | "make a PPT", "create a presentation" |
| **A** | Create from scratch (SVG vector) | "free layout", "highly customized" |
| **B** | Single technical diagram | "draw architecture diagram" |
| **C** | Consulting report templates | "KPI dashboard", "Gantt chart" |
| **D** | Edit existing PPT | "modify PPT", "change slide 3" |

## Comparison

| Dimension | mu-ippt | Gamma | Beautiful.ai |
|-----------|---------|-------|-------------|
| Design philosophy AI | ✅ 14 schools | ❌ | ❌ |
| Chart types | 119 | ~20 | ~30 |
| Consulting templates | 40 | ❌ | Limited |
| Edit existing PPT | ✅ | ❌ | ❌ |
| Local execution | ✅ | ❌ Cloud | ❌ Cloud |
| Open source | ✅ MIT | ❌ | ❌ |
| Cost | Free | $8-40/mo | $12-40/mo |

## Documentation

- [Full Documentation](./docs/)
- [Examples](./examples/)
- [FAQ](./docs/faq.md)
- [Contributing Guide](CONTRIBUTING.md)
- [Changelog](CHANGELOG.md)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date)](https://star-history.com/#mupoet/mu-ippt&Date)

## Author

🎓 清华大学出版社签约作家 / 2026当当影响力作家 / 某互联网大厂 AI 大模型业务 HR 砖家 / 一级人力资源管理师 / 二级心理咨询师 / 野生设计师

📚 著有[《图解团队管理》](https://item.m.jd.com/product/14547345.html)，服务客户有字节跳动、腾讯、百度、中国移动、SMG、BOE…

💡 [微信公众号](https://mp.weixin.qq.com/s/v1JSZvlN5fvbOOHvkvXEtA) / [小红书](https://xhslink.com/m/ESxtgUNMdl)：muippt

## License

[MIT](LICENSE) © 2026 木先生iPPT

## Acknowledgments

Referenced ppt-master by Hugo He · huashu-design by alchaincyf · [SVG Repo](https://www.svgrepo.com/) · [Tabler Icons](https://github.com/tabler/tabler-icons) · [Robin Williams](https://en.wikipedia.org/wiki/Robin_Williams_(author)) (CRAP principles) · McKinsey, BCG, Bain and related projects.

> Note: Much of this project was co-created with AI assistance. If you believe your work has been used without proper attribution, please open an issue.
