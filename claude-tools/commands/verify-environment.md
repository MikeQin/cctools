---
description: Verify environment variables and dependencies
---
**ENVIRONMENT VERIFICATION** (common debugging issue):

1. Check all .env files exist:
   - [ ] .env (root)
   - [ ] frontend/.env.local
   - [ ] backend/.env (symlink to root)

2. Verify key environment variables:
   - echo $DB_HOST
   - echo $DB_PORT
   - echo $BACKEND_API_KEYS
   - echo $PRIMARY_MODEL
   - echo $OLLAMA_BASE_URL
   - echo $NEXTAUTH_SECRET

3. Check database connectivity:
   - powershell.exe -Command "Test-NetConnection -ComputerName '$DB_HOST' -Port $DB_PORT"

4. Verify UV dependencies synced:
   - uv sync --dry-run (shows what would change)

5. Check Python cache:
   - find . -type d -name __pycache__ | wc -l

Display results and highlight any missing/incorrect values.
