---
description: Check PostgreSQL database connectivity (mike-linux:5432)
---
**DATABASE CONNECTIVITY CHECK**:

1. Load environment variables from .env
2. Test connection: powershell.exe -Command "Test-NetConnection -ComputerName 'mike-linux' -Port 5432 -InformationLevel Quiet"
3. If successful, display:
   - Database host: mike-linux:5432
   - Expected record counts:
     - CBOE records: 935,839
     - Schwab records: 1,329,811
4. If failed, display:
   - ❌ Database not reachable
   - Suggest checking if database server is running
   - Remind that MCP server requires database connection

**Purpose**: MCP server (port 8000) requires PostgreSQL for all 22 tools
