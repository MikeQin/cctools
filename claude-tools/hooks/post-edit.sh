#!/usr/bin/env bash

# Hook runs after editing files
# Purpose: Syntax check, type validation, auto-format

EDITED_FILE="$1"

echo "✅ POST-EDIT CHECK: $EDITED_FILE"

# 1. Backend Python files - syntax and type check
if [[ "$EDITED_FILE" == backend/*.py || "$EDITED_FILE" == mcp-server/*.py ]]; then
  echo "Checking Python syntax..."
  python -m py_compile "$EDITED_FILE" 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "❌ SYNTAX ERROR in $EDITED_FILE"
    python -m py_compile "$EDITED_FILE"  # Show error
    exit 1  # Block edit
  fi

  # Optional: Run mypy for type checking (if installed)
  if command -v mypy &> /dev/null; then
    echo "Running mypy type check..."
    mypy "$EDITED_FILE" --ignore-missing-imports 2>&1 | head -20
  fi

  echo "✅ Python syntax OK"
fi

# 2. Frontend TypeScript/TSX files - type check
if [[ "$EDITED_FILE" == frontend/src/*.ts || "$EDITED_FILE" == frontend/src/*.tsx ]]; then
  echo "Checking TypeScript types..."
  cd frontend
  npx tsc --noEmit "$EDITED_FILE" 2>&1 | head -20
  if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "⚠️ TypeScript errors found (review above)"
  else
    echo "✅ TypeScript types OK"
  fi
  cd ..
fi

# 3. Check for common anti-patterns
echo "Checking for anti-patterns..."

# Type mismatches
if grep -q "any\[\]" "$EDITED_FILE" 2>/dev/null; then
  echo "⚠️ Found 'any[]' - Consider using specific type"
fi

# Hardcoded localhost
if grep -q "http://localhost" "$EDITED_FILE" 2>/dev/null; then
  if [[ "$EDITED_FILE" != *.md && "$EDITED_FILE" != *test* ]]; then
    echo "⚠️ Found hardcoded 'http://localhost' - Use environment variable"
  fi
fi

echo "✅ Post-edit checks complete"
exit 0
