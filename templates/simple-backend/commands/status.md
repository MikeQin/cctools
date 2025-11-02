---
description: Check backend health status
---
**BACKEND HEALTH CHECK**:

1. Check Backend API (port 8080):
   curl http://localhost:8080/health

2. Check port in use:
   netstat.exe -ano | grep ":8080 " | grep "LISTENING"

3. Display status with response time

**Expected output**:
- ✅ Backend API: healthy (25ms)
