# 元素级编辑工具（v1.2.0 新增）

> 借鉴 OfficeCLI 的元素级寻址和增量编辑模式，为工作流 D 提供精细化的 PPTX 操作能力。

## pptx_inspect.py — 元素级查询/寻址（P1）

```bash
# 路径式查询
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> '/slide[1]'           # 列出第1页所有形状
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> '/slide[1]/shape[2]'   # 查看特定形状
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> '/slide[1]/shape[@name=Title]'

# 条件查询
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> --query 'shape[fill=FF0000]'
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> --query 'shape[type=textbox]'

# 视图模式
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> outline    # 文档大纲
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> stats      # 统计信息
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> issues      # 问题检测

# JSON 输出（便于 AI 解析）
python3 ${SKILL_DIR}/scripts/pptx_inspect.py <pptx> '/slide[1]' --json
```

## pptx_edit.py — 轻量级 post-edit CLI（P2）

```bash
# 修改元素属性
python3 ${SKILL_DIR}/scripts/pptx_edit.py set <pptx> '/slide[1]/shape[2]' --prop text=新标题
python3 ${SKILL_DIR}/scripts/pptx_edit.py set <pptx> '/slide[1]/shape[2]' --prop color=FF0000 --prop size=24

# 全局查找替换
python3 ${SKILL_DIR}/scripts/pptx_edit.py find-replace <pptx> --find "旧文本" --replace "新文本"
python3 ${SKILL_DIR}/scripts/pptx_edit.py find-replace <pptx> --find "Q[1-4]" --replace "第\1季度" --regex

# 统一色系（封装 color_unify.py）
python3 ${SKILL_DIR}/scripts/pptx_edit.py recolor <pptx> --bg 0D0D2B --primary 00FF88 --accent FF6B35
python3 ${SKILL_DIR}/scripts/pptx_edit.py recolor <pptx> --bg 0D0D2B --dry-run   # 预览修改

# 页面操作
python3 ${SKILL_DIR}/scripts/pptx_edit.py add-slide <pptx> --after 3
python3 ${SKILL_DIR}/scripts/pptx_edit.py remove-slide <pptx> 5
python3 ${SKILL_DIR}/scripts/pptx_edit.py move-slide <pptx> 2 5
```

> ⚠️ 所有 pptx_edit.py 操作输出到新文件（`--output`），不覆盖原文件。操作后自动运行 issues 检查（可用 `--skip-check` 跳过）。

## interactive_preview.py — 交互式预览（P3）

```bash
# 生成自包含 HTML 预览页面
python3 ${SKILL_DIR}/scripts/interactive_preview.py <pptx> --output preview.html
open preview.html

# 启动本地服务器在线预览
python3 ${SKILL_DIR}/scripts/interactive_preview.py <pptx> --port 8080
```

HTML 预览页面支持：左侧缩略图导航、右侧大图展示、点击形状查看详细信息（路径/名称/文本/位置）、键盘方向键翻页。

## build_binary.sh — 单二进制打包（P4）

```bash
# 打包为单二进制（零依赖安装）
bash ${SKILL_DIR}/scripts/build_binary.sh

# 打包结果
dist/mu-ippt --version          # 显示版本号
dist/mu-ippt inspect <pptx>    # 元素级检查
dist/mu-ippt edit <pptx> ...     # 轻量级编辑
dist/mu-ippt preview <svg>       # SVG 渲染预览
dist/mu-ippt verify <pptx>      # 视觉验证
dist/mu-ippt interactive <pptx> # 交互式预览
dist/mu-ippt create <name>      # 项目初始化
dist/mu-ippt export <path>      # 导出 PPTX
```
