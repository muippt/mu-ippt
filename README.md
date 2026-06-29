<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/default-banner.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/default-banner.png">
    <img alt="mu-ippt" src="assets/default-banner.png" width="100%">
  </picture>
</p>

# mu-ippt

> AI-powered PPT creation skill that designs presentations from scratch like a professional designer — for anyone who needs polished slides without design skills.

**English** | [中文](README_CN.md) | [🌐 Landing Page](https://mupoet.github.io/mu-ippt/)

[![License](https://img.shields.io/github/license/mupoet/mu-ippt)](LICENSE)
[![Stars](https://img.shields.io/github/stars/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/stargazers)
[![Version](https://img.shields.io/github/v/release/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/releases)

## 💡 Usage Examples

- 📈 **Management Report**: "Turn this weekly report into a 10-page PPT with Fathom data storytelling style"
- 🏗️ **Tech Sharing**: "Draw a microservices architecture diagram with deployment topology, embed into PPT"
- 🎓 **Training Materials**: "Create a 20-page new hire onboarding deck, lively modern style"
- 💰 **Pitch Deck**: "Make a business plan PPT for investors, Pentagram minimalist style"
- 📊 **Data Dashboard**: "Use the KPI dashboard template to show Q2 results with trend comparison"
- ✏️ **Quick Edits**: "Change the title on slide 3 to xxx, switch colors from blue to warm orange"
- 📱 **Social Content**: "Make a 9:16 product intro image for sharing on social media"
- 📖 **Document to PPT**: "Convert this 10-page PDF into a presentation"

## Features

### 🎨 15 Design Philosophy Schools

Not "pick a template" — the AI recommends the best visual style based on your topic, audience, and context. Each philosophy has unique Visual DNA, color tokens, and typography logic.

| School | Visual DNA |
|--------|-----------|
| Pentagram | Minimalist black & white, Swiss-style information-first |
| Fathom | Data storytelling, letting numbers speak |
| Müller-Brockmann | Mathematical beauty from the father of grid systems |
| Tufte | Above all else, show the data — maximum data-ink ratio |
| Field.io | Generative dynamics — computational aesthetics as art |
| Sagmeister | Emotional maximalism, rule-breaking artistic expression |
| Build | Extreme minimalism — less, but better |
| Notion | Functional minimalism — beautifully organized documents |
| Apple | Cinematic minimalism — spotlight on one product |
| Instrumental | Geometric precision — shapes as both structure and ornament |
| Olschinsky | Digital collage — richness through layered complexity |
| Takram | Eastern design thinking — hand-drawn warmth meets precision |
| Kenya Hara | Emptiness as fullness — the power of not showing |
| Fukasawa | Without Thought — invisible craftsmanship, effortless design |
| + Smart Routing | AI matches the best philosophy based on audience, topic, and context |

> 📥 **[Download the showcase PPTX](./examples/design-philosophies/muippt-design-philosophies_202606.pptx)** — 31 slides demonstrating all 15 philosophies.

### 📊 119 Chart Types

From basic charts to advanced visualizations, consulting diagrams, and technical diagrams:

- **Basic**: Bar, line, pie, radar, scatter, bubble, area
- **Advanced**: Waterfall, Sankey, sunburst, treemap, heatmap, box plot
- **Business**: Funnel, Gantt, KPI dashboard, org chart, issue tree
- **Technical**: Architecture, sequence, flowchart, UML class, state machine, ER, deployment
- **Data**: Trend comparison, multi-axis, stacked, grouped, error bar charts

### 🏛️ 40 Consulting-Grade Templates

Benchmarked against McKinsey / BCG / Bain:

- **Strategy**: SWOT, Porter's Five Forces, BCG Matrix, Value Chain, Blue Ocean Canvas
- **Operations**: Gantt Timeline, Milestone Roadmap, RACI Matrix, Swimlane Flowchart
- **Finance**: KPI Dashboard, Revenue Waterfall, Cost Structure, ROI Analysis
- **Organization**: Org Chart, Talent 9-Box, Competency Radar, HRBP Diagnostic
- **Growth**: Funnel Conversion, User Journey Map, Growth Flywheel, NPS Tracker

### 🖼️ 6,732 Vector Icons

All SVG vector, lossless scaling, fully built-in, no internet needed:

- **General**: Arrows, symbols, gestures, people, devices, UI elements
- **Industry**: Tech, finance, healthcare, education, retail, manufacturing, government
- **Functional**: Data/charts, team/collaboration, process/workflow, security/compliance

### 📏 8 Canvas Formats

| Format | Use Case |
|--------|----------|
| 16:9 Widescreen | Default, projector/large screen |
| 4:3 Classic | Legacy device compatible |
| 9:16 Portrait | Mobile display / short video covers |
| 1:1 Square | Social media / Xiaohongshu |
| A4 Portrait | Printed documents / reports |
| A4 Landscape | Handbooks / brochures |
| LinkedIn Banner | 1584×396 |
| Custom Size | Any pixel dimensions |

### 📐 20 Layout Templates

Pre-built professional page structures, AI auto-matches the best layout: title page, title + subtitle, title + body, dual column comparison, triple column, 4-grid, 6-grid, image-text split, full-image background + text overlay, timeline, data dashboard, quote page, team intro, product showcase, screenshot demo, Q&A page, thank you page, and more.

### 🎨 26 Color Schemes

12 design-style palettes + 14 industry-specific palettes:

- **Style**: Minimal Gray, Tech Blue, Natural Green, Warm Orange, Premium Gold, Academic Indigo
- **Industry**: Finance Blue, Medical White, Education Orange, Tech Purple, Consumer Pink, Government Red, Energy Green, Creative Art

### 🔄 Document to PPT

| Format | Description |
|--------|------------|
| PDF | Extracts text and structure, intelligently splits into multi-page PPT |
| DOCX/Word | Preserves heading hierarchy, auto-matches layouts |
| Markdown | Splits by headings, code blocks auto-highlighted |
| HTML/Web | Extracts body content, removes noise before conversion |
| EPUB | Splits by chapters, great for reading note presentations |

### 🤖 AI Image Generation

Built-in two major image generation engines:

- **OpenAI DALL-E 3** (default): High-quality realistic/illustration style, strong semantic understanding
- **Google Gemini Imagen** (alternative): Diverse styles, rich details
- Auto-generates images based on slide themes, supports style prompts (realistic/flat/3D/watercolor/line art)
- Can be disabled: skip AI images entirely by not configuring API keys — zero external dependencies

### 🛡️ Quality Assurance

Every PPT is automatically verified before delivery:

- `visual_verify.py` auto-checks: font overflow, element out-of-bounds, color consistency, icon missing
- **Single Color Scheme Rule**: one PPT = one color scheme, no mixing
- **Single Icon Library Rule**: one PPT = one icon library, consistent style
- **Mixed Workflow Auto-alignment**: A+C workflow merges auto-unify color schemes

## Five Workflows

| Workflow | Scenario | Trigger |
|----------|----------|---------|
| **0** | Multi-page smart routing — AI analyzes requirements, plans optimal approach per page | "make a PPT", "create a presentation", "turn this into PPT" |
| **A** | Create from scratch (SVG vector) — pixel-perfect control, full design philosophy support | "free layout", "highly customized", "from scratch" |
| **B** | Single technical diagram — architecture/flowchart/UML/sequence/ER, PlantUML + SVG dual engine | "draw architecture diagram", "flowchart", "UML" |
| **C** | Consulting report templates — 40 professional templates, native Office shapes | "KPI dashboard", "Gantt chart", "consulting template" |
| **D** | Edit existing PPT — read existing files, precise modification, preserve original design | "modify PPT", "change slide 3", "use this template" |

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

## Comparison

### mu-ippt vs Gamma

| Dimension | mu-ippt | Gamma |
|-----------|---------|-------|
| Design Philosophy AI | ✅ 15 schools | ❌ |
| Chart Types | 119 | ~20 |
| Consulting Templates | 40 | ❌ |
| Edit Existing PPT | ✅ | ❌ |
| Local Execution | ✅ Data stays local | ❌ Cloud |
| AI Images | ✅ DALL-E 3 / Gemini | ✅ Built-in |
| Document → PPT | ✅ 5 formats | Partial |
| Custom Canvas | ✅ 8 formats | ❌ 16:9 only |
| Vector Icons | 6,732 | ❌ |
| Quality Checks | ✅ Auto-verify | ❌ |
| Open Source | ✅ MIT | ❌ |
| Offline | ✅ | ❌ |
| Cost | Free | $8-40/mo |

### mu-ippt vs Beautiful.ai

| Dimension | mu-ippt | Beautiful.ai |
|-----------|---------|-------------|
| Design Philosophy AI | ✅ 15 schools | ❌ |
| Chart Types | 119 | ~30 |
| Consulting Templates | 40 | Limited |
| Edit Existing PPT | ✅ | ❌ |
| Local Execution | ✅ Data stays local | ❌ Cloud |
| AI Images | ✅ DALL-E 3 / Gemini | ❌ |
| Document → PPT | ✅ 5 formats | ❌ |
| Custom Canvas | ✅ 8 formats | Limited |
| Vector Icons | 6,732 | Limited |
| Quality Checks | ✅ Auto-verify | ❌ |
| Open Source | ✅ MIT | ❌ |
| Offline | ✅ | ❌ |
| Cost | Free | $12-40/mo |

### mu-ippt vs Traditional Template Sites (Canva / iSlide / etc.)

| Dimension | mu-ippt | Traditional Sites |
|-----------|---------|-------------------|
| Design Philosophy AI | ✅ AI smart matching | ❌ Manual browsing |
| Chart Types | 119, auto-generated | Template-dependent, manual data |
| Consulting Templates | 40 professional | Few, inconsistent quality |
| Edit Existing PPT | ✅ AI precise editing | ❌ Download new templates only |
| AI-Driven | ✅ Full-process AI | ❌ Fully manual |
| AI Images | ✅ Auto-generated | ❌ Find images yourself |
| Document → PPT | ✅ 5 formats | ❌ |
| Quality Checks | ✅ Auto-verify | ❌ Manual inspection |
| Open Source | ✅ MIT | ❌ Platform-dependent |
| Cost | Free | Free–Paid |

## 🔒 Security & Privacy

- 100% local execution, all data processing happens on your machine
- Only AI image generation calls external APIs (can be fully disabled by not configuring API keys)
- No telemetry, no data collection, no usage tracking
- No dependency on any cloud service or subscription
- MIT License, free to modify and distribute

## ⚙️ Technical Specs

| Item | Description |
|------|------------|
| Runtime | OpenClaw framework (native support, compatible with all OpenClaw deployment methods) |
| Python | 3.9+ |
| Core Dependencies | python-pptx / svglib / reportlab / PyMuPDF / mammoth |
| Image AI | OpenAI DALL-E 3 (default) / Google Gemini Imagen (optional) |
| Output Format | .pptx (compatible with PowerPoint / Keynote / WPS / Google Slides / LibreOffice) |
| Input Support | PDF / DOCX / HTML / EPUB / Markdown |
| Chart Engine | SVG native rendering + PlantUML (UML/architecture/sequence) |
| Package Size | 14MB (includes all templates, icons, color schemes) |

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
