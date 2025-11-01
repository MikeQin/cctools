---
description: Check health status of all components
---
Check health status:

1. Run ./gitbash-status.sh for Python components
2. Run curl http://localhost:3000/api/health for Frontend
3. Check ports in use: netstat.exe -ano | grep "LISTENING" | grep "8000\|8001\|3000"
4. Display summary of all component statuses with response times
