#!/usr/bin/env bash

echo "🔍 PRE-COMMIT VALIDATION"

# Exit on first error
set -e

# 1. Run critical smoke tests
echo ""
echo "=========================================="
echo "STEP 1: Critical Smoke Tests"
echo "=========================================="

echo "Testing MCP Integration (22 tools)..."
PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py || {
  echo "❌ MCP integration test FAILED"
  exit 1
}

echo "Testing V3 Analyst Cache..."
pytest tests/agents/test_v3_analyst_cache.py -v || {
  echo "❌ V3 Analyst cache test FAILED"
  exit 1
}

# 2. Check for type safety issues
echo ""
echo "=========================================="
echo "STEP 2: Type Safety Validation"
echo "=========================================="

# Check for common type mismatches in Python
echo "Checking Python type safety..."
if grep -r "cast(" backend/ --include="*.py" | grep -v "# type: ignore"; then
  echo "⚠️ Found type casts - verify these are necessary"
fi

# Check TypeScript strict mode
if [ -f "frontend/tsconfig.json" ]; then
  if ! grep -q '"strict": true' frontend/tsconfig.json; then
    echo "⚠️ TypeScript strict mode is not enabled"
  fi
fi

# 3. Check for hardcoded values
echo ""
echo "=========================================="
echo "STEP 3: Hardcoded Values Check"
echo "=========================================="

if grep -r "http://localhost" frontend/src --exclude-dir=node_modules --exclude-dir=.next | grep -v "BACKEND_API_URL" | grep -v ".md"; then
  echo "❌ Found hardcoded localhost URLs in frontend"
  exit 1
fi

if grep -r "otapi_test123" backend/ frontend/ --exclude-dir=node_modules --exclude="*.md" --exclude="*.sh"; then
  echo "❌ Found test API keys in production code"
  exit 1
fi

# 4. Frontend linting
echo ""
echo "=========================================="
echo "STEP 4: Frontend Linting"
echo "=========================================="

cd frontend
npm run lint || {
  echo "❌ Frontend linting FAILED"
  exit 1
}
cd ..

# 5. Clean Python cache
echo ""
echo "=========================================="
echo "STEP 5: Cache Cleanup"
echo "=========================================="

./gitbash-clean-python-cache.sh all

echo ""
echo "=========================================="
echo "✅ PRE-COMMIT CHECKS PASSED"
echo "=========================================="
exit 0
