# 文件完整性验证

> ⚠️ **所有引用文件均随 ZIP 包分发**。安装后执行以下命令验证完整性：

```bash
# 验证核心文件（子SKILL.md + 策略师 + 执行器参考文档）
for f in \
  "${SKILL_DIR}/SKILL.md" \
  "${SKILL_DIR}/references/strategist.md" \
  "${SKILL_DIR}/references/executor-base.md" \
  "${SKILL_DIR}/references/executor-general.md" \
  "${SKILL_DIR}/references/executor-consultant.md" \
  "${SKILL_DIR}/references/executor-consultant-top.md" \
  "${SKILL_DIR}/references/canvas-formats.md" \
  "${SKILL_DIR}/references/shared-standards.md"; do
  [ -f "$f" ] && echo "✅ $(basename $f)" || echo "❌ MISSING: $f"
done

# 验证核心脚本
for f in \
  "${SKILL_DIR}/scripts_ppt/project_manager.py" \
  "${SKILL_DIR}/scripts_ppt/finalize_svg.py" \
  "${SKILL_DIR}/scripts_ppt/svg_to_pptx.py" \
  "${SKILL_DIR}/scripts_ppt/svg_quality_checker.py" \
  "${SKILL_DIR}/scripts_ppt/image_gen.py" \
  "${SKILL_DIR}/scripts/pptx_editing/ooxml/unpack.py" \
  "${SKILL_DIR}/scripts/pptx_editing/ooxml/validate.py" \
  "${SKILL_DIR}/scripts/pptx_editing/ooxml/pack.py" \
  "${SKILL_DIR}/scripts/pptx_editing/rearrange.py" \
  "${SKILL_DIR}/scripts/pptx_editing/inventory.py" \
  "${SKILL_DIR}/scripts/pptx_editing/replace.py" \
  "${SKILL_DIR}/scripts/pptx_editing/thumbnail.py" \
  "${SKILL_DIR}/scripts/visual_verify.py"; do
  [ -f "$f" ] && echo "✅ $(basename $f)" || echo "❌ MISSING: $f"
done
```
