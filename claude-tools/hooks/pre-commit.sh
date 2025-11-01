#!/usr/bin/env bash

echo "🔍 PRE-COMMIT VALIDATION"

# Exit on first error
set -e

# 1. Run critical smoke tests
echo ""
echo "=========================================="
echo "STEP 1: Critical Smoke Tests"
echo "=========================================="

# Check if MCP server is running
if curl -s http://localhost:8000/health >/dev/null 2>&1; then
  echo "Testing MCP Integration (22 tools)..."
  PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py || {
    echo "❌ MCP integration test FAILED"
    exit 1
  }

  echo "Testing V3 Analyst Cache..."
  PYTHONPATH=backend uv run pytest tests/agents/test_v3_analyst_cache.py -v || {
    echo "❌ V3 Analyst cache test FAILED"
    exit 1
  }
else
  echo "⚠️  MCP server not running - skipping integration tests"
  echo "💡 Tip: Start services with ./gitbash-start-python.sh for full validation"
fi

# 2. Quick type safety check
echo ""
echo "=========================================="
echo "STEP 2: Type Safety Validation"
echo "=========================================="

# Check TypeScript strict mode
if [ -f "frontend/tsconfig.json" ]; then
  if ! grep -q '"strict": true' frontend/tsconfig.json; then
    echo "⚠️ TypeScript strict mode not enabled"
  else
    echo "✅ TypeScript strict mode enabled"
  fi
else
  echo "✅ No TypeScript config changes"
fi

# 3. Check for hardcoded values (only in staged files)
echo ""
echo "=========================================="
echo "STEP 3: Hardcoded Values Check"
echo "=========================================="

# Get list of staged files
STAGED_FILES=$(git diff --cached --name-only)

# Check staged frontend files for hardcoded localhost
for file in $STAGED_FILES; do
  if [[ "$file" == frontend/src/*.ts || "$file" == frontend/src/*.tsx ]]; then
    if grep -q "http://localhost" "$file" 2>/dev/null && ! grep -q "BACKEND_API_URL" "$file"; then
      echo "❌ Found hardcoded localhost URL in: $file"
      echo "💡 Use environment variable BACKEND_API_URL instead"
      exit 1
    fi
  fi
done

# Check staged files for test API keys
for file in $STAGED_FILES; do
  if [[ "$file" == backend/*.py || "$file" == frontend/src/*.ts* ]]; then
    if grep -q "otapi_test123" "$file" 2>/dev/null; then
      echo "❌ Found test API key in: $file"
      exit 1
    fi
  fi
done

echo "✅ No hardcoded values in staged files"

# 4. Frontend linting (only if frontend files changed)
echo ""
echo "=========================================="
echo "STEP 4: Frontend Linting"
echo "=========================================="

# Check if any frontend files changed
if git diff --cached --name-only | grep -q "^frontend/src/"; then
  echo "Frontend files changed - running linter..."
  cd frontend
  npm run lint || {
    echo "❌ Frontend linting FAILED"
    exit 1
  }
  cd ..
else
  echo "✅ No frontend files changed - skipping linting"
fi

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
