---
description: Stop your services (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

This command stops all your project's services gracefully.

**To customize**: Edit this file with YOUR shutdown commands.

## Quick Setup

Choose the example that matches your setup:

### Example 1: Custom Stop Script
```bash
./stop-all.sh
# Or: ./scripts/shutdown.sh
```

### Example 2: Docker Compose
```bash
docker-compose down
# Or: docker compose down
```

### Example 3: Multiple Services (reverse order)
```bash
# Stop services in reverse order
./stop-frontend.sh && \
./stop-backend.sh && \
./stop-database.sh
```

### Example 4: Kill by Port
```bash
# Linux/Mac
kill $(lsof -ti:8080)

# Windows Git Bash
taskkill //F //PID $(netstat -ano | grep ":8080 " | grep "LISTENING" | awk '{print $NF}')
```

### Example 5: NPM/Yarn Scripts
```bash
npm run stop:all
# Or: yarn workspace stop:all
```

## Or Use a Template

See `templates/` directory for ready-to-use examples:
- `templates/multi-component-app/commands/stop-all.md`
- `templates/simple-backend/commands/stop-all.md`
- `templates/docker-compose/commands/stop-all.md`

## After Stopping

Verify services are stopped:
```bash
/ports
```
