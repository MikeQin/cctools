---
description: View recent logs (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

View logs from your services.

**To customize**: Edit this file with YOUR log locations.

## Quick Setup

### Example 1: Log Files
```bash
# View last 50 lines
tail -n 50 logs/backend.log
tail -n 50 logs/frontend.log

# Follow logs in real-time
tail -f logs/backend.log
```

### Example 2: Docker Compose
```bash
# All services
docker-compose logs --tail=50

# Specific service
docker-compose logs --tail=50 backend

# Follow logs
docker-compose logs -f
```

### Example 3: System Logs (Linux)
```bash
# Systemd
journalctl -u your-service -n 50

# Syslog
tail -n 50 /var/log/syslog | grep your-app
```

### Example 4: PM2
```bash
pm2 logs --lines 50
```

### Example 5: Application-Specific
```bash
# Python logging
tail -n 50 app.log

# Node.js with Winston/Bunyan
tail -n 50 combined.log
```

## Common Log Commands

**Search for errors**:
```bash
grep -i "error" logs/*.log
grep -i "exception" logs/*.log
```

**Filter by timestamp**:
```bash
grep "2025-11-02" logs/app.log
```
