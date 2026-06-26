# mu-ippt · AI PPT 智能创作 Skill v1.0

[![Version](https://img.shields.io/badge/version-v1.0-blue.svg)](https://github.com/mupoet/mu-ippt/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/mupoet/mu-ippt.svg)](https://github.com/mupoet/mu-ippt/stargazers)

[English](./README.md) | 中文

<p align="center">
  <a href="./examples/"><strong>示例</strong></a> ·
  <a href="./docs/zh/faq.md"><strong>常见问题</strong></a> ·
  <a href="mailto:muippt@agent.qq.com"><strong>联系我</strong></a>
</p>

> 一个 Skill 搞定所有 PPT 场景：**从零生成** · **技术图表** · **咨询汇报模板** · **编辑已有PPT**

> 🎨 **15 种设计哲学流派** · 📊 **119 种图表** · 📐 **20 套布局模板** · 🏛️ **40 个咨询模板** · 🖼️ **6,732 个矢量图标** · 📏 **8 种画布格式**

---

## ✨ 核心亮点

### 🎨 15 种设计哲学流派

不是"模板选一个"，而是 AI 根据你的主题、受众和场景，推荐最匹配的视觉风格。每种哲学都有独特的 Visual DNA、色彩 Token 和排版逻辑：

| 流派 | Visual DNA |
|------|-----------|
| Pentagram | 极简黑白，信息优先的瑞士风格 |
| Fathom | 数据叙事，让数字自己讲故事 |
| Sagmeister | 实验先锋，打破常规的艺术表达 |
| Fukasawa | 无印良品式的克制与留白 |
| Ive | 苹果式精密工业美学 |
| Rams | 少即是多的包豪斯经典 |
| Zaha | 参数化曲线的未来建筑感 |
| Bierut | 纽约学派的优雅图形叙事 |
| Koolhaas | 大胆撞色的荷兰前卫风 |
| Tokujin | 日本极致材质感知美学 |
| Eames | 中世纪现代主义温暖几何 |
| Muller-Brockmann | 网格系统教父的数学之美 |
| Erik Spiekermann | 德式字体排印的工程精度 |
| Massimo Vignelli | 纽约地铁设计师的永恒秩序感 |

### 📊 119 种图表类型

覆盖所有常见和专业图表场景：基础（柱状图、折线图、饼图、雷达图、散点图、气泡图、面积图），进阶（瀑布图、桑基图、旭日图、树图、热力图、箱线图），商业（漏斗图、甘特图、KPI 仪表盘、组织架构图、议题树），技术（架构图、时序图、流程图、UML 类图、状态机、ER 图、部署图），数据（趋势对比、多轴图、堆叠图、分组图、带误差线图表）。

### 🏛️ 40 个咨询级专业模板

对标 McKinsey / BCG / Bain 级别的商业汇报模板：战略（SWOT 分析、波特五力、BCG 矩阵、价值链分析、蓝海战略画布），运营（甘特时间线、里程碑路线图、RACI 矩阵、流程泳道图），财务（KPI 仪表盘、收入瀑布、成本结构分解、投资回报分析），组织（组织架构图、人才九宫格、能力雷达、HRBP 诊断模型），增长（漏斗转化、用户旅程地图、增长飞轮、NPS 追踪面板）。

### 📐 20 套布局模板

预设专业级页面结构，AI 自动匹配最合适的布局：纯标题页、标题+副标题、标题+正文、双栏对比、三栏并列、四宫格、六宫格、图文左右分栏、全图背景+文字叠加、时间线、数据仪表盘、引用金句页、团队介绍、产品展示、截图演示、Q&A 页、致谢页等。

### 🖼️ 6,732 个矢量图标

全部为 SVG 矢量格式，无损缩放，全部内置在 Skill 中，无需联网下载。覆盖通用（箭头、符号、手势、人物、设备、界面元素）、行业（科技/互联网、金融/银行、医疗/健康、教育/学术、零售/电商、制造/工业、政务/公共服务）、功能（数据/图表、团队/协作、流程/工作流、安全/合规）三大类别。

### 📏 8 种画布格式

| 格式 | 用途 |
|------|------|
| 16:9 宽屏 | 默认，投影/大屏演示 |
| 4:3 经典 | 兼容老设备 |
| 9:16 竖屏 | 手机端展示/短视频封面 |
| 1:1 方图 | 社交媒体/小红书 |
| A4 纵向 | 打印文档/报告 |
| A4 横向 | 手册/画册 |
| LinkedIn 横幅 | 1584×396 |
| 自定义尺寸 | 任意像素 |

### 🤖 AI 智能配图

内置两大主流图片生成引擎：OpenAI DALL-E 3（默认，高质量写实/插画风格，语义理解强）和 Google Gemini Imagen（备选，风格多样，细节丰富）。自动根据页面主题生成配图，可关闭——不配置 API Key 则自动跳过，纯图表模式零外部依赖。

### 🔄 文档一键转 PPT

| 格式 | 说明 |
|------|------|
| PDF | 提取文字和结构，智能拆分为多页 PPT |
| DOCX/Word | 保留标题层级，自动匹配布局 |
| Markdown | 按标题分页，代码块自动高亮 |
| HTML/网页 | 抓取正文，去除噪音后转换 |
| EPUB | 按章节拆分，适合做读书笔记分享 |

---

## 🚀 五大工作流

| 工作流 | 场景 | 触发词 |
|--------|------|--------|
| 工作流 0 | 多页需求智能路由 — AI 分析需求，自动规划每页最优方案 | 做PPT、做汇报、生成演示文稿、把这个文档变成PPT |
| 工作流 A | 从零生成多页 PPT — SVG 矢量排版，像素级精确控制 | （工作流0路由后）自由排版、高度定制 |
| 工作流 B | 单张技术图表 — 架构图/流程图/UML/时序图/ER图 | 画架构图、画流程图、画UML、画时序图 |
| 工作流 C | 咨询汇报模板 — 40个专业模板即选即用，原生 Office 形状 | 咨询汇报模板、咨询PPT、KPI仪表盘、甘特图模板 |
| 工作流 D | 编辑已有 PPT — 读取现有文件，精确修改指定内容 | 改PPT、修改PPT、用这个模板做PPT |

---

## 🎯 设计哲学示例

> 📥 **[下载设计哲学展示 PPTX](./examples/design-philosophies/muippt-design-philosophies_202606.pptx)** — 31 页幻灯片，展示全部 15 种设计哲学流派，涵盖 6 大设计谱系。

每种哲学均包含 Visual DNA、色彩 Token、排版逻辑和真实生成样例。使用 PowerPoint、Keynote 或 Google Slides 打开即可浏览。

在 [examples 目录](./examples/) 中查看所有示例。

---

## 💡 使用场景示例

- 📈 **管理汇报**："把这份周报变成10页PPT，用深蓝数据叙事风"
- 🏗️ **技术分享**："画一个微服务架构图，加上部署拓扑，嵌入PPT"
- 🎓 **培训课件**："做一份新员工入职培训，20页，活泼现代风"
- 💰 **融资BP**："帮我做一份商业计划书PPT，投资人看的，用Pentagram极简风"
- 📊 **数据看板**："用KPI仪表盘模板展示Q2业绩，带趋势对比"
- ✏️ **快速修改**："把第3页标题改成xxx，配色从蓝色换成暖橙"
- 📱 **社交内容**："做一张9:16的产品介绍图，适合发朋友圈"
- 📖 **文档转PPT**："把这份10页PDF变成演示文稿"

---

## ⚙️ 技术规格

| 项目 | 说明 |
|------|------|
| Python 版本 | 3.9+ |
| 核心依赖 | python-pptx / svglib / reportlab / PyMuPDF / mammoth |
| 图片 AI | OpenAI DALL-E 3（默认）/ Google Gemini Imagen（可选） |
| 输出格式 | .pptx（兼容 PowerPoint / Keynote / WPS / Google Slides / LibreOffice） |
| 输入支持 | PDF / DOCX / HTML / EPUB / Markdown |
| 图表引擎 | SVG 原生渲染 + PlantUML（UML/架构/时序） |
| 包大小 | 14MB（含全部模板、图标、配色方案） |

---

## 🛠️ 快速开始

**第一步：安装**

```bash
pip install -r requirements.txt
```

**第二步：配置 AI 配图（可选）**

```bash
# 二选一，不配置则跳过 AI 配图功能
export OPENAI_API_KEY=sk-xxx
export GEMINI_API_KEY=AIzaXXX
```

**第三步：开始使用**

直接对 Agent 说"帮我做一份PPT"，即可触发工作流。

> 💡 不配置 API Key 也能正常使用全部图表和模板功能，仅 AI 配图功能需要。

---

## 📌 与同类工具对比

### mu-ippt vs Gamma

| 维度 | mu-ippt | Gamma |
|------|---------|-------|
| 设计哲学推荐 | ✅ 14种流派智能匹配 | ❌ 无 |
| 图表类型 | 119种 | 约20种 |
| 咨询级模板 | 40个 | ❌ 无 |
| 编辑已有PPT | ✅ 支持 | ❌ 不支持 |
| 本地运行 | ✅ 数据不出本机 | ❌ 云端处理 |
| AI 配图 | ✅ DALL-E 3 / Gemini | ✅ 内置 |
| 文档转PPT | ✅ 5种格式 | 部分支持 |
| 自定义画布 | ✅ 8种 | ❌ 仅16:9 |
| 矢量图标库 | 6,732个 | ❌ 无 |
| 质量自检 | ✅ 自动验证 | ❌ 无 |
| 开源可控 | ✅ MIT | ❌ 闭源 |
| 离线可用 | ✅ | ❌ |
| 费用 | 免费 | $8-40/月 |

### mu-ippt vs Beautiful.ai

| 维度 | mu-ippt | Beautiful.ai |
|------|---------|-------------|
| 设计哲学推荐 | ✅ 14种流派智能匹配 | ❌ 无 |
| 图表类型 | 119种 | 约30种 |
| 咨询级模板 | 40个 | 有限 |
| 编辑已有PPT | ✅ 支持 | ❌ 不支持 |
| 本地运行 | ✅ 数据不出本机 | ❌ 云端处理 |
| AI 配图 | ✅ DALL-E 3 / Gemini | ❌ 无 |
| 文档转PPT | ✅ 5种格式 | ❌ 不支持 |
| 自定义画布 | ✅ 8种 | ❌ 有限 |
| 矢量图标库 | 6,732个 | 有限 |
| 质量自检 | ✅ 自动验证 | ❌ 无 |
| 开源可控 | ✅ MIT | ❌ 闭源 |
| 离线可用 | ✅ | ❌ |
| 费用 | 免费 | $12-40/月 |

### mu-ippt vs 传统模板网站（Canva / iSlide / 稻壳等）

| 维度 | mu-ippt | 传统模板网站 |
|------|---------|-------------|
| 设计哲学推荐 | ✅ AI智能匹配 | ❌ 手动翻找 |
| 图表类型 | 119种自动生成 | 看模板，需手动改数据 |
| 咨询级模板 | 40个专业模板 | 少量，质量参差 |
| 编辑已有PPT | ✅ AI精确修改 | ❌ 只能下载新模板 |
| AI驱动 | ✅ 全流程AI | ❌ 纯手动 |
| AI 配图 | ✅ 自动生成 | ❌ 需自己找图 |
| 文档转PPT | ✅ 5种格式 | ❌ 不支持 |
| 质量自检 | ✅ 自动验证 | ❌ 全靠肉眼 |
| 开源可控 | ✅ MIT | ❌ 平台依赖 |
| 费用 | 免费 | 免费-付费 |

---

## 🔒 安全与隐私

100% 本地运行，所有数据处理在本机完成。仅 AI 配图功能调用外部 API（可通过不配置 Key 完全关闭）。无遥测、无数据采集、无使用追踪。不依赖任何云端服务或订阅。MIT License 开源友好，可自由修改和分发。

---

## 关于作者

💡 清华大学出版社签约作家 / 2026当当影响力作家 / 某互联网大厂AI大模型业务HR砖家 / 一级人力资源管理师 / 二级心理咨询师 / 野生设计师。

📚 著有《图解团队管理》，服务客户有字节、腾讯、百度、移动、SMG、BOE……

📧 [muippt@agent.qq.com](mailto:muippt@agent.qq.com) · 🐙 [@mupoet](https://github.com/mupoet)

---

## 贡献

详见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

## 开源协议

[MIT](LICENSE)

## 致谢

基于 ppt-master by Hugo He · 设计哲学体系源自 huashu-design by alchaincyf · [SVG Repo](https://www.svgrepo.com/) · [Tabler Icons](https://github.com/tabler/tabler-icons) · [Robin Williams](https://en.wikipedia.org/wiki/Robin_Williams_(author))（CRAP 设计原则）· 麦肯锡、BCG、贝恩

声明： 本项目大量内容由 AI 协同创作完成，部分引用素材可能未被完全识别。如果您发现您的作品被使用但未获得适当署名，请提交 Issue，我们会立即添加致谢。

## 联系与合作

- 💬 **提问与分享** — [GitHub Discussions](https://github.com/mupoet/mu-ippt/discussions)
- 🐛 **Bug 反馈与功能建议** — [GitHub Issues](https://github.com/mupoet/mu-ippt/issues)
- 📧 **商务 / 咨询 / 定制合作** — [muippt@agent.qq.com](mailto:muippt@agent.qq.com)

---

## Star History

如果这个项目对你有帮助，请给一个 ⭐！

<a href="https://star-history.com/#mupoet/mu-ippt&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date" />
 </picture>
</a>

---

> 一句话总结：不是"AI帮你选模板"，是"AI像设计师一样从零为你创作PPT"。

---

版本：v1.0 | 协议：MIT License

Made with ❤️ by [木先生iPPT](https://github.com/mupoet)

[⬆ 回到顶部](#mu-ippt--ai-ppt-智能创作-skill-v10)
