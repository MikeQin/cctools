---
description: Run quick subset of tests for fast validation
---
**QUICK TEST SUITE** (faster than /test-critical):

Run the 2 most important tests for rapid feedback:

1. MCP Integration (verifies 22 tools accessible):
   PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py

2. V3 Analyst Cache (verifies Rule Engine working):
   pytest tests/agents/test_v3_analyst_cache.py -v

Display results with execution time.

**Use when**:
- Quick validation during development
- After modifying MCP tools
- After modifying agents
- Before committing (faster than /test-critical)

**Execution time**: ~30-45 seconds (vs 2-3 minutes for /test-critical)
