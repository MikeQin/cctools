---
description: View recent logs from MCP server and Backend API
---
**LOG VIEWER** - Quick access to component logs:

1. Display MCP Server logs (last 50 lines):
   - tail -50 logs/mcp-server.log
   - Show errors/warnings highlighted

2. Display Backend API logs (last 50 lines):
   - tail -50 logs/backend.log
   - Show errors/warnings highlighted

3. Ask user which log to view in detail:
   - Full MCP log? (tail -100 logs/mcp-server.log)
   - Full Backend log? (tail -100 logs/backend.log)
   - Search for pattern? (grep "pattern" logs/*.log)

**Use when**:
- Debugging startup issues
- Checking for errors
- Monitoring API requests
- Investigating MCP tool failures
