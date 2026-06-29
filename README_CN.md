<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/default-banner.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/default-banner.png">
    <img alt="mu-ippt" src="assets/default-banner.png" width="100%">
  </picture>
</p>

# mu-ippt

> AI 驱动的 PPT 智能创作工具——像设计师一样从零为你创作演示文稿，让没有设计基础的人也能做出专业幻灯片。

[English](README.md) | **中文** | [🌐 在线主页](https://mupoet.github.io/mu-ippt/)

[![License](https://img.shields.io/github/license/mupoet/mu-ippt)](LICENSE)
[![Stars](https://img.shields.io/github/stars/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/stargazers)
[![Version](https://img.shields.io/github/v/release/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/releases)

## 💡 使用场景示例

- 📈 **管理汇报**："把这份周报变成10页PPT，用深蓝数据叙事风"
- 🏗️ **技术分享**："画一个微服务架构图，加上部署拓扑，嵌入PPT"
- 🎓 **培训课件**："做一份新员工入职培训，20页，活泼现代风"
- 💰 **融资BP**："帮我做一份商业计划书PPT，投资人看的，用Pentagram极简风"
- 📊 **数据看板**："用KPI仪表盘模板展示Q2业绩，带趋势对比"
- ✏️ **快速修改**："把第3页标题改成xxx，配色从蓝色换成暖橙"
- 📱 **社交内容**："做一张9:16的产品介绍图，适合发朋友圈"
- 📖 **文档转PPT**："把这份10页PDF变成演示文稿"

## 功能特性

### 🎨 15 种设计哲学流派

不是"模板选一个"，而是 AI 根据你的主题、受众和场景，推荐最匹配的视觉风格。每种哲学都有独特的 Visual DNA、色彩 Token 和排版逻辑。

| 流派 | Visual DNA |
|------|-----------|
| Pentagram | 极简黑白，信息优先的瑞士风格 |
| Fathom | 数据叙事，让数字自己讲故事 |
| Müller-Brockmann | 网格系统之父的数学之美 |
| Tufte | 首要原则：展示数据——最大化数据墨水比 |
| Field.io | 生成动力学——计算美学即艺术 |
| Sagmeister | 情感极繁主义，打破规则的艺术表达 |
| Build | 极致简约——少即是多 |
| Notion | 功能极简——优雅有序的文档 |
| Apple | 电影级极简——聚焦单一产品 |
| Instrumental | 几何精度——形状既是结构也是装饰 |
| Olschinsky | 数字拼贴——层叠复杂性中的丰富 |
| Takram | 东方设计思维——手绘温度与精确并存 |
| Kenya Hara | 空即是满——不展示的力量 |
| Fukasawa | 无意识设计——看不见的匠心，毫不费力的美 |
| + 智能选型 | AI 根据受众、主题和场景自动匹配最佳哲学 |

> 📥 **[下载设计哲学展示 PPTX](./examples/design-philosophies/muippt-design-philosophies_202606.pptx)** — 31 页幻灯片，展示全部 15 种设计哲学。

### 📊 119 种图表类型

从基础图表到高级可视化、咨询图表和技术图：

- **基础**：柱状图、折线图、饼图、雷达图、散点图、气泡图、面积图
- **进阶**：瀑布图、桑基图、旭日图、树图、热力图、箱线图
- **商业**：漏斗图、甘特图、KPI 仪表盘、组织架构图、议题树
- **技术**：架构图、时序图、流程图、UML 类图、状态机、ER 图、部署图
- **数据**：趋势对比、多轴图、堆叠图、分组图、带误差线图表

### 🏛️ 40 个咨询级专业模板

对标 McKinsey / BCG / Bain：

- **战略**：SWOT 分析、波特五力、BCG 矩阵、价值链分析、蓝海战略画布
- **运营**：甘特时间线、里程碑路线图、RACI 矩阵、流程泳道图
- **财务**：KPI 仪表盘、收入瀑布、成本结构分解、投资回报分析
- **组织**：组织架构图、人才九宫格、能力雷达、HRBP 诊断模型
- **增长**：漏斗转化、用户旅程地图、增长飞轮、NPS 追踪面板

### 🖼️ 6,732 个矢量图标

全部 SVG 矢量格式，无损缩放，全部内置，无需联网：

- **通用**：箭头、符号、手势、人物、设备、界面元素
- **行业**：科技、金融、医疗、教育、零售、制造、政务
- **功能**：数据/图表、团队/协作、流程/工作流、安全/合规

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

### 📐 20 套布局模板

预设专业级页面结构，AI 自动匹配最合适的布局：纯标题页、标题+副标题、标题+正文、双栏对比、三栏并列、四宫格、六宫格、图文左右分栏、全图背景+文字叠加、时间线、数据仪表盘、引用金句页、团队介绍、产品展示、截图演示、Q&A 页、致谢页等。

### 🎨 26 套配色方案

12 种设计风格配色 + 14 种行业专属配色：

- **风格类**：极简灰、科技蓝、自然绿、暖阳橙、高端金、学术靛
- **行业类**：金融稳重蓝、医疗洁净白、教育活力橙、科技渐变紫、消费时尚粉、政务庄重红、能源环保绿、文创艺术撞色

### 🔄 文档一键转 PPT

| 格式 | 说明 |
|------|------|
| PDF | 提取文字和结构，智能拆分为多页 PPT |
| DOCX/Word | 保留标题层级，自动匹配布局 |
| Markdown | 按标题分页，代码块自动高亮 |
| HTML/网页 | 抓取正文，去除噪音后转换 |
| EPUB | 按章节拆分，适合做读书笔记分享 |

### 🤖 AI 智能配图

内置两大主流图片生成引擎：

- **OpenAI DALL-E 3**（默认）：高质量写实/插画风格，语义理解强
- **Google Gemini Imagen**（备选）：风格多样，细节丰富
- 自动根据页面主题生成配图，支持指定风格提示词（写实/扁平/3D/水彩/线描等）
- 可关闭：不配置 API Key 则自动跳过，纯图表模式零外部依赖

### 🛡️ 质量保障机制

每份 PPT 交付前自动执行质量检查：

- `visual_verify.py` 自动验证：字体溢出、元素越界、配色一致性、图标缺失
- **单一配色铁律**：一份 PPT 只用一套配色方案，禁止混搭
- **单一图标库铁律**：一份 PPT 只用一个图标库，风格统一
- **混合方案自动对齐**：A+C 工作流合并时自动统一配色

## 五大工作流

| 工作流 | 场景 | 触发词 |
|--------|------|--------|
| **0** | 多页需求智能路由——AI 分析需求，自动规划每页最优方案 | "做PPT"、"做汇报"、"把这个文档变成PPT" |
| **A** | 从零生成（SVG 矢量排版）——像素级精确控制，完整设计哲学支持 | "自由排版"、"高度定制"、"从零开始" |
| **B** | 单张技术图表——架构图/流程图/UML/时序图/ER图，PlantUML + SVG 双引擎 | "画架构图"、"画流程图"、"画UML" |
| **C** | 咨询汇报模板——40个专业模板即选即用，原生 Office 形状 | "咨询模板"、"KPI仪表盘"、"甘特图模板" |
| **D** | 编辑已有 PPT——读取现有文件，精确修改，保留原有设计 | "改PPT"、"修改第3页"、"用这个模板" |

## 快速开始

**第一步：安装**

```bash
pip install -r requirements.txt
```

**第二步：配置 AI 配图（可选）**

```bash
# 二选一，不配置则跳过 AI 配图
export OPENAI_API_KEY=sk-xxx
# 或
export GEMINI_API_KEY=AIzaXXX
```

**第三步：开始使用**

对 Agent 说"帮我做一份PPT"，即可触发工作流。

> 不配置 API Key 也能正常使用全部图表和模板功能，仅 AI 配图需要。

## 与同类工具对比

### mu-ippt vs Gamma

| 维度 | mu-ippt | Gamma |
|------|---------|-------|
| 设计哲学 AI 推荐 | ✅ 15 种流派 | ❌ |
| 图表类型 | 119 种 | 约 20 种 |
| 咨询级模板 | 40 个 | ❌ |
| 编辑已有 PPT | ✅ | ❌ |
| 本地运行 | ✅ 数据不出本机 | ❌ 云端 |
| AI 配图 | ✅ DALL-E 3 / Gemini | ✅ 内置 |
| 文档转 PPT | ✅ 5 种格式 | 部分支持 |
| 自定义画布 | ✅ 8 种 | ❌ 仅 16:9 |
| 矢量图标库 | 6,732 个 | ❌ |
| 质量自检 | ✅ 自动验证 | ❌ |
| 开源 | ✅ MIT | ❌ |
| 离线可用 | ✅ | ❌ |
| 费用 | 免费 | $8-40/月 |

### mu-ippt vs Beautiful.ai

| 维度 | mu-ippt | Beautiful.ai |
|------|---------|-------------|
| 设计哲学 AI 推荐 | ✅ 15 种流派 | ❌ |
| 图表类型 | 119 种 | 约 30 种 |
| 咨询级模板 | 40 个 | 有限 |
| 编辑已有 PPT | ✅ | ❌ |
| 本地运行 | ✅ 数据不出本机 | ❌ 云端 |
| AI 配图 | ✅ DALL-E 3 / Gemini | ❌ |
| 文档转 PPT | ✅ 5 种格式 | ❌ |
| 自定义画布 | ✅ 8 种 | 有限 |
| 矢量图标库 | 6,732 个 | 有限 |
| 质量自检 | ✅ 自动验证 | ❌ |
| 开源 | ✅ MIT | ❌ |
| 离线可用 | ✅ | ❌ |
| 费用 | 免费 | $12-40/月 |

### mu-ippt vs 传统模板网站（Canva / iSlide / 稻壳等）

| 维度 | mu-ippt | 传统模板网站 |
|------|---------|-------------|
| 设计哲学推荐 | ✅ AI 智能匹配 | ❌ 手动翻找 |
| 图表类型 | 119 种自动生成 | 看模板，需手动改数据 |
| 咨询级模板 | 40 个专业模板 | 少量，质量参差 |
| 编辑已有 PPT | ✅ AI 精确修改 | ❌ 只能下载新模板 |
| AI 驱动 | ✅ 全流程 AI | ❌ 纯手动 |
| AI 配图 | ✅ 自动生成 | ❌ 需自己找图 |
| 文档转 PPT | ✅ 5 种格式 | ❌ |
| 质量自检 | ✅ 自动验证 | ❌ 全靠肉眼 |
| 开源可控 | ✅ MIT | ❌ 平台依赖 |
| 费用 | 免费 | 免费-付费 |

## 🔒 安全与隐私

- 100% 本地运行，所有数据处理在本机完成
- 仅 AI 配图功能调用外部 API（可通过不配置 Key 完全关闭）
- 无遥测、无数据采集、无使用追踪
- 不依赖任何云端服务或订阅
- MIT License 开源友好，可自由修改和分发

## ⚙️ 技术规格

| 项目 | 说明 |
|------|------|
| 运行环境 | OpenClaw 框架（原生支持，兼容所有 OpenClaw 部署方式） |
| Python 版本 | 3.9+ |
| 核心依赖 | python-pptx / svglib / reportlab / PyMuPDF / mammoth |
| 图片 AI | OpenAI DALL-E 3（默认）/ Google Gemini Imagen（可选） |
| 输出格式 | .pptx（兼容 PowerPoint / Keynote / WPS / Google Slides / LibreOffice） |
| 输入支持 | PDF / DOCX / HTML / EPUB / Markdown |
| 图表引擎 | SVG 原生渲染 + PlantUML（UML/架构/时序） |
| 包大小 | 14MB（含全部模板、图标、配色方案） |

## 文档

- [完整文档](./docs/)
- [示例](./examples/)
- [常见问题](./docs/zh/faq.md)
- [贡献指南](CONTRIBUTING.md)
- [更新日志](CHANGELOG.md)

## Star 趋势

[![Star History Chart](https://api.star-history.com/svg?repos=mupoet/mu-ippt&type=Date)](https://star-history.com/#mupoet/mu-ippt&Date)

## 作者

🎓 清华大学出版社签约作家 / 2026当当影响力作家 / 某互联网大厂 AI 大模型业务 HR 砖家 / 一级人力资源管理师 / 二级心理咨询师 / 野生设计师

📚 著有[《图解团队管理》](https://item.m.jd.com/product/14547345.html)，服务客户有字节跳动、腾讯、百度、中国移动、SMG、BOE…

💡 [微信公众号](https://mp.weixin.qq.com/s/v1JSZvlN5fvbOOHvkvXEtA) / [小红书](https://xhslink.com/m/ESxtgUNMdl)：muippt

## 许可证

[MIT](LICENSE) © 2026 木先生iPPT

## 致谢

参考过 ppt-master by Hugo He · huashu-design by alchaincyf · [SVG Repo](https://www.svgrepo.com/) · [Tabler Icons](https://github.com/tabler/tabler-icons) · [Robin Williams](https://en.wikipedia.org/wiki/Robin_Williams_(author))（CRAP 原则）· McKinsey、BCG、Bain 相关项目。

> 声明：本项目大量内容由 AI 协同创作。如发现您的作品被使用但未获适当署名，请提交 Issue。
