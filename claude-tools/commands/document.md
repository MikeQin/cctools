---
description: Document recent changes (auto-detects type & location)
---
**Usage**:
```
/document                  # Auto-detect type
/document architecture     # Specify type
/document "description"    # Custom title
```

**Types**: architecture, api, session-notes, lessons-learned, bugfix, deployment, testing

**Auto-detection**:
- Major (200+ LOC, 10+ files) → `docs/` + session notes
- Regular → `docs/sessions/{date}/`

**Process**:
1. Analyzes `git diff` and `git log -3`
2. Determines type (major vs session)
3. Creates structured markdown (Summary, Changes, Impact, Related)

Uses doc-agent (~500 tokens).
