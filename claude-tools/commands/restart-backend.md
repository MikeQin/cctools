---
description: Restart backend only (fastest iteration - MCP stays running)
---
Restart backend for fast iteration:

1. Run ./gitbash-clean-python-cache.sh all (prevent stale cache issues)
2. Run ./gitbash-stop-backend.sh
3. Run ./gitbash-start-backend.sh
4. Wait for startup (~10-15s)
5. Run curl http://localhost:8001/health to verify
6. Display startup logs tail (last 20 lines)
