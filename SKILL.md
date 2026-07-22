---
name: mu-ippt
version: 1.2.0
description: "PPT生成与编辑，覆盖四大场景（从零生成/技术图表/咨询模板/编辑已有）。触发词：做PPT、画架构图、改PPT、咨询PPT、汇报PPT。不适用：纯图片生成"
visibility: public
---

**IRON LAW：⛔ BLOCKING 步骤不可跳过不可合并；所有生成的 PPTX 必须经 visual_verify.py 验证通过后才能交付用户；一个演示文稿只用一个图标库、一套配色方案，禁止混用；多页完整PPT需求必须先经工作流 0 路由诊断再执行；混合方案（A+C）合并后必须运行 color_unify 后处理，将工作流C的默认色替换为用户选定的设计哲学色板，禁止以原始默认配色交付。无例外。**

> **路径初始化**：本文件中所有 `${SKILL_DIR}` 均指 Skill 根目录。使用前须先执行：
> ```bash
> SKILL_DIR=<AGENT_HOME>/skills/mu-ippt
> ```

---

# mu-ippt · PPT Skill（外网版）

> 一个 Skill 搞定所有 PPT 场景：**从零生成** · **技术图表** · **咨询汇报模板** · **编辑已有PPT**
>
> 🎨 **26 套配色**（12 设计风格 + 14 行业配色）· 📊 **119 种图表** · 📐 **20 套布局模板** · 🖼️ **6,732 图标** · 📏 **8 种画布**（演示 / 社交 / 印刷等场景全覆盖）
## 🚀 首次使用

本 Skill 的 AI 配图功能需要配置图片生成 API Key（二选一）：

| 后端 | 环境变量 | 说明 |
|------|---------|------|
| **OpenAI（默认）** |  | DALL-E 3 图片生成 |
| **Gemini（备选）** |  | Google Imagen 图片生成 |

配置方式：


> 💡 如果不需要 AI 配图功能（仅使用 SVG 图表和图标），无需配置 API Key。


## 五大工作流

