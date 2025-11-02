---
description: Start Docker Compose services
---
**START DOCKER COMPOSE SERVICES**:

⚠️ **CUSTOMIZE THIS COMMAND** - Update with your docker-compose.yml location

1. Start all services:
   ```bash
   docker-compose up -d
   # Or if using newer Docker CLI:
   docker compose up -d
   ```

2. Wait for services to be healthy:
   ```bash
   docker-compose ps
   ```

3. View logs (optional):
   ```bash
   docker-compose logs -f
   ```

4. Verify all containers running:
   ```bash
   /status
   ```

**Common options**:
- `--build` - Rebuild images before starting
- `--force-recreate` - Recreate containers even if config hasn't changed
- `--remove-orphans` - Remove containers for services not in compose file
