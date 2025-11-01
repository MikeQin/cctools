# /check-doc-needed - Documentation Check

Analyzes your recent changes and suggests if documentation is needed.

## What This Does

Analyzes uncommitted and recent changes to determine:
- **Scope**: How many files/lines changed?
- **Type**: What kind of changes (architecture, bugfix, refactoring)?
- **Recommendation**: Should you document now?

## Usage

```bash
/check-doc-needed
```

## Output Example

```
📊 Documentation Check
═══════════════════════════════════════

Recent Changes Analysis:
  • Files modified: 12
  • Lines changed: 547 (312 added, 235 removed)
  • Components affected: backend, tests
  • Commits since last doc: 3

Change Type: MAJOR REFACTORING
Scope: Large (500+ lines)

📝 Recommendation: YES - Documentation Needed

Suggested Documentation:
1. Create session notes:
   /document session-notes "Backend agent system refactoring"

2. Update architecture docs:
   /document architecture

Why: Major refactoring (500+ lines) affecting multiple
files should be documented for future reference and
team collaboration.

═══════════════════════════════════════
```

## When to Run

- **Before committing** - Check if changes need docs
- **End of session** - Review session work
- **After major refactoring** - Verify docs are complete
- **Before PR** - Ensure docs are up to date

## Integration

This command is called automatically by:
- `/commit-session` - Before committing
- (Optional) Add to your workflow scripts

## Criteria for "Documentation Needed"

| Criteria | Threshold |
|----------|-----------|
| Files changed | ≥ 5 files |
| Lines changed | ≥ 100 lines |
| New components | Any new directory/module |
| Breaking changes | Any breaking API change |
| Architecture changes | Major refactoring |
| Performance changes | ≥ 20% improvement |
| Security fixes | Any security-related change |

## Related Commands

- `/document` - Create documentation
- `/commit-session` - Commit with doc check
- `/changelog-update` - Update CHANGELOG
