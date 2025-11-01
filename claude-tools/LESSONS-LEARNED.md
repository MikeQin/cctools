# Lessons Learned - Critical Anti-Patterns

## 🚨 Top 3 Anti-Patterns

### 1. Breaking Working Code
**Rule**: Before modifying existing code, ask "Is this necessary? What could break?"
- Test existing functionality BEFORE changes
- Create NEW code instead of modifying complex existing code when possible
- If it works, leave it alone

### 2. Type Mismatches
**Rule**: READ type definitions FIRST (Pydantic models, TypeScript interfaces)
- Common: `{"field": "value"}` vs `{"field": ["value"]}`, `float` vs `str`, `null` handling
- Verify at boundaries - log actual data types at API handoffs
- Test with real data, not assumptions

### 3. Inefficient Debugging
**Rule**: If restarting 3+ times, STOP and reassess strategy
- Read docs (CLAUDE.md, ARCHITECTURE.md) before diving into fixes
- Check obvious things: env vars, imports, types, Python cache
- Root cause analysis, not trial-and-error

## 📋 Quick Checklist

**Before ANY task:**
1. Check `git status` and `git log -3`
2. Read type definitions if working with data
3. Understand what code will be affected
4. Make ONE change at a time, test immediately

**Full docs**: See CLAUDE.md (architecture), ARCHITECTURE.md (agents), API.md (endpoints)
