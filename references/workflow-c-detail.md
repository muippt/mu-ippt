# Workflow C: 咨询汇报模板 — 详细步骤

> **引擎**：`scripts/workflow_d.py` + `scripts/consulting_pptx/`（python-pptx 原生形状，无需右键转换）
> **特点**：40 个专业咨询模板，输出原生可编辑 PPTX，零 SVG 依赖。

## 触发词

咨询汇报模板、咨询PPT、咨询风格PPT、专业业务模板、KPI仪表盘、甘特图模板、议题树、问题树、漏斗图、BCG矩阵、组织架构图、项目团队图

## 完整流程

### Step 1：理解需求 + 推荐模板组合 ⛔ BLOCKING

> **入口条件**：用户描述了咨询模板需求
> **出口条件**：用户确认了模板列表 + 输出路径，才可执行生成

1. 根据用户需求从 40 个模板中推荐组合（先用 `--list` 查询可用模板）
2. 向用户展示：推荐的模板 ID 列表 + 每个模板的用途说明 + 预计页数
3. **等待用户明确确认**，不可自行跳过直接生成

### Step 2：生成 PPTX

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

## 40个模板速查表

> 📖 完整模板ID、中文名、场景、分类：`${SKILL_DIR}/references/consulting-templates.md`