| 场景 | 触发词 | 走哪个流程 |
|------|--------|-----------|
| **多页完整PPT（自动路由）** | 做PPT、做汇报、生成演示文稿、把这个文档变成PPT | → [工作流 0](#工作流-0多页需求路由诊断) |
| **从零生成多页 PPT** | （工作流0路由后）SVG自由排版、高度定制化风格 | → [工作流 A](#工作流-a从零生成多页-ppt) |
| **生成单张技术图表** | 画架构图、画流程图、画UML、画时序图、技术图表PPT | → [工作流 B](#工作流-b生成单张技术图表) |
| **咨询汇报模板** | 咨询汇报模板、咨询PPT、专业模板、KPI仪表盘、甘特图模板、议题树、漏斗图 | → [工作流 C](#工作流-c咨询汇报模板) |
| **编辑已有 PPT** | 改PPT、修改第三页标题、用这个模板做PPT、替换内容 | → [工作流 D](#工作流-d编辑已有-ppt) |

> 💡 **判断规则**：单张技术图表/架构图/UML → 直接B；改现有PPT或套模板 → 直接D；专业咨询风格原生幻灯片（KPI/甘特/组织架构/趋势）→ 直接C；**其他多页完整PPT → 必须先走工作流0路由诊断**。

---

## 工作流 0：多页需求路由诊断

> **触发条件**：用户提出多页完整 PPT 需求（含 2 页以上、且非单张技术图表、非直接编辑已有文件）
> **目标**：在动手之前，帮用户规划每页走哪个工作流，输出「页面规划表」供确认

> 📖 **完整 Step 1-3 + Anti-Pattern（含设计哲学推荐 + 页面规划表 + 混合方案合并）**：read `${SKILL_DIR}/references/workflow-0-detail.md`

---

## 资产体系

> 📖 完整配色表 / 图表分类表 / 模板详情表：`${SKILL_DIR}/references/style-color-layout-tables.md`

| 类别 | 数量 | 快速路由 |
|------|------|---------|
| 配色 | 26套（12设计风格+14行业） | 未指定→设计哲学推荐流程；正式→corporate/consulting；技术→dark/blueprint；极简→notion/flat |
| 图表 | ~79种（27技术+52商务） | 技术图表→工作流B；商务图表→工作流A；索引见 `templates/charts/charts_index.json` |
| 布局模板 | 20套（品牌9/通用3/场景4/政务3/特殊1） | 高管→exhibit/mckinsey；技术→anthropic；政务→government；索引见 `templates/layouts/layouts_index.json` |
| 图标库 | 6,732个（chunk 640/tabler-filled 1,053/tabler-outline 5,039） | **默认 chunk**；一个演示文稿只用一个图标库 |
| 画布 | 8种 | 默认 ppt169；社交竖版→xiaohongshu；印刷→a4 |

> 📖 品牌素材清单：`${SKILL_DIR}/references/brand-assets.md`

---

## 工作流 A：从零生成多页 PPT

> **核心引擎**：PPT Master 的 Strategist→Executor 流水线
> **输出**：每个元素原生可编辑的 PPTX（SVG→DrawingML 转换）

### 前置准备

```bash
# 确保依赖就绪
pip install python-pptx lxml Pillow numpy requests beautifulsoup4 svglib reportlab 2>/dev/null
```

### 文件完整性验证

> 📖 安装后验证脚本：read `${SKILL_DIR}/references/file-validation.md`

### 完整 7 步流程

| 步骤 | 说明 | 关键脚本 |
|------|------|---------|
| **Step 1** | 源内容处理（PDF/DOCX/URL→MD） | `${SKILL_DIR}/scripts_ppt/source_to_md/*.py` |
| **Step 2** | 项目初始化 | `${SKILL_DIR}/scripts_ppt/project_manager.py` |
| **Step 3** | 模板选择 ⛔ BLOCKING（见下） | `${SKILL_DIR}/templates/layouts/` |
| **Step 4** | 策略师八大确认 ⛔ BLOCKING（见下） | `${SKILL_DIR}/references/strategist.md` |
| **Step 5** | AI 配图（条件触发） | `${SKILL_DIR}/scripts_ppt/image_gen.py` |
| **Step 6** | 执行器逐页生成 SVG + 逐页渲染预览 | `${SKILL_DIR}/references/executor-*.md` + `${SKILL_DIR}/scripts/svg_preview.py` |
| **Step 7** | 后处理 + 导出 PPTX | `${SKILL_DIR}/scripts_ppt/finalize_svg.py` + `svg_to_pptx.py` |

#### Step 3 详细：模板选择 ⛔ BLOCKING

> **入口条件**：Step 2 项目初始化完成
> **出口条件**：布局模板 + 配色方案已确认，用户明确同意后才能继续

1. 根据用户描述的场景/受众/风格，从布局模板体系（20套）+ 风格体系（26套）中推荐候选
2. **推荐优先级**：场景精确匹配 > 品牌匹配 > 设计风格匹配 > 通用模板（exhibit/科技蓝商务）
3. 无匹配时默认：consulting 配色 + exhibit 布局

> 📖 品牌资产接入协议（八项确认前必须执行）：[references/brand-asset-protocol.md](references/brand-asset-protocol.md)
> 📖 自定义模板设计：[references/template-designer.md](references/template-designer.md)
> 📖 设计 Token 引用语法：[references/token-reference.md](references/token-reference.md)
4. 向用户列出推荐组合（布局模板 + 配色），**等待用户明确确认**，不可跳过继续

#### Step 4 详细：策略师八大确认 ⛔ BLOCKING

> **入口条件**：Step 3 模板/配色已确认
> **出口条件**：八项参数全部用户确认，可进入 SVG 生成阶段
> 📖 详细策略师指南：`Read ${SKILL_DIR}/references/strategist.md`

需要与用户逐一确认的八项：
1. **页数**：总页数（含封面/目录/结语）
2. **画布格式**：ppt169（默认）/ ppt43 / a4 / 社交格式等
3. **内容大纲**：每页标题 + 核心内容要点
4. **配色方案**：（Step 3 已确认，此处复确认）
5. **图标库**：chunk（默认）/ tabler-filled / tabler-outline
6. **AI 配图**：是否需要 AI 生成图片，哪几页
7. **图表类型**：哪几页需要图表，具体类型
8. **交付要求**：纯 PPTX / 附视觉验证截图

以上全部确认后生成正式「设计规格书」，**执行器严格按规格书执行，不得自行发挥**。

### 关键规则

1. **串行流水线** — 步骤必须按顺序执行，前一步的输出是后一步的输入
2. **⛔ BLOCKING = 硬停** — 必须等用户明确回复才能继续
3. **主 Agent 端到端** — SVG 生成不能委托给子 Agent
4. **逐页顺序生成** — 禁止分批/并行生成页面
5. **设计哲学推荐** — 八大确认中配色走设计哲学推荐流程
6. **逐页渲染预览（推荐）** — Step 6 中建议每 3 页用 svg_preview.py 渲染预览自检，发现问题及时修复；短 PPT（≤5页）可逐页检查

### AI 配图

使用 OpenAI DALL-E 作为默认图片后端（需配置 OPENAI_API_KEY）：

```bash
python3 ${SKILL_DIR}/scripts_ppt/image_gen.py "prompt" --aspect_ratio 16:9 --image_size 1K -o <project_path>/images
```

> 📖 图片生成完整规范（11种后端+参数+水印移除）：[references/image-generator.md](references/image-generator.md)
> 📖 图片布局规范（强制执行）：[references/image-layout-spec.md](references/image-layout-spec.md)

### 逐页渲染预览（Step 6 内嵌，推荐）

> 建议每 3 页渲染一次预览自检；短 PPT（≤5页）可逐页检查。

```bash
# 渲染 SVG 为 PNG
python3 ${SKILL_DIR}/scripts/svg_preview.py <page_N.svg> --output <preview_dir>/page_N.png

# 用 open 命令预览（macOS）
open <preview_dir>/page_N.png
```

检查要点：文字溢出/截断、元素重叠、配色与设计哲学一致性、对齐问题。发现问题及时修复 SVG 再重新渲染。

### 视觉验证（生成后自动执行）

```bash
python3 ${SKILL_DIR}/scripts/visual_verify.py <output.pptx> --output-dir <review_dir>
```

生成逐页 JPEG 截图，审查：文字溢出、元素重叠、对齐问题、颜色对比度。

### Pre-Delivery Checklist（工作流 A）

- [ ] 页数与策略师规划一致
- [ ] 配色与用户确认的风格一致，全篇无混用
- [ ] 图标库全篇统一，未混用不同图标库
- [ ] svg_preview.py 已按推荐频率渲染预览，布局/配色无异常
- [ ] visual_verify.py 已执行，无文字溢出/元素重叠/对齐问题
- [ ] AI 配图已嵌入且尺寸正确（若有）
- [ ] 画布格式与用户要求一致（默认 ppt169）
- [ ] PPTX 文件已发送给用户

### 画布格式（8 种场景画布）

> 📖 完整格式表 + 选择决策树：`${SKILL_DIR}/references/canvas-formats.md`
> 默认：`ppt169`（1280×720）；社交竖版 → xiaohongshu/story；印刷 → a4

---

## 工作流 B：生成单张技术图表

> 27 种技术图表 + 12 个风格占位符，一张图一页 PPT，右键转形状后元素可编辑
> 📖 **完整 Step 1-4（含占位符表 + 嵌入方法 + 语义形状规范）**：read `${SKILL_DIR}/references/workflow-b-detail.md`

### Pre-Delivery Checklist（工作流 B）

- [ ] 图表类型与用户需求匹配
- [ ] 风格配色统一，占位符全部替换完毕
- [ ] SVG viewBox 尺寸正确（默认 900×500）
- [ ] svg_preview.py 已渲染预览，布局无异常
- [ ] visual_verify.py 已执行，无文字溢出/元素重叠
- [ ] PPTX 文件已发送给用户

### 语义形状规范（技术图表专用）

> 📖 **完整形状词汇表**（14 种参数化 SVG 模板，含用户/LLM/DB/API/决策/数据流等）：`${SKILL_DIR}/references/shape-vocabulary.md`
> 📖 **箭头语义规范**（7 种箭头类型 + 图例规则）：`${SKILL_DIR}/references/arrow-semantics.md`
> 📖 **技术产品图标**（40+ AI/技术品牌 SVG 图标）：`${SKILL_DIR}/references/tech-product-icons.md`
> 📖 SVG 图片嵌入指南：[references/svg-image-embedding.md](references/svg-image-embedding.md)
> 📖 SVG 布局最佳实践：[references/svg-layout-best-practices.md](references/svg-layout-best-practices.md)
> 📖 行业专业图标索引（45 namespace/8092 图标）：[references/icons-industry.md](references/icons-industry.md)
> 📖 PlantUML/mxGraph 图标索引：[references/icons-plantuml-index.md](references/icons-plantuml-index.md)

---

## 工作流 C：咨询汇报模板

> **引擎**：`scripts/workflow_d.py` + `scripts/consulting_pptx/`（python-pptx 原生形状，无需右键转换）
> **特点**：40 个专业咨询模板，输出原生可编辑 PPTX，零 SVG 依赖。

### 触发词

咨询汇报模板、咨询PPT、咨询风格PPT、专业业务模板、KPI仪表盘、甘特图模板、议题树、问题树、漏斗图、BCG矩阵、组织架构图、项目团队图

### 完整流程

#### Step 1：理解需求 + 推荐模板组合 ⛔ BLOCKING

> **入口条件**：用户描述了咨询模板需求
> **出口条件**：用户确认了模板列表 + 输出路径，才可执行生成

1. 根据用户需求从 40 个模板中推荐组合（先用 `--list` 查询可用模板）
2. 向用户展示：推荐的模板 ID 列表 + 每个模板的用途说明 + 预计页数
3. **等待用户明确确认**，不可自行跳过直接生成

#### Step 2：生成 PPTX

用户确认后执行：

```bash
cd ${SKILL_DIR}/scripts
# 查看所有40个模板
python3 workflow_d.py --list

# 按需组合模板生成 PPTX
python3 workflow_d.py --templates cover,agenda,kpi_dashboard,gantt_timeline --output /tmp/deck.pptx

# 生成含10张示例页的演示文稿
python3 workflow_d.py --demo --output /tmp/demo.pptx
```

### 40个模板速查表

> 📖 完整模板ID、中文名、场景、分类：`${SKILL_DIR}/references/consulting-templates.md`
> 高频模板：`cover` / `agenda` / `kpi_dashboard` / `gantt_timeline` / `org_chart` / `issue_tree` / `phases_chevron_3`

### Pre-Delivery Checklist（工作流 C）

- [ ] 模板 ID 均通过 `--list` 确认存在
- [ ] 输出 PPTX 文件已生成且非空（`ls -la`）
- [ ] PPTX 文件已发送给用户

---

## 工作流 D：编辑已有 PPT

> **来源**：pptx 内置 Skill 的 OOXML 工具链
> **适用**：修改已有 PPT 内容、基于模板生成新 PPT
> **场景**：场景一（解包→编辑XML→验证→确认→打包→视觉验证）+ 场景二（分析模板→排列→替换→视觉验证）

> 📖 **完整 Step-by-Step（含 Step 0 元素级检查 + 两场景全步骤）**：read `${SKILL_DIR}/references/workflow-d-detail.md`

### Pre-Delivery Checklist（工作流 D）

- [ ] 修改/替换内容与用户需求一致
- [ ] XML 验证通过（场景一）或替换 JSON 正确（场景二）
- [ ] 用户已确认修改摘要（Confirmation Gate 已通过）
- [ ] visual_verify.py 已执行，无文字溢出/元素重叠/对齐问题
- [ ] 原始 PPTX 未被覆盖（输出为新文件）
- [ ] （可选）interactive_preview.py 已生成交互式预览页面
- [ ] PPTX 文件已发送给用户

---

## 脚本索引

### 核心生成引擎（`${SKILL_DIR}/scripts_ppt/`）

| 脚本 | 用途 |
|------|------|
| `source_to_md/*.py` | 源文档转 Markdown（PDF/DOCX/URL/PPTX） |
| `project_manager.py` | 项目初始化 / 验证 / 管理 |
| `image_gen.py` | AI 图片生成（openai/gemini 后端） |
| `svg_quality_checker.py` | SVG 质量检查 |
| `finalize_svg.py` | SVG 后处理（图标嵌入/图片修复/文本扁平化） |
| `svg_to_pptx.py` | SVG→DrawingML 导出 PPTX |
| `total_md_split.py` | 演讲备注拆分 |
| `config.py` | 统一配置（配色/画布/行业色） |
| `analyze_images.py` | 图片分析 |
| `svg_to_pptx/` | SVG→DrawingML 转换引擎（7 模块） |
| `svg_finalize/` | SVG 后处理模块 |
| `image_backends/` | openai/gemini 图片生成后端 |

### 编辑工具链（`scripts/pptx_editing/`）

| 脚本 | 用途 |
|------|------|
| `ooxml/unpack.py` | 解包 PPTX 为 XML |
| `ooxml/validate.py` | 验证 XML 合规性 |
| `ooxml/pack.py` | 打包 XML 为 PPTX |
| `rearrange.py` | 页面重排/复制/删除 |
| `inventory.py` | 提取文本结构清单 |
| `replace.py` | 批量替换文本内容 |
| `thumbnail.py` | 生成缩略图网格 |

### 增强工具（`scripts/`）

| 脚本 | 用途 |
|------|------|
| `visual_verify.py` | PPTX→PDF→JPEG 视觉验证 |
| `svg_preview.py` | **P0** SVG→PNG 逐页渲染预览（render→look→fix 闭环） |
| `pptx_inspect.py` | **P1** 元素级查询/寻址（路径式 `/slide[N]/shape[M]` + CSS-like 选择器 + JSON 输出 + issues/stats/outline 视图） |
| `pptx_edit.py` | **P2** 轻量级 post-edit CLI（set/find-replace/recolor/add-slide/remove-slide/move-slide） |
| `interactive_preview.py` | **P3** 交互式 HTML 预览（可点击 shape 选择 + 信息面板 + 缩略图导航） |
| `build_binary.sh` | **P4** PyInstaller 单二进制打包（`mu-ippt inspect/edit/preview/verify` 一行安装） |

---

## 元素级编辑工具（工作流 D 增强，v1.2.0）

> 📖 **完整 CLI 文档**（inspect/edit/interactive/binary 用法）：read `${SKILL_DIR}/references/element-editing-tools.md`

| 工具 | 一句话用途 |
|------|-----------|
| `pptx_inspect.py` | 路径式查询 `/slide[N]/shape[M]` + 选择器 + outline/stats/issues 视图 |
| `pptx_edit.py` | set/find-replace/recolor/add-slide/remove-slide/move-slide 六大子命令 |
| `interactive_preview.py` | 生成可点击 HTML 预览页面，支持 shape 选择 + 缩略图导航 |
| `build_binary.sh` | PyInstaller 单二进制打包，`mu-ippt inspect/edit/preview/verify` 一行安装 |

---

## Anti-Pattern 清单

> 📖 **四个工作流全部禁止行为**：read `${SKILL_DIR}/references/anti-patterns.md`

---

## 已知局限

- visual_verify 依赖 LibreOffice，容器环境需预装（降级：browser automation tool 截图验证）
- svg_preview 依赖 svglib/reportlab，降级链：cairosvg → rsvg-convert → 跳过
- interactive_preview 三级降级：复用 visual_verify JPEG → LibreOffice 渲染 → python-pptx + Pillow 占位框
- AI 图片生成需配置对应后端 API Key（gemini/openai/qwen 等11种后端可选）
- 超大 PPTX（>50页）可能超时，建议分批生成
- SVG 技术图表复杂度受 python-pptx 限制
- build_binary.sh 需要 PyInstaller（脚本自动安装），输出约 50MB 单文件

---

## 降级链速查

| 失败点 | 降级方案 |
|--------|---------|
| svg_preview.py（svglib不可用） | cairosvg → rsvg-convert → 跳过预览（事后 visual_verify 兜底） |
| visual_verify.py（LibreOffice不可用） | browser automation tool 截图验证 |
| interactive_preview.py（LibreOffice不可用） | python-pptx + Pillow 占位框渲染 |
| AI 图片生成失败 | 纯色占位图+提示用户替换 |
| source_to_md 转换失败 | 手动粘贴关键内容 |
| SVG 质量检查失败 | 肉眼检查+用户确认 |

---

## 参考文档

> 完整 references/ 索引见 `${SKILL_DIR}/references/` 目录，按需读取。
> 📖 15 个示例项目：[references/example-projects.md](references/example-projects.md)
