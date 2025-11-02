---
description: Start all 3 components (MCP + Backend + Frontend)
---
**START ALL COMPONENTS**:

⚠️ **CUSTOMIZE THIS COMMAND** - Update with your actual startup scripts

Example startup sequence:

1. Start MCP Server (port 8000):
   ```bash
   # Replace with your startup script
   ./start-mcp.sh
   # Or: cd mcp-server && python server.py &
   ```

2. Wait for MCP to be ready (check port 8000)

3. Start Backend API (port 8001):
   ```bash
   # Replace with your startup script
   ./start-backend.sh
   # Or: cd backend && uvicorn main:app --port 8001 &
   ```

4. Wait for Backend to be ready (check port 8001)

5. Start Frontend (port 3000):
   ```bash
   # Replace with your startup script
   ./start-frontend.sh
   # Or: cd frontend && npm run dev &
   ```

6. Verify all components are running:
   `/status`

**After customization**, this command should start all services in the correct order.
