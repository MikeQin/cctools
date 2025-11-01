---
description: Analyze impact BEFORE modifying any existing code
---
**PRE-CHANGE IMPACT ANALYSIS** (.claude/LESSONS-LEARNED.md Rule #1):

Ask user these questions BEFORE making ANY changes to existing code:

1. ❓ **Is this change necessary?** What problem does it solve?
2. ❓ **What existing code will be affected?** Map dependencies first
3. ❓ **What could this break?** Identify risks
4. ❓ **Can we create NEW code instead of modifying EXISTING code?** (Often safer)
5. ❓ **What tests verify existing functionality?** Run them FIRST

**RULE**: When something works - LEAVE IT ALONE unless there's a compelling reason.

Display these questions and wait for user confirmation before proceeding.
