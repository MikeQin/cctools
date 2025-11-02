---
description: Stop all 3 components gracefully
---
**STOP ALL COMPONENTS**:

⚠️ **CUSTOMIZE THIS COMMAND** - Update with your actual stop scripts

Example stop sequence (reverse order of startup):

1. Stop Frontend (port 3000):
   ```bash
   # Replace with your stop script
   ./stop-frontend.sh
   # Or: kill $(lsof -ti:3000)
   ```

2. Stop Backend API (port 8001):
   ```bash
   # Replace with your stop script
   ./stop-backend.sh
   # Or: kill $(lsof -ti:8001)
   ```

3. Stop MCP Server (port 8000):
   ```bash
   # Replace with your stop script
   ./stop-mcp.sh
   # Or: kill $(lsof -ti:8000)
   ```

4. Verify all components are stopped:
   `/ports`

**After customization**, this command should gracefully stop all services.
