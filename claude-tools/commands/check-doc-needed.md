---
description: Analyze if recent changes need documentation
---
Analyzes uncommitted + recent changes to recommend if documentation is needed.

**Usage**:
```
/check-doc-needed
```

**Analyzes**:
- Files/lines changed
- Components affected
- Change type (architecture, bugfix, refactoring)

**Recommendation**: YES if:
- ≥ 5 files OR ≥ 100 lines changed
- New components/breaking changes
- Architecture/security changes

**Output**: Shows change analysis + suggests `/document` if needed.

**Related**: `/document`, `/commit-session`
