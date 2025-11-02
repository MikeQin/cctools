---
description: Fast validation (CUSTOMIZE FOR YOUR PROJECT)
---
**⚠️ TEMPLATE COMMAND - CUSTOMIZE FIRST**

Quick validation (~30s) for fast feedback during development.

**To customize**: Replace with YOUR project's fast tests.

## Quick Setup

### Example 1: Minimal Fast Tests
```bash
echo "⚡ Running quick tests..."

# Test 1: Syntax/Type check (10s)
echo "1/2 Type checking..."
# Python: mypy src/
# TypeScript: tsc --noEmit
# Go: go vet ./...

# Test 2: Fast unit tests (20s)
echo "2/2 Fast unit tests..."
# Python: pytest tests/unit/ -k fast
# Node: npm test -- --testPathPattern=unit
# Go: go test -short ./...

echo "✅ Quick tests passed!"
```

### Example 2: Pre-Commit Style
```bash
# Linting only (fast)
npm run lint

# Type checking
tsc --noEmit

# Format check
prettier --check src/
```

### Example 3: Critical Path Only
```bash
# Test only the feature you're working on
pytest tests/test_my_feature.py -v

# Or specific test class
pytest tests/test_api.py::TestAuthEndpoint
```

## When to Use

- Before making a commit
- After every code change (TDD workflow)
- CI pipeline early stage
- When you want fast feedback

## Complementary Commands

- `/test-critical` - More thorough (5 tests, ~3min)
- `/test-all` - Complete test suite
- `/test-before-change` - Test existing functionality
