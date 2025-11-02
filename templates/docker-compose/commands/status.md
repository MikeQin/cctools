---
description: Check Docker container health status
---
**DOCKER COMPOSE HEALTH CHECK**:

1. List all containers:
   docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

2. Check container health:
   docker ps --filter "health=healthy" --format "{{.Names}}"
   docker ps --filter "health=unhealthy" --format "{{.Names}}"

3. Show resource usage:
   docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"

4. Display summary:
   - Total containers running vs expected
   - Health status of each
   - Resource usage overview
