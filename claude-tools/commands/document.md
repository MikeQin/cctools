# /document - Intelligent Documentation Command

Automatically document changes with smart location detection.

## What This Does

**Intelligence**: Analyzes your recent changes and determines:
- **WHEN**: Major refactoring? Architecture change? Bug fix?
- **WHAT**: Code changes, design decisions, lessons learned
- **WHERE**: `docs/` for important architecture | `docs/sessions/{date}/` for regular notes
- **HOW**: Structured format (Summary, Changes, Why, Impact)

## Usage

### Quick Documentation (auto-detects type)
```
/document
```

###  Specify Documentation Type
```
/document architecture
/document session-notes
/document lessons-learned
/document bugfix
```

### With Custom Description
```
/document "Refactored backend agent system to use V3 protocol"
```

## Documentation Types

| Type | Location | When to Use |
|------|----------|-------------|
| **architecture** | `docs/ARCHITECTURE.md` | Major system design changes |
| **api** | `docs/API.md` | New API endpoints or breaking changes |
| **session-notes** | `docs/sessions/YYYY-MM-DD/` | Daily work, experiments, investigations |
| **lessons-learned** | `docs/LESSONS-LEARNED.md` | Anti-patterns, gotchas, important insights |
| **bugfix** | `docs/sessions/YYYY-MM-DD/` | Bug investigations and fixes |
| **deployment** | `docs/DEPLOYMENT.md` | Infrastructure or deployment changes |
| **testing** | `docs/TEST.md` | New test strategies or test infrastructure |

## Auto-Detection Rules

The doc agent will analyze recent git changes and suggest:
- **Session Notes** → If:
  - Small code changes (< 200 lines)
  - Experimental work
  - Bugfix investigations
  - Daily development tasks

- **Architecture Docs** → If:
  - Large refactoring (200+ lines)
  - New components added
  - System design changes
  - Protocol/interface changes

- **Lessons Learned** → If:
  - Fixing recurring bugs
  - Discovering anti-patterns
  - Performance insights
  - Security issues

## Examples

### Example 1: After Major Refactoring
```bash
# You just refactored 500+ lines across 10 files
> /document

📝 Analysis: Detected MAJOR REFACTORING (12 files, 547 lines)
📍 Recommended: docs/sessions/2025-11-01/BACKEND-REFACTORING.md
📍 Also update: docs/ARCHITECTURE.md

Creating documentation...
✅ Created docs/sessions/2025-11-01/BACKEND-REFACTORING.md
✅ Updated docs/ARCHITECTURE.md (added reference)
```

### Example 2: Daily Development Notes
```bash
# You fixed a small bug
> /document bugfix

📝 Analysis: Bug fix in backend/services/mcp_client.py
📍 Creating: docs/sessions/2025-11-01/mcp-client-bugfix.md

✅ Created docs/sessions/2025-11-01/mcp-client-bugfix.md
```

### Example 3: Architecture Decision
```bash
> /document architecture "Switched from V2 to V3 agent protocol"

📍 Updating: docs/ARCHITECTURE.md
📍 Creating: docs/sessions/2025-11-01/V3-PROTOCOL-MIGRATION.md

✅ Updated docs/ARCHITECTURE.md
✅ Created detailed migration notes
```

## What Gets Documented

### Automatic Analysis Includes:
1. **Recent git changes** (last uncommitted + last 3 commits)
2. **Files modified** (grouped by component: backend, frontend, mcp-server)
3. **LOC changed** (additions, deletions)
4. **Commit messages** (to understand intent)
5. **Modified functions/classes** (via git diff)

### Generated Documentation Contains:
```markdown
# [Title - Auto-Generated]

**Date**: YYYY-MM-DD
**Component**: backend | frontend | mcp-server | infrastructure
**Type**: refactoring | feature | bugfix | architecture

## Summary
[What was done - 2-3 sentences]

## Changes
- File 1: What changed
- File 2: What changed
[...]

## Why
[Motivation for the changes]

## Impact
- Performance: [if applicable]
- Breaking Changes: [if any]
- Dependencies: [if added/removed]

## Related
- Commits: [git SHAs]
- Issues: [if mentioned]
- PRs: [if mentioned]
```

## Pro Tips

1. **Run before committing** - Documents your thought process while fresh
2. **Use after each session** - Daily notes help future debugging
3. **Major changes = 2 docs** - Session note + update main doc
4. **Review suggestions** - Agent suggests location, but you can override

## Integration with Hooks

This command is automatically suggested by:
- **post-edit.sh** - After editing 5+ files
- **pre-commit.sh** - If major changes detected
- **session-start-auto.sh** - At session end (if uncommitted work)

## Related Commands
- `/changelog-update` - Update CHANGELOG.md
- `/commit-session` - Commit and document together
- `/read-docs` - Read existing documentation
