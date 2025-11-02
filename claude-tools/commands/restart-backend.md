---
description: Restart backend service (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Quick backend restart (faster than full restart).

**To customize**: Edit this file with YOUR backend restart commands.

## Quick Setup

### Example 1: Custom Script
```bash
./stop-backend.sh && ./start-backend.sh
```

### Example 2: Docker Container
```bash
docker-compose restart backend
# Or: docker restart backend-container
```

### Example 3: Kill & Restart by Port
```bash
# Stop
kill $(lsof -ti:8080)
# Or Windows: taskkill //F //PID $(netstat -ano | grep ":8080" | awk '{print $NF}')

# Start
./start-backend.sh
```

### Example 4: Process Manager
```bash
# PM2
pm2 restart backend

# Systemctl
sudo systemctl restart backend

# Supervisorctl
supervisorctl restart backend
```

## After Restart

Verify backend is running:
```bash
/status
curl http://localhost:YOUR_PORT/health
```
