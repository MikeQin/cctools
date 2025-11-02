---
description: Check database connectivity (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Check if your database is accessible.

**To customize**: Edit this file with YOUR database details.

## Quick Setup

### Example 1: PostgreSQL
```bash
# Check if PostgreSQL is running
pg_isready -h localhost -p 5432

# Or using psql
psql -h localhost -p 5432 -U your_user -d your_db -c "SELECT 1"

# Or using PowerShell (Windows)
powershell.exe -Command "Test-NetConnection -ComputerName localhost -Port 5432 -InformationLevel Quiet"
```

### Example 2: MySQL/MariaDB
```bash
# Check if MySQL is running
mysqladmin -h localhost -P 3306 -u root ping

# Or test connection
mysql -h localhost -P 3306 -u your_user -p your_db -e "SELECT 1"
```

### Example 3: MongoDB
```bash
# Check if MongoDB is running
mongo --host localhost --port 27017 --eval "db.adminCommand('ping')"

# Or using mongosh (newer versions)
mongosh --host localhost --port 27017 --eval "db.adminCommand('ping')"
```

### Example 4: Redis
```bash
# Check if Redis is running
redis-cli ping

# Or with host/port
redis-cli -h localhost -p 6379 ping
```

### Example 5: SQLite
```bash
# Check if database file exists and is valid
sqlite3 your_database.db "SELECT 1"
```

### Example 6: Docker Container Database
```bash
# Check if database container is running
docker ps | grep database

# Check health
docker inspect --format='{{.State.Health.Status}}' database-container
```

## Environment Variables Check

If your database connection uses environment variables:
```bash
echo "DB_HOST: $DB_HOST"
echo "DB_PORT: $DB_PORT"
echo "DB_NAME: $DB_NAME"
```
