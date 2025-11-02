# /update-claude Command - New Addition

**Date**: November 2, 2025
**Type**: New Slash Command
**Location**: `claude-tools/commands/update-claude.md`

---

## 🎯 Purpose

**Dedicated command to update CLAUDE.md** (or similar project instructions file) with recent changes.

---

## 📊 Comparison: /document vs /update-claude

| Feature | `/document` | `/update-claude` |
|---------|-------------|------------------|
| **Target** | `docs/` or `docs/sessions/` | `CLAUDE.md` only |
| **Purpose** | Supplementary documentation | Update project instructions |
| **Format** | Detailed markdown files | Brief changelog entry |
| **Location** | Auto-detects (major vs session) | Root CLAUDE.md |
| **Length** | Full implementation notes | 1-2 line summary |
| **Frequency** | After completing features | Daily/weekly updates |

---

## ✅ Use Cases

### Use `/document`:
- After completing a major feature
- For architectural changes
- For session implementation notes
- For detailed technical documentation

### Use `/update-claude`:
- Quick daily changelog updates
- Keeping CLAUDE.md "Recent Fixes" current
- Adding commit references
- Maintaining project overview

---

## 📝 How It Works

**Command**: `/update-claude`

**Process**:
1. Runs `git diff` and `git log -5`
2. Finds "Recent Fixes" or "Recent Changes" section in CLAUDE.md
3. Adds new entry at the top (newest first)
4. Uses format: `**Date**: ✅ **Feature** - Description (commit: abc123)`

**Example Entry**:
```markdown
**Nov 2, 2025**:
- ✅ **Add /update-claude command** - New command for updating CLAUDE.md changelog (34 commands total)
```

---

## 🔧 Customization Required

**For each project, customize**:

1. **Section Name**:
   - `## Recent Fixes` (ai-trade)
   - `## Recent Changes` (generic)
   - `## Changelog` (formal projects)

2. **Time Window**:
   - Last 7 Days
   - Last 30 Days
   - Current Month

3. **Entry Format**:
   - Bullet points vs numbered list
   - Emoji usage (✅ vs ✓)
   - Commit hash display

---

## 📋 Command Count Update

**Before**: 33 slash commands
**After**: 34 slash commands

**Updated files**:
- ✅ `claude-tools/commands/update-claude.md` (NEW)
- ✅ `README.md` - Updated count (33 → 34)
- ✅ `README.md` - Added to Documentation section

---

## 🎯 Why This Command?

**Problem**: CLAUDE.md has a "Recent Fixes" section that needs manual updates.

**Solution**: Dedicated command that:
- ✅ Focuses ONLY on CLAUDE.md
- ✅ Keeps entries brief (unlike `/document`)
- ✅ Maintains chronological order
- ✅ Reduces manual changelog maintenance

**Result**: CLAUDE.md stays current with minimal effort.

---

## 🚀 Next Steps

1. **Test the command** in ai-trade project
2. **Verify** it updates CLAUDE.md "Recent Fixes" section correctly
3. **Customize** entry format to match existing style
4. **Document** in ai-trade CLAUDE.md under "Slash Commands" section

---

**Status**: ✅ Command created and integrated into cctools v2.0.0

**Total Commands**: 34 (was 33)
