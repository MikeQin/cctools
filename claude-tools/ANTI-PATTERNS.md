# Anti-Patterns Quick Reference

**Condensed from `.claude/LESSONS-LEARNED.md` for fast tool execution**

---

## 🚨 The 3 Critical Anti-Patterns

### Anti-Pattern #1: Breaking Working Code Through Unnecessary Changes

**Rule**: Test FIRST, change SECOND.

**Before modifying ANY existing code**:
1. ✅ Test current functionality (confirm it works)
2. ✅ Read type definitions (understand data structures)
3. ✅ Ask: "Is this change truly necessary?"

**Red flags**:
- ❌ "Let me refactor this while I'm here"
- ❌ Modifying working code without testing first
- ❌ Assuming code is broken without verification

---

### Anti-Pattern #2: Type Mismatches Between Backend/Frontend

**Rule**: Read type definitions BEFORE implementing.

**Before implementing ANY API endpoint**:
1. ✅ Read Pydantic model (`backend/models/*.py`)
2. ✅ Read TypeScript interface (`frontend/src/types/*.ts`)
3. ✅ Verify data types match (array vs object, string vs number, null handling)

**Red flags**:
- ❌ Backend returns array, frontend expects single object
- ❌ Backend returns string, frontend expects number
- ❌ Mismatched null/undefined handling

---

### Anti-Pattern #3: Inefficient Debugging Loops

**Rule**: Systematic diagnosis > Trial-and-error.

**If restarting backend 3+ times for same issue**:
1. ⛔ STOP restarting
2. ✅ Use `/debug-checklist` (4-phase systematic approach)
3. ✅ Read actual error messages (don't skim)
4. ✅ Check logs (`logs/backend.log`, `logs/mcp-server.log`)
5. ✅ Verify environment (database, .env, Python cache)

**Red flags**:
- ❌ Restart #1, #2, #3... without diagnosis
- ❌ "Let me try this random fix"
- ❌ Not reading error messages fully

---

## ⚡ Quick Rules

| Situation | Action |
|-----------|--------|
| **Before editing existing code** | Test it works first → Read types → Verify necessity |
| **Before implementing API endpoint** | Read Pydantic model → Read TypeScript interface → Verify match |
| **After 3rd backend restart** | STOP → Use `/debug-checklist` → Systematic diagnosis |
| **Before committing** | Run `./.claude/scripts/pre-commit.sh` (5 critical tests) |
| **Starting session** | Use `/session-start` (read full `.claude/LESSONS-LEARNED.md`) |

---

## 🔗 Full Reference

For comprehensive anti-patterns, historical context, and detailed examples:
👉 **Read `.claude/LESSONS-LEARNED.md`** (full version)

---

**Last Updated**: November 1, 2025
