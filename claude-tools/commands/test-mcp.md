---
description: Run MCP integration tests (IF APPLICABLE)
---
**MCP INTEGRATION TESTS** (Only if your project uses MCP):

⚠️ **This command is for projects using Model Context Protocol (MCP) servers.**

If your project doesn't use MCP, you can delete this command or customize it for your testing needs.

## If You Use MCP

Run your MCP integration tests:

```bash
# Example: Python MCP tests
pytest tests/mcp/test_mcp_integration.py -v

# Example: Node.js MCP tests
npm run test:mcp

# Example: Test specific MCP tools
pytest tests/mcp/test_tool_xyz.py
```

## If You DON'T Use MCP

Replace this with your own integration tests:

```bash
# API integration tests
pytest tests/integration/

# End-to-end tests
npm run test:e2e

# Contract tests
npm run test:contract
```

## Or Delete This Command

If not applicable, delete this file and it won't appear in your slash commands.
