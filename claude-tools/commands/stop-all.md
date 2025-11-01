---
description: Stop all 3 components gracefully
---
Stop all components:

1. Run ./stop-frontend.sh to stop Frontend
2. Run ./gitbash-stop-python.sh to stop Backend and MCP
3. Verify all ports are released (8000, 8001, 3000)
4. Check for orphaned processes (netstat.exe -ano | grep "8000\|8001\|3000")
