---
description: Run debugging checklist BEFORE restarting backend 3+ times
---
**SYSTEMATIC DEBUGGING CHECKLIST** (prevents debugging loops):

**STOP** if you've restarted backend 3+ times for the same issue. Run this checklist:

Phase 1: Obvious Checks
- [ ] Check git diff for recent changes
- [ ] Verify .env variables loaded (echo $VARIABLE_NAME)
- [ ] Check Python bytecode cache (./gitbash-clean-python-cache.sh all)
- [ ] Verify imports are correct (no circular imports)
- [ ] Check file paths are absolute (not relative)

Phase 2: Data Flow Analysis
- [ ] Print actual data types at boundaries (backend → frontend)
- [ ] Log actual values (not assumptions)
- [ ] Verify database connectivity (powershell Test-NetConnection)
- [ ] Check API response structure (curl endpoint | python -m json.tool)

Phase 3: Documentation Review
- [ ] Read CLAUDE.md for architecture context
- [ ] Read ARCHITECTURE.md for data flow
- [ ] Read API.md for endpoint contracts
- [ ] Read relevant type definitions (Pydantic/TypeScript)

Phase 4: Error Analysis
- [ ] Read FULL error message (don't skim)
- [ ] Check logs/backend.log for stack traces
- [ ] Search codebase for similar error patterns (grep -r "error message")

**RULE**: Targeted diagnosis > Trial-and-error
