---
description: Run critical smoke tests (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Run 5 critical tests that MUST pass before commit/deploy.

**To customize**: Replace with YOUR project's critical tests.

## Quick Setup

### Example: Multi-Component App
```bash
echo "🔍 Running 5 critical smoke tests..."

# 1. Database connectivity
echo "1/5 Testing database connection..."
your-db-test-command

# 2. API health check  
echo "2/5 Testing API health..."
curl -f http://localhost:8080/health || exit 1

# 3. Integration test
echo "3/5 Running integration tests..."
pytest tests/integration/test_critical.py || exit 1

# 4. Type checking
echo "4/5 Type checking..."
mypy src/ || exit 1

# 5. Build verification
echo "5/5 Testing build..."
npm run build || exit 1

echo "✅ All critical tests passed!"
```

### Example: Backend Only
```bash
# 1. Unit tests (critical paths)
pytest tests/test_auth.py tests/test_api.py

# 2. Type safety
mypy src/

# 3. Linting (errors only)
pylint --errors-only src/

# 4. Security check
bandit -r src/ -ll

# 5. API contract tests
pytest tests/test_api_contracts.py
```

### Example: Frontend Only
```bash
# 1. TypeScript compilation
tsc --noEmit

# 2. ESLint (errors only)
npm run lint -- --max-warnings 0

# 3. Unit tests (critical)
npm test -- --testPathPattern=critical

# 4. Build test
npm run build

# 5. Bundle size check
npm run analyze
```

## Typical Critical Tests

Choose 5 that matter most for YOUR project:
- Database connectivity
- API health endpoints
- Authentication/authorization
- Critical business logic
- Type safety
- Build verification
- Security scans
- Contract tests
- Performance benchmarks
