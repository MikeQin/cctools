---
description: Update CLAUDE.md recent changes section
---
**Usage**:
```
/update-claude                    # Auto-detect changes and update
/update-claude "Feature summary"  # Custom description
```

**What it does**:
1. Analyzes recent `git diff` and `git log -5`
2. Updates **CLAUDE.md** "Recent Fixes" or "Recent Changes" section
3. Adds entry with date, summary, and commit refs
4. Maintains chronological order (newest first)

**Target Section**:
- Looks for `## Recent Fixes`, `## Recent Changes`, or `## Changelog` in CLAUDE.md
- If not found, appends new section before `---` footer

**Entry Format**:
```markdown
**Nov 2, 2025**:
- ✅ **Feature Name** - Brief description (commit: abc1234)
- ✅ **Bug Fix** - What was fixed (2 files changed)
```

**Example**:
```
/update-claude "Refactored V3 agents"
```

**Updates CLAUDE.md with**:
```markdown
## 🔧 Recent Fixes (Last 7 Days)

**Nov 2, 2025**:
- ✅ **V3 Agent Refactor** - Split 1,500-line file into 4 modules (5 files, commit: a1b2c3d)
```

**⚠️ CUSTOMIZE FIRST**:
- Edit CLAUDE.md section name (Recent Fixes vs Recent Changes)
- Adjust time window (Last 7 Days vs Last 30 Days)
- Customize entry format for your project
