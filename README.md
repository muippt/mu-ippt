# mu-ippt · AI PPT Intelligent Creation Skill v1.0

[![Version](https://img.shields.io/badge/version-v1.0-blue.svg)](https://github.com/mupoet/mu-ippt/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/mupoet/mu-ippt.svg)](https://github.com/mupoet/mu-ippt/stargazers)

English | [中文](./README_CN.md)

<p align="center">
  <a href="./examples/"><strong>Examples</strong></a> ·
  <a href="./docs/faq.md"><strong>FAQ</strong></a> ·
  <a href="mailto:muippt@agent.qq.com"><strong>Contact</strong></a>
</p>

> One Skill for all PPT scenarios: **Create from scratch** · **Technical diagrams** · **Consulting report templates** · **Edit existing PPT**

> 🎨 **14 Design Philosophies** · 📊 **119 Chart Types** · 📐 **20 Layout Templates** · 🏛️ **40 Consulting Templates** · 🖼️ **6,732 Vector Icons** · 📏 **8 Canvas Formats**

---

## ✨ Core Highlights

### 🎨 14 Design Philosophy Schools

Not "pick a template" — the AI recommends the best visual style based on your topic, audience, and context. Each philosophy has unique Visual DNA, color tokens, and typography logic:

| School | Visual DNA |
|--------|-----------|
| Pentagram | Minimalist black & white, Swiss-style information-first |
| Fathom | Data storytelling, letting numbers speak for themselves |
| Sagmeister | Experimental avant-garde, rule-breaking artistic expression |
| Fukasawa | MUJI-style restraint and white space |
| Ive | Apple-inspired precision industrial aesthetics |
| Rams | Less-is-more Bauhaus classics |
| Zaha | Parametric curves with futuristic architectural feel |
| Bierut | Elegant graphic narrative from the New York school |
| Koolhaas | Bold color-clashing Dutch avant-garde |
| Tokujin | Japanese ultimate material perception aesthetics |
| Eames | Mid-century modernist warm geometry |
| Muller-Brockmann | Mathematical beauty from the father of grid systems |
| Erik Spiekermann | German typographic engineering precision |
| Massimo Vignelli | Timeless order from the NYC subway designer |

### 📊 119 Chart Types

Covering all common and professional chart scenarios: basic charts (bar, line, pie, radar, scatter, bubble, area), advanced charts (waterfall, Sankey, sunburst, treemap, heatmap, box plot), business charts (funnel, Gantt, KPI dashboard, org chart, issue tree), technical diagrams (architecture, sequence, flowchart, UML class, state machine, ER, deployment), and data charts (trend comparison, multi-axis, stacked, grouped, error bar charts).

### 🏛️ 40 Consulting-Grade Templates

Benchmarked against McKinsey / BCG / Bain level business reporting templates: strategy (SWOT, Porter's Five Forces, BCG Matrix, Value Chain, Blue Ocean Canvas), operations (Gantt timeline, milestone roadmap, RACI matrix, swimlane flowchart), finance (KPI dashboard, revenue waterfall, cost structure breakdown, ROI analysis), organization (org chart, talent 9-box, capability radar, HRBP diagnostic model), and growth (funnel conversion, user journey map, growth flywheel, NPS tracking panel).

### 📐 20 Layout Templates

Pre-designed professional page structures — AI automatically matches the best layout: title page, title + subtitle, title + body, two-column comparison, three-column parallel, 4-grid, 6-grid, image-text split, full-image background + text overlay, timeline, data dashboard, quote page, team intro, product showcase, screenshot demo, Q&A page, thank-you page, and more.

### 🖼️ 6,732 Vector Icons

All SVG vector format, lossless scaling, fully built into the Skill — no internet download required. Covers general (arrows, symbols, gestures, people, devices, UI elements), industry-specific (tech, finance, medical, education, retail, manufacturing, government), and functional (data/charts, team/collaboration, process/workflow, security/compliance) categories.

### 📏 8 Canvas Formats

| Format | Use Case |
|--------|----------|
| 16:9 Widescreen | Default, projection/large screen |
| 4:3 Classic | Legacy device compatible |
| 9:16 Portrait | Mobile display / short video covers |
| 1:1 Square | Social media / Xiaohongshu |
| A4 Portrait | Printed documents / reports |
| A4 Landscape | Brochures / booklets |
| LinkedIn Banner | 1584×396 |
| Custom Size | Any pixel dimensions |

### 🤖 AI Image Generation

Built-in support for two major image generation engines: OpenAI DALL-E 3 (default, high-quality realistic/illustration style) and Google Gemini Imagen (alternative, diverse styles). Automatically generates images based on page themes. Can be disabled — skip AI image generation entirely without configuring an API key.

### 🔄 Document to PPT Conversion

| Format | Description |
|--------|-------------|
| PDF | Extracts text and structure, intelligently splits into multi-page PPT |
| DOCX/Word | Preserves heading hierarchy, auto-matches layouts |
| Markdown | Splits by headings, auto-highlights code blocks |
| HTML/Web | Extracts body content, removes noise before conversion |
| EPUB | Splits by chapters, great for book note sharing |

---

## 🚀 Five Workflows

| Workflow | Scenario | Trigger Words |
|----------|----------|---------------|
| Workflow 0 | Multi-page smart routing — AI analyzes requirements, plans optimal approach per page | "make a PPT", "create a presentation", "turn this document into PPT" |
| Workflow A | Create multi-page PPT from scratch — SVG vector layout, pixel-perfect control | (after Workflow 0 routing) "free layout", "highly customized" |
| Workflow B | Single technical diagram — architecture/flowchart/UML/sequence/ER diagram | "draw an architecture diagram", "draw a flowchart" |
| Workflow C | Consulting report templates — 40 professional templates, native Office shapes | "consulting report template", "KPI dashboard", "Gantt chart template" |
| Workflow D | Edit existing PPT — read existing files, precisely modify specified content | "edit PPT", "modify PPT", "use this template to make a PPT" |

---

## 💡 Usage Examples

- 📈 **Management Report**: "Turn this weekly report into a 10-page PPT with deep blue data narrative style"
- 🏗️ **Tech Sharing**: "Draw a microservices architecture diagram with deployment topology, embed in PPT"
- 🎓 **Training Materials**: "Create a 20-page new employee onboarding training, modern and lively style"
- 💰 **Pitch Deck**: "Make a business plan PPT for investors, use Pentagram minimalist style"
- 📊 **Data Dashboard**: "Use KPI dashboard template to show Q2 performance with trend comparison"
- ✏️ **Quick Edit**: "Change the title on page 3 to xxx, switch colors from blue to warm orange"
- 📱 **Social Content**: "Make a 9:16 product intro image for sharing on social media"
- 📖 **Document to PPT**: "Turn this 10-page PDF into a presentation"

---

## ⚙️ Technical Specs

| Item | Description |
|------|-------------|
| Python Version | 3.9+ |
| Core Dependencies | python-pptx / svglib / reportlab / PyMuPDF / mammoth |
| Image AI | OpenAI DALL-E 3 (default) / Google Gemini Imagen (optional) |
| Output Format | .pptx (compatible with PowerPoint / Keynote / WPS / Google Slides / LibreOffice) |
| Input Support | PDF / DOCX / HTML / EPUB / Markdown |
| Chart Engine | SVG native rendering + PlantUML (UML/architecture/sequence) |
| Package Size | 14MB (includes all templates, icons, color schemes) |

---

## 🛠️ Quick Start

**Step 1: Install**

```bash
pip install -r requirements.txt
```

**Step 2: Configure AI Image Generation (Optional)**

```bash
# Choose one — skip this step to use all chart and template features without AI images
export OPENAI_API_KEY=sk-xxx
export GEMINI_API_KEY=AIzaXXX
```

**Step 3: Start Using**

Just tell the AI "help me make a PPT" to trigger the workflow.

> 💡 All chart and template features work without an API key — only AI image generation requires one.

---

## 📌 Comparison with Alternatives

### mu-ippt vs Gamma

| Dimension | mu-ippt | Gamma |
|-----------|---------|-------|
| Design philosophy recommendation | ✅ 14 schools, AI-matched | ❌ None |
| Chart types | 119 | ~20 |
| Consulting-grade templates | 40 | ❌ None |
| Edit existing PPT | ✅ Supported | ❌ Not supported |
| Local execution | ✅ Data stays on your machine | ❌ Cloud processing |
| AI image generation | ✅ DALL-E 3 / Gemini | ✅ Built-in |
| Document to PPT | ✅ 5 formats | Partial |
| Custom canvas | ✅ 8 formats | ❌ 16:9 only |
| Vector icon library | 6,732 | ❌ None |
| Quality checks | ✅ Auto-verification | ❌ None |
| Open source | ✅ MIT | ❌ Closed source |
| Offline capable | ✅ | ❌ |
| Cost | Free | $8-40/month |

---

## 🔒 Security & Privacy

100% local execution — all data processing happens on your machine. Only AI image generation calls external APIs (can be completely disabled by not configuring a key). No telemetry, no data collection, no usage tracking. No dependency on any cloud service or subscription.

---

## About the Author

💡 Signatory author of Tsinghua University Press · 2026 Dangdang Influential Author · AI & Large Model HR specialist at a leading tech company · National Level-1 HR Manager · Level-2 Psychological Counselor · Self-taught designer.

📚 Author of *Erta-style Team Management*. Clients include ByteDance, Tencent, Baidu, China Mobile, SMG, BOE, and more.

📧 [muippt@agent.qq.com](mailto:muippt@agent.qq.com) · 🐙 [@mupoet](https://github.com/mupoet)

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to get involved.

## License

[MIT](LICENSE)

## Acknowledgments

Based on ppt-master by Hugo He · Design philosophy system inspired by huashu-design by alchaincyf · [SVG Repo](https://www.svgrepo.com/) · [Tabler Icons](https://github.com/tabler/tabler-icons) · [Robin Williams](https://en.wikipedia.org/wiki/Robin_Williams_(author)) (CRAP principles) · McKinsey, BCG, Bain

Note: Much of this project was co-created with AI assistance. Some referenced materials may not have been fully identified. If you believe your work has been used without proper attribution, please open an issue and we'll add the credit promptly.

## Contact & Collaboration

- 💬 **Questions & sharing** — [GitHub Discussions](https://github.com/mupoet/mu-ippt/discussions)
- 🐛 **Bug reports & feature requests** — [GitHub Issues](https://github.com/mupoet/mu-ippt/issues)
- 📧 **Business & consulting inquiries** — [muippt@agent.qq.com](mailto:muippt@agent.qq.com)

---

## Star History

If this project helps you, please give it a ⭐!

<a href="https://star-history.com/#mupoet/mu-ippt&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date" />
 </picture>
</a>

---

> One line summary: Not "AI helps you pick a template" — it's "AI creates PPT for you from scratch like a designer."

---

Made with ❤️ by [木先生iPPT](https://github.com/mupoet)

[⬆ Back to Top](#mu-ippt--ai-ppt-intelligent-creation-skill-v10)
