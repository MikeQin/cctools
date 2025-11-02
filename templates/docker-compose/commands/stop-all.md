---
description: Stop Docker Compose services
---
**STOP DOCKER COMPOSE SERVICES**:

⚠️ **CUSTOMIZE THIS COMMAND** - Update with your docker-compose.yml location

1. Stop all services:
   ```bash
   docker-compose down
   # Or if using newer Docker CLI:
   docker compose down
   ```

2. Verify containers stopped:
   ```bash
   docker ps
   ```

**Common options**:
- `--volumes` / `-v` - Remove named volumes declared in compose file
- `--remove-orphans` - Remove containers for services not in compose file
- `docker-compose stop` - Stop without removing containers

**Full cleanup** (removes containers, networks, volumes, images):
```bash
docker-compose down --volumes --rmi all
```
