---
description: Check component health (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

This command checks if your services are healthy and responding.

**To customize**: Edit this file with YOUR health check URLs.

## Quick Setup

Choose the example that matches your architecture:

### Example 1: Multi-Component with Health Endpoints
```bash
# Check multiple services
curl http://localhost:8000/health    # MCP Server
curl http://localhost:8001/health    # Backend API  
curl http://localhost:3000/api/health # Frontend
```

### Example 2: Simple Backend
```bash
# Check single service
curl http://localhost:8080/health
```

### Example 3: Docker Compose
```bash
# Check Docker containers
docker ps --format "table {{.Names}}\t{{.Status}}"
```

### Example 4: No Health Endpoints
```bash
# Just check if ports are open
netstat.exe -ano | grep "LISTENING" | grep ":8080"
```

## Or Use a Template

See `templates/` directory for ready-to-use examples:
- `templates/multi-component-app/commands/status.md`
- `templates/simple-backend/commands/status.md`
- `templates/docker-compose/commands/status.md`

## Custom Script

If you have a custom status script:
```bash
./your-status-check-script.sh
```
