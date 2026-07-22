# Workflow D: 编辑已有 PPT — 详细步骤

## 场景一：修改已有 PPT

### Step 0：元素级检查（可选，推荐）

> **入口条件**：用户已提供待修改的 PPTX 文件，需要精确了解某个形状的属性
> **出口条件**：目标元素的结构信息已获取，可精确指导后续编辑

```bash
# 查看第1页所有形状
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <input.pptx> '/slide[1]'

# 查看第3页第2个形状的详细信息（JSON 格式）
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <input.pptx> '/slide[3]/shape[2]' --json

# 按条件查询所有红色形状
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <input.pptx> --query 'shape[fill=FF0000]'

# 检测常见问题（空文本框、溢出风险等）
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <input.pptx> issues

# 输出文档统计信息
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <input.pptx> stats
```

### Step 1：解包

> **入口条件**：用户已提供待修改的 PPTX 文件
> **出口条件**：PPTX 已解包为 XML 目录结构

```bash
python3 ${SKILL_DIR}/scripts/pptx_editing/ooxml/unpack.py <input.pptx> <output_dir>
```

### Step 2：编辑 XML

> **入口条件**：Step 1 解包完成，XML 目录已生成
> **出口条件**：目标 XML 文件已修改，修改内容与用户需求一致

直接编辑 `ppt/slides/slide{N}.xml` 等 XML 文件。

关键文件结构：
- `ppt/presentation.xml` — 主元数据
- `ppt/slides/slide{N}.xml` — 各页内容
- `ppt/notesSlides/notesSlide{N}.xml` — 演讲备注
- `ppt/theme/` — 主题配色
- `ppt/media/` — 图片媒体

### Step 3：验证

> **入口条件**：Step 2 编辑完成
> **出口条件**：XML 验证通过，无合规性错误

```bash
cd ${SKILL_DIR}/scripts/pptx_editing/ooxml
python3 validate.py <output_dir> --original <input.pptx>
```

### Step 4：用户确认 ⛔ BLOCKING（Confirmation Gate）

> **入口条件**：Step 3 验证通过
> **出口条件**：用户确认修改内容无误，同意打包

向用户展示修改摘要（修改了哪些页面、哪些元素、具体改动内容），等待用户明确确认后再打包。**此步骤为强制门控，不可跳过。**

### Step 5：打包

> **入口条件**：Step 4 用户已确认
> **出口条件**：PPTX 文件已生成

```bash
python3 ${SKILL_DIR}/scripts/pptx_editing/ooxml/pack.py <output_dir> <output.pptx>
```

### Step 6：视觉验证 ⛔ BLOCKING

> **入口条件**：Step 5 打包完成
> **出口条件**：visual_verify.py 已执行，截图已生成，无明显问题

```bash
# 标准视觉验证
python3 ${SKILL_DIR}/scripts/visual_verify.py <output.pptx> -o <review_dir>

# 交互式预览（可选，推荐用于精细修改场景）
python3 ${SKILL_DIR}/scripts/interactive_preview.py <output.pptx> --output <review_dir>/preview.html
open <review_dir>/preview.html
```

交互式预览页面支持点击形状查看详细信息（路径、名称、文本、位置），方便用户精确指导后续修改。

审查截图确认无文字溢出、元素重叠、对齐问题。**此步骤为强制门控，不可跳过。**

## 场景二：基于模板生成新 PPT

### Step 1：分析模板

> **入口条件**：用户已提供模板 PPTX 文件
> **出口条件**：模板文本已提取，缩略图已生成，页面结构已分析

```bash
# 提取文本
python3 -m markitdown template.pptx > template-content.md

# 生成缩略图
python3 ${SKILL_DIR}/scripts/pptx_editing/thumbnail.py template.pptx
```

### Step 2：排列页面

> **入口条件**：Step 1 模板分析完成
> **出口条件**：页面已按需求重新排列，working.pptx 已生成

根据分析结果选择要用的页面，重新排列：

```bash
python3 ${SKILL_DIR}/scripts/pptx_editing/rearrange.py template.pptx working.pptx 0,3,3,7,12
```

> 页面索引从 0 开始，同一索引可重复使用（复制该页）。

### Step 3：提取文本清单

> **入口条件**：Step 2 页面排列完成
> **出口条件**：text-inventory.json 已生成，包含所有 shape 文本结构

```bash
python3 ${SKILL_DIR}/scripts/pptx_editing/inventory.py working.pptx text-inventory.json
```

### Step 4：准备替换内容

> **入口条件**：Step 3 文本清单已生成
> **出口条件**：replacement-text.json 已准备，覆盖所有需替换的 shape

根据 `text-inventory.json` 中的 shape 结构准备 `replacement-text.json`：

```json
{
  "slide-0": {
    "shape-0": {
      "paragraphs": [
        {"text": "新标题", "bold": true, "alignment": "CENTER"}
      ]
    }
  }
}
```

> ⚠️ 未在 JSON 中提供 `paragraphs` 的 shape 会被自动清空文本。

### Step 5：用户确认 ⛔ BLOCKING（Confirmation Gate）

> **入口条件**：Step 4 替换内容已准备
> **出口条件**：用户确认替换内容无误，同意执行

向用户展示替换计划摘要（哪些页面的哪些 shape 将被替换为什么内容），等待用户明确确认后再执行替换。**此步骤为强制门控，不可跳过。**

### Step 6：应用替换

> **入口条件**：Step 5 用户已确认
> **出口条件**：output.pptx 已生成

```bash
python3 ${SKILL_DIR}/scripts/pptx_editing/replace.py working.pptx replacement-text.json output.pptx
```

### Step 7：视觉验证 ⛔ BLOCKING

> **入口条件**：Step 6 替换完成，PPTX 已生成
> **出口条件**：visual_verify.py 已执行，截图已生成，无明显问题

```bash
python3 ${SKILL_DIR}/scripts/visual_verify.py <output.pptx> -o <review_dir>
```

审查截图确认无文字溢出、元素重叠、对齐问题。**此步骤为强制门控，不可跳过。**
