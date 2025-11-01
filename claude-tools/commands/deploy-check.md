---
description: Pre-deployment validation checklist
---
**PRE-DEPLOYMENT VALIDATION** (run before deploying to production):

1. Run critical smoke tests:
   - /test-critical (must pass all 5 tests)

2. Build frontend:
   - /build-frontend (must have zero ESLint warnings)

3. Security validation:
   - Run ./.claude/hooks/security-check.sh
   - Check for exposed secrets
   - Verify no test API keys in code

4. Environment check:
   - Verify NEXTAUTH_SECRET is NOT default value
   - Check BACKEND_API_KEYS are production keys
   - Verify database connection string is correct

5. Git status:
   - Run git status (should be clean)
   - Ensure all changes are committed

6. Display deployment readiness summary:
   - ✅ All tests passed
   - ✅ Frontend builds successfully
   - ✅ Security validation passed
   - ✅ Environment configured
   - ✅ Git status clean

**If all checks pass**: Ready to deploy
**If any fail**: DO NOT deploy - fix issues first
