---
description: Validate environment variables (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Validate that all required environment variables are set.

**To customize**: Edit this file with YOUR required variables.

## Quick Setup

Create a list of required environment variables for your project:

### Example 1: Backend API
```bash
# Check if variables are set
echo "API_KEY: ${API_KEY:-NOT_SET}"
echo "DATABASE_URL: ${DATABASE_URL:-NOT_SET}"
echo "REDIS_URL: ${REDIS_URL:-NOT_SET}"
echo "JWT_SECRET: ${JWT_SECRET:-NOT_SET}"
```

### Example 2: Using a Script
```bash
#!/bin/bash
REQUIRED_VARS=(
  "API_KEY"
  "DATABASE_URL"
  "REDIS_URL"
  "JWT_SECRET"
)

for var in "${REQUIRED_VARS[@]}"; do
  if [ -z "${!var}" ]; then
    echo "❌ $var is NOT set"
  else
    echo "✅ $var is set"
  fi
done
```

### Example 3: Check .env File
```bash
# Check if .env file exists
if [ -f ".env" ]; then
  echo "✅ .env file exists"
  # Show variable names (not values)
  grep -v '^#' .env | grep -v '^$' | cut -d '=' -f1
else
  echo "❌ .env file not found"
fi
```

### Example 4: Language-Specific

**Python**:
```python
import os
required = ['API_KEY', 'DATABASE_URL', 'REDIS_URL']
for var in required:
    if var in os.environ:
        print(f"✅ {var} is set")
    else:
        print(f"❌ {var} is NOT set")
```

**Node.js**:
```javascript
const required = ['API_KEY', 'DATABASE_URL', 'REDIS_URL'];
required.forEach(var => {
  if (process.env[var]) {
    console.log(`✅ ${var} is set`);
  } else {
    console.log(`❌ ${var} is NOT set`);
  }
});
```

## What to Check

Typical categories:
- API keys (third-party services)
- Database URLs
- Cache URLs (Redis, Memcached)
- Authentication secrets (JWT, OAuth)
- Service URLs (microservices)
- Feature flags
