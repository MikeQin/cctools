---
description: Check port usage (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

This command checks which processes are using your project's ports.

**To customize**: Edit this file and specify YOUR project's ports.

## Quick Setup

Choose the example that matches your architecture:

### Example 1: Multi-Component App (3 services)
```bash
# Check ports 8000, 8001, 3000
netstat.exe -ano | grep ":8000 \|:8001 \|:3000 " | grep "LISTENING"
```

### Example 2: Simple Backend (1 service)
```bash
# Check port 8080
netstat.exe -ano | grep ":8080 " | grep "LISTENING"
```

### Example 3: Microservices (5+ services)
```bash
# Check multiple ports
netstat.exe -ano | grep ":8080 \|:8081 \|:8082 \|:5432 \|:6379 " | grep "LISTENING"
```

## Or Use a Template

See `templates/` directory for ready-to-use examples:
- `templates/multi-component-app/commands/ports.md`
- `templates/simple-backend/commands/ports.md`
- `templates/docker-compose/commands/ports.md`

## Output Interpretation

- ✅ Port in use by expected process
- ⚠️ Port in use by unexpected process (orphaned)
- ❌ Port not in use
