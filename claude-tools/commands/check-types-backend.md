---
description: Check Pydantic models BEFORE implementing API endpoints
---
**TYPE SAFETY CHECK - BACKEND** (prevents type mismatches):

Before implementing ANY API endpoint:

1. Read relevant Pydantic model in backend/models/
2. Display all field types (required vs optional)
3. Show example JSON response structure
4. Verify data types match expected frontend interface
5. Check for common pitfalls:
   - Array vs single object
   - String vs number
   - null/None handling
   - Date string formats

**RULE**: READ TYPE DEFINITIONS FIRST before writing ANY code.
