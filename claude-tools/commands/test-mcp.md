---
description: Run MCP integration tests (22 tools)
---
Run MCP integration tests:

1. Ensure MCP server is running on port 8000
2. Run PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py
3. Verify all 22 MCP tools are accessible
4. Display tool availability summary
