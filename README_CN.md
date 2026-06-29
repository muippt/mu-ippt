<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/default-banner.png">
    <source media="(prefers-color-scheme: light)" srcset="assets/default-banner.png">
    <img alt="mu-ippt" src="assets/default-banner.png" width="100%">
  </picture>
</p>

# mu-ippt

> AI 驱动的 PPT 智能创作工具——像设计师一样从零为你创作演示文稿，让没有设计基础的人也能做出专业幻灯片。

[English](README.md) | **中文**

[![CI](https://github.com/mupoet/mu-ippt/actions/workflows/ci.yml/badge.svg)](https://github.com/mupoet/mu-ippt/actions)
[![Version](https://img.shields.io/github/v/release/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/releases)
[![License](https://img.shields.io/github/license/mupoet/mu-ippt)](LICENSE)
[![Stars](https://img.shields.io/github/stars/mupoet/mu-ippt)](https://github.com/mupoet/mu-ippt/stargazers)

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

## 功能特性

### 🎨 15 种设计哲学流派

不是"模板选一个"，而是 AI 根据你的主题、受众和场景，推荐最匹配的视觉风格。每种哲学都有独特的 Visual DNA、色彩 Token 和排版逻辑。

| 流派 | Visual DNA |
|------|-----------|
| Pentagram | 极简黑白，信息优先的瑞士风格 |
| Fathom | 数据叙事，让数字自己讲故事 |
| Ive | 苹果式精密工业美学 |
| Rams | 少即是多的包豪斯经典 |
| Zaha | 参数化曲线的未来建筑感 |
| Massimo Vignelli | 纽约地铁设计师的永恒秩序感 |
| ... | [共 14 种流派 →](./docs/design-philosophies.md) |

> 📥 **[下载设计哲学展示 PPTX](./examples/design-philosophies/muippt-design-philosophies_202606.pptx)** — 31 页幻灯片，展示全部 15 种设计哲学。

### 📊 119 种图表类型

从基础图表（柱状图、折线图、饼图、雷达图）到高级可视化（瀑布图、桑基图、旭日图、树图），咨询图表（漏斗图、甘特图、KPI 仪表盘、组织架构图），以及技术图（架构图、时序图、流程图、UML、ER 图、部署图）。

### 🏛️ 40 个咨询级专业模板

对标 McKinsey / BCG / Bain：SWOT 分析、波特五力、BCG 矩阵、KPI 仪表盘、甘特时间线、组织架构图、人才九宫格、增长飞轮等。

### 🖼️ 6,732 个矢量图标 + 8 种画布格式

全部 SVG 矢量格式，无损缩放，全部内置。画布格式：16:9 宽屏、4:3 经典、9:16 竖屏、1:1 方图、A4 纵/横向、LinkedIn 横幅、自定义尺寸。

### 🔄 文档一键转 PPT

支持 PDF、DOCX、Markdown、HTML、EPUB——智能拆分内容，自动匹配布局。

## 五大工作流

| 工作流 | 场景 | 触发词 |
|--------|------|--------|
| **0** | 多页需求智能路由 | "做PPT"、"做汇报" |
| **A** | 从零生成（SVG 矢量排版） | "自由排版"、"高度定制" |
| **B** | 单张技术图表 | "画架构图"、"画流程图" |
| **C** | 咨询汇报模板 | "KPI仪表盘"、"甘特图模板" |
| **D** | 编辑已有 PPT | "改PPT"、"修改第3页" |

## 与同类工具对比

| 维度 | mu-ippt | Gamma | Beautiful.ai |
|------|---------|-------|-------------|
| 设计哲学 AI 推荐 | ✅ 14 种流派 | ❌ | ❌ |
| 图表类型 | 119 种 | 约 20 种 | 约 30 种 |
| 咨询级模板 | 40 个 | ❌ | 有限 |
| 编辑已有 PPT | ✅ | ❌ | ❌ |
| 本地运行 | ✅ | ❌ 云端 | ❌ 云端 |
| 开源 | ✅ MIT | ❌ | ❌ |
| 费用 | 免费 | $8-40/月 | $12-40/月 |

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
