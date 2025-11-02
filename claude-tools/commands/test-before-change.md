---
description: Test existing functionality before changes (GOOD PRACTICE)
---
**TEST BEFORE CHANGE** - Verify current behavior before modifying code:

This follows **Anti-Pattern #1: Breaking Working Code**
(See .claude/LESSONS-LEARNED.md)

## Process

1. **Identify what you're about to change**:
   ```bash
   # Example: About to modify authentication logic
   FILE="src/auth/login.py"
   ```

2. **Run existing tests for that component**:
   ```bash
   # Python example
   pytest tests/test_auth.py -v
   
   # Node.js example
   npm test -- auth.test.js
   
   # Go example
   go test ./pkg/auth/... -v
   ```

3. **Verify tests pass BEFORE making changes**:
   - ✅ All tests pass = safe to proceed
   - ❌ Tests fail = fix existing issues first!

4. **Make your changes**

5. **Run same tests again**:
   - ✅ Still pass = changes didn't break anything
   - ❌ Now fail = your changes broke something

## Examples

### Modifying API Endpoint
```bash
# Before: Test the endpoint works
pytest tests/api/test_users_endpoint.py

# Make your changes to users endpoint

# After: Verify still works
pytest tests/api/test_users_endpoint.py
```

### Refactoring Database Layer
```bash
# Before: Test database operations work
pytest tests/integration/test_database.py

# Refactor database code

# After: Verify database still works
pytest tests/integration/test_database.py
```

### Changing UI Component
```bash
# Before: Test component renders correctly
npm test -- Button.test.tsx

# Modify Button component

# After: Verify component still works
npm test -- Button.test.tsx
```

## Why This Matters

**Without testing first**:
- ❌ Don't know if code was already broken
- ❌ Can't tell if YOU broke it or it was already broken
- ❌ Waste time debugging pre-existing issues

**With testing first**:
- ✅ Know the starting state
- ✅ Can confidently identify what YOUR changes broke
- ✅ Faster debugging

## Related Commands

- `/pre-change` - Full impact analysis before modifying code
- `/quick-test` - Fast validation after changes
- `/test-critical` - Thorough testing before commit
