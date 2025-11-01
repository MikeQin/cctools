---
description: Validate API response matches type definitions
---
**API CONTRACT VALIDATION** (prevents runtime type errors):

1. Ensure backend is running (./gitbash-status.sh)
2. Make actual API call to endpoint (curl or fetch)
3. Display actual JSON response
4. Compare response structure to Pydantic model
5. Compare response structure to TypeScript interface
6. Check for mismatches:
   - Missing fields
   - Wrong types (string vs number, array vs object)
   - Unexpected null values
   - Date format inconsistencies

**RULE**: Test with REAL data - don't assume types match.
