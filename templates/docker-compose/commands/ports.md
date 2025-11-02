---
description: Check Docker container port mappings
---
**DOCKER PORT MAPPINGS**:

1. Show all port mappings:
   docker ps --format "table {{.Names}}\t{{.Ports}}"

2. Check specific container ports:
   docker port <container-name>

3. Find what's using a specific port:
   docker ps --filter "publish=8080"

**Output shows**:
- Container name
- Internal port → External port mapping
- Protocol (tcp/udp)

Example output:
```
backend-api    0.0.0.0:8080->8080/tcp
postgres       0.0.0.0:5432->5432/tcp
redis          0.0.0.0:6379->6379/tcp
```
