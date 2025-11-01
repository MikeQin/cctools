---
description: Test existing functionality BEFORE making any changes
---
**TEST EXISTING FUNCTIONALITY FIRST** (.claude/LESSONS-LEARNED.md Rule #3):

This command MUST be run BEFORE modifying ANY existing code:

1. Identify what functionality will be affected by your changes
2. Run relevant tests to verify CURRENT behavior:
   - Agent tests: pytest tests/agents/ -v -k "test_name"
   - MCP tests: PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py
   - Integration tests: pytest tests/integration/ -v
3. Document current test results (all should PASS before changes)
4. If tests fail BEFORE changes → FIX TESTS FIRST, then make changes

**RULE**: Never modify code that doesn't have passing tests.
