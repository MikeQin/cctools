---
description: Check health status of all components
---
**COMPONENT HEALTH CHECK**:

1. Check MCP Server (port 8000):
   curl http://localhost:8000/health

2. Check Backend API (port 8001):
   curl http://localhost:8001/health

3. Check Frontend (port 3000):
   curl http://localhost:3000/api/health

4. Check ports in use:
   netstat.exe -ano | grep "LISTENING" | grep "8000\|8001\|3000"

5. Display summary of all component statuses with response times

**Expected output**:
- ✅ MCP Server: healthy (15ms)
- ✅ Backend API: healthy (23ms)
- ✅ Frontend: healthy (45ms)
