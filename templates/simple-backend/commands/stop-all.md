---
description: Stop backend service
---
**STOP BACKEND**:

⚠️ **CUSTOMIZE THIS COMMAND** - Update with your actual stop script

Example:

```bash
# Replace with your stop script
./stop-backend.sh

# Or kill by port:
# Linux/Mac: kill $(lsof -ti:8080)
# Windows: taskkill /F /PID $(netstat -ano | grep ":8080 " | grep "LISTENING" | awk '{print $NF}')
```

Verify it's stopped:
```bash
/ports
```
