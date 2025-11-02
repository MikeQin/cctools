---
description: Check what's using port 8080
---
**PORT STATUS CHECK** - Simple backend:

1. Check port 8080 (Backend API):
   - netstat.exe -ano | grep ":8080 " | grep "LISTENING"
   - Display PID and status

2. Show status:
   - ✅ Port in use by backend process
   - ⚠️ Port in use by unexpected process (orphaned)
   - ❌ Port not in use

**Use when**:
- "Port already in use" errors
- Checking if backend is actually running
- Finding orphaned processes
