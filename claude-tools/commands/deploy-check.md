---
description: Pre-deployment validation (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Pre-deployment validation checklist.

**To customize**: Add YOUR project's deployment requirements.

## Deployment Checklist

### 1. Code Quality
```bash
# All tests pass
npm test
# Or: pytest
# Or: go test ./...

# Linting passes
npm run lint
# Or: pylint src/
# Or: golangci-lint run

# Type checking passes
tsc --noEmit
# Or: mypy src/
```

### 2. Build Verification
```bash
# Production build succeeds
npm run build
# Or: docker build -t myapp:latest .
# Or: go build -o myapp

# No errors or warnings in build output
```

### 3. Environment Configuration
```bash
# Production environment variables set
/env-check

# Secrets configured (API keys, tokens)
# Database URLs correct
# Feature flags configured
```

### 4. Security Checks
```bash
# Run security scan
./.claude/hooks/security-check.sh

# No hardcoded secrets
git grep -i "password\|secret\|api.key" src/

# Dependencies have no critical vulnerabilities
npm audit --production --audit-level=high
# Or: safety check
# Or: snyk test
```

### 5. Database Migrations
```bash
# Migrations tested
# Rollback plan ready
# Backup completed

# Example: Django
python manage.py migrate --check

# Example: Rails
rails db:migrate:status

# Example: Prisma
npx prisma migrate status
```

### 6. Performance
```bash
# Load testing completed (if applicable)
# Bundle size acceptable
# API response times acceptable
```

### 7. Monitoring & Logs
```bash
# Logging configured
# Error tracking setup (Sentry, etc.)
# Metrics/APM configured
# Alerts configured
```

## Platform-Specific

### Vercel/Netlify
```bash
# Preview deployment tested
# Environment variables synced
# Build command correct
```

### Docker/Kubernetes
```bash
# Image builds successfully
docker build -t myapp:v1.0.0 .

# Container starts without errors
docker run --rm myapp:v1.0.0

# Health checks pass
```

### Traditional Server
```bash
# SSH access verified
# Deployment scripts tested
# Backup script ready
# Rollback procedure documented
```

## Final Checklist

- [ ] All tests pass
- [ ] Build succeeds
- [ ] Security scan clean
- [ ] Environment configured
- [ ] Database migrations ready
- [ ] Monitoring configured
- [ ] Rollback plan ready
- [ ] Team notified

## After Deployment

1. Monitor logs for errors
2. Check health endpoints
3. Verify key user flows
4. Monitor performance metrics
