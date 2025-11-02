---
description: Start your services (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

This command starts all your project's services.

**To customize**: Edit this file with YOUR startup commands.

## Quick Setup

Choose the example that matches your setup:

### Example 1: Custom Startup Script
```bash
./start-all.sh
# Or: ./scripts/startup.sh
```

### Example 2: Docker Compose
```bash
docker-compose up -d
# Or: docker compose up -d
```

### Example 3: Multiple Services (sequential)
```bash
# Start services in order
./start-database.sh && \
./start-backend.sh && \
./start-frontend.sh
```

### Example 4: NPM/Yarn Workspaces
```bash
npm run start:all
# Or: yarn workspace start:all
```

### Example 5: Python Virtual Environments
```bash
source venv/bin/activate && python main.py
```

## Or Use a Template

See `templates/` directory for ready-to-use examples:
- `templates/multi-component-app/commands/start-all.md`
- `templates/simple-backend/commands/start-all.md`
- `templates/docker-compose/commands/start-all.md`

## After Starting

Verify services are running:
```bash
/status
/ports
```
