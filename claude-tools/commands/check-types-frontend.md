---
description: Check TypeScript interfaces BEFORE implementing components
---
**TYPE SAFETY CHECK - FRONTEND** (prevents type mismatches):

Before implementing ANY frontend component:

1. Read relevant TypeScript interface in frontend/src/types/
2. Display all field types and shapes
3. Show expected API response structure
4. Verify array vs object expectations
5. Check for common pitfalls:
   - Backend sends {field: "value"} but frontend expects {field: ["value"]}
   - Date parsing issues
   - Optional field handling (null/undefined)
   - Empty string "" vs null

**RULE**: READ TYPE DEFINITIONS FIRST before writing ANY code.
