# Workflow B: 生成单张技术图表 — 详细步骤

> **来源**：mu-svg-to-ppt 的 27 种技术图表模板 + 7 种风格
> **特色**：一张图一页 PPT，右键转换为形状后每个元素可编辑

## 适用场景

- "帮我画个微服务架构图"
- "画一张 RAG 流程图到 PPT"
- "做个类图，包含 User、Order、Product"
- "画个时序图，用 consulting 风格"

## 生成流程

### Step 1：确定图表类型和风格

> **入口条件**：用户描述了需要生成的技术图表内容
> **出口条件**：图表类型（27 种之一）和风格（默认 consulting）已确定

从 27 种技术图表中选择（见上方图表体系），默认 `consulting` 风格。

### Step 2：生成 SVG

> **入口条件**：Step 1 已确定图表类型和风格
> **出口条件**：SVG 代码已生成，viewBox 和占位符使用正确

根据用户描述 + 风格占位符系统生成 SVG 代码：

> 📖 Vega 数据图表引擎（柱状图/折线图/散点图等）：[references/engine-vega.md](engine-vega.md)
> 📖 信息图嵌入引擎（漏斗图/时间线/SWOT/KPI卡片）：[references/engine-infographic-embed.md](engine-infographic-embed.md)

- `viewBox="0 0 900 500"`（16:9 宽屏比例）
- 使用占位符：`{{BG_COLOR}}`、`{{TEXT_COLOR}}`、`{{ACCENT_COLOR}}` 等
- 参考模板目录：`${SKILL_DIR}/templates/charts/`

**风格占位符系统（12 个）**：

| 占位符 | 默认值 | 说明 |
|--------|---------|------|
| `{{BG_COLOR}}` | `#FFFFFF` | 背景色 |
| `{{TEXT_COLOR}}` | `#333333` | 正文色 |
| `{{ACCENT_COLOR}}` | `#FFD100` | 强调色 |
| `{{ACCENT_LIGHT}}` | `#FFF9E0` | 浅强调 |
| `{{SECONDARY_COLOR}}` | `#FFC300` | 辅助色 |
| `{{BORDER_COLOR}}` | `#E0E0E0` | 边框色 |
| `{{TITLE_COLOR}}` | `#222222` | 标题色 |
| `{{SUBTITLE_COLOR}}` | `#666666` | 副标题色 |
| `{{SUCCESS_COLOR}}` | `#52C41A` | 成功/正面 |
| `{{WARNING_COLOR}}` | `#FAAD14` | 警告 |
| `{{ERROR_COLOR}}` | `#FF4D4F` | 错误/负面 |
| `{{INFO_COLOR}}` | `#1890FF` | 信息 |

### Step 3：替换占位符 + 嵌入 PPT

> **入口条件**：Step 2 已生成 SVG 代码
> **出口条件**：占位符已替换为目标风格色值，SVG 已嵌入 PPTX 文件

将占位符替换为目标风格色值，然后将 SVG 嵌入 PPTX：

```bash
# 方法一：用 PPT Master 引擎（DrawingML，元素级可编辑）
# 将 SVG 保存到项目目录后用 svg_to_pptx.py 导出

# 方法二：SVG 直接嵌入（Office 2019+ 右键转形状）
# 用 python-pptx 将 SVG 作为图片嵌入
```

### Step 4：视觉验证 ⛔ BLOCKING

> **入口条件**：Step 3 已生成 PPTX 文件
> **出口条件**：visual_verify.py 已执行，截图已生成，无文字溢出/元素重叠

```bash
python3 ${SKILL_DIR}/scripts/visual_verify.py <output.pptx> -o <review_dir>
```

审查截图确认无明显问题后才可交付。**此步骤为强制门控，不可跳过。**

## 语义形状规范（技术图表专用）

> 📖 **完整形状词汇表**（14 种参数化 SVG 模板，含用户/LLM/DB/API/决策/数据流等）：`${SKILL_DIR}/references/shape-vocabulary.md`
