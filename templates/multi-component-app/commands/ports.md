---
description: Check what's using ports 8000, 8001, 3000
---
**PORT STATUS CHECK** - Multi-component app (MCP + Backend + Frontend):

1. Check port 8000 (MCP Server):
   - netstat.exe -ano | grep ":8000 " | grep "LISTENING"
   - Display PID and status

2. Check port 8001 (Backend API):
   - netstat.exe -ano | grep ":8001 " | grep "LISTENING"
   - Display PID and status

3. Check port 3000 (Frontend):
   - netstat.exe -ano | grep ":3000 " | grep "LISTENING"
   - Display PID and status

4. For each port, show:
   - ✅ Port in use by expected process
   - ⚠️ Port in use by unexpected process (orphaned)
   - ❌ Port not in use

**Use when**:
- "Port already in use" errors
- Checking if components are actually running
- Finding orphaned processes
- Before starting components
