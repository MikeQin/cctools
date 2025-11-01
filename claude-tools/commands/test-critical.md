---
description: Run 5 critical smoke tests (pre-commit/deploy)
---
**CRITICAL SMOKE TESTS** (must pass before commit):

1. MCP Integration (22 tools):
   PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py

2. V3 Analyst Cache (Rule Engine):
   PYTHONPATH=backend uv run python tests/agents/test_v3_analyst_cache.py

3. Model Fallback (3-tier):
   pytest tests/models/test_model_fallback.py -v

4. V3 Endpoints Ready:
   pytest tests/endpoints/test_v3_endpoints_ready.py -v

5. OI Integration:
   PYTHONPATH=backend uv run python tests/integration/test_oi_integration.py

Display pass/fail summary with execution times.

**RULE**: All 5 tests MUST pass before commit.
