# Lessons Learned - Critical Patterns to Avoid

**Purpose**: This document captures recurring mistakes and inefficiencies observed during development. Read this at the START of EVERY session before making any changes.

---

## 🚨 Critical Anti-Patterns

### 1. **Breaking Working Code Through Unnecessary Changes**

**Problem**: Previously working code gets broken during "improvements" or refactoring, leading to hours of debugging.

**Why This Happens**:
- Insufficient impact analysis before changes
- Over-eager refactoring without validating necessity
- Lack of regression testing after modifications
- Poor understanding of code dependencies in complex codebases
- "Fixing" things that aren't broken

**Rules to Follow**:
1. ✅ **Before changing ANY working code** - Ask: "Is this change necessary? What could it break?"
2. ✅ **Document dependencies first** - Map what depends on the code before touching it
3. ✅ **Test existing functionality FIRST** - Verify current behavior BEFORE making changes
4. ✅ **Make smaller, isolated changes** - One thing at a time, verify it works, then move on
5. ✅ **When something works - LEAVE IT ALONE** unless there's a compelling reason to change it
6. ✅ **Creating from scratch is often safer** than modifying complex existing code

**Key Insight**: I get it right when building NEW features, but break things when modifying EXISTING code. Treat modifications with the same careful planning as new features.

---

### 2. **Type Mismatch Errors Between Components**

**Problem**: Creating code with incompatible data types between functions, backend/frontend, or components, resulting in hours of debugging.

**Common Type Mismatches**:
- Backend sends `{"field": "value"}` but frontend expects `{"field": ["value"]}`
- Function expects `float` but receives `str` (or vice versa)
- Optional field is `None` but code doesn't handle it
- Backend sends `date_string` but frontend parses as `Date` object incorrectly
- Array vs single object confusion
- String "0" vs integer 0
- Empty string "" vs null/undefined

**Why This Happens**:
1. Not reading type definitions before writing code
2. Assumptions about data shape without verification
3. No validation at API/component boundaries
4. Ignoring TypeScript/Pydantic type safety tools
5. Poor testing - not verifying actual data flow

**Rules to Follow**:
1. ✅ **READ TYPE DEFINITIONS FIRST** - Check Pydantic models, TypeScript interfaces BEFORE writing ANY code
2. ✅ **Verify at boundaries** - Log/print actual data types at API handoffs (backend → frontend)
3. ✅ **Use type checking tools** - Run `mypy` for Python, check TypeScript compiler warnings
4. ✅ **Test with real data** - Don't assume - actually call the endpoint and inspect response shape
5. ✅ **Document type contracts** - When creating new endpoints, explicitly document request/response types
6. ✅ **Check Pydantic models** in `backend/models/` before implementing API responses
7. ✅ **Check TypeScript interfaces** in frontend before implementing API calls

**Example Prevention Steps**:
```python
# Before implementing API endpoint:
1. Read the Pydantic model definition
2. Check what types each field expects
3. Verify optional vs required fields
4. Test with actual API call and inspect JSON response
```

```typescript
// Before implementing frontend component:
1. Read the TypeScript interface
2. Check API response type definition
3. Verify array vs object expectations
4. Test with actual API response and console.log the structure
```

---

### 3. **Inefficient Debugging in Complex Codebases**

**Problem**: Simple problems take hours to fix due to inefficient debugging approach. Problem-solving skills degrade as codebase grows.

**Pattern Observed**:
- 60+ background processes running backend restarts and tests
- Multiple attempts at the same types of fixes (restart patterns repeating)
- Long debugging cycles that could have been more systematic
- Trial-and-error approach instead of root cause analysis

**Why This Happens**:
1. Diving into fixes without understanding architecture
2. Not leveraging existing documentation (CLAUDE.md, ARCHITECTURE.md)
3. Trial-and-error instead of systematic diagnosis
4. Not recognizing debugging loops and stepping back to reassess

**Rules to Follow**:
1. ✅ **Start with architectural understanding** - Read relevant docs BEFORE diving into fixes
2. ✅ **Use targeted diagnostics** - Identify root cause first, then fix (not trial-and-error)
3. ✅ **Recognize debugging loops** - If restarting backend 3+ times for same issue, STOP and reassess strategy
4. ✅ **Check obvious things first** - Environment variables, imports, file paths, data types
5. ✅ **Leverage existing documentation** - CLAUDE.md, ARCHITECTURE.md, API.md are there for a reason
6. ✅ **Ask better questions upfront** - "What changed?" "What dependencies exist?" "What's the data flow?"

**Debugging Checklist (Before Multiple Restart Attempts)**:
- [ ] Read relevant architecture documentation
- [ ] Check git diff for recent changes
- [ ] Verify environment variables loaded correctly
- [ ] Check Python bytecode cache (run `./clean-python-cache.sh`)
- [ ] Verify data types at boundaries (print/log actual values)
- [ ] Review error messages carefully (don't skim)

---

## 📋 Pre-Work Checklist

**Before Starting ANY Task:**

### Phase 1: Understand Context
- [ ] Read CLAUDE.md to understand current architecture
- [ ] Read this LESSONS-LEARNED.md file
- [ ] Review ARCHITECTURE.md if working on agents/data flow
- [ ] Review API.md if working on endpoints
- [ ] Check recent git commits (`git log -5 --oneline`) to understand what changed recently

### Phase 2: Analyze Impact
- [ ] Identify what existing code will be affected
- [ ] Map dependencies (what calls this? what does this call?)
- [ ] Read type definitions (Pydantic models, TypeScript interfaces)
- [ ] Check for existing tests that might break

### Phase 3: Plan Changes
- [ ] Can I create NEW code instead of modifying EXISTING code?
- [ ] If modifying existing code: What's the risk of breaking it?
- [ ] What tests should I run to verify nothing breaks?
- [ ] Do I understand the data types at all boundaries?

### Phase 4: Implement
- [ ] Make ONE change at a time
- [ ] Test immediately after each change
- [ ] Verify existing functionality still works
- [ ] Check for type mismatches at boundaries

### Phase 5: Verify
- [ ] Run relevant tests
- [ ] Check API responses match type definitions
- [ ] Verify frontend receives expected data shape
- [ ] Test edge cases (null, empty, missing fields)

---

## 🎯 Key Principles

1. **Complexity is NOT an excuse for inefficiency** - Larger codebases demand MORE systematic approaches, not less

2. **Type safety is not optional** - Type mismatches are preventable with proper verification upfront

3. **Working code is sacred** - Only modify working code when absolutely necessary, and with extreme care

4. **Documentation exists for a reason** - Read CLAUDE.md, ARCHITECTURE.md, API.md BEFORE diving into code

5. **Test boundaries rigorously** - Backend/Frontend, Function/Function, Component/Component - verify data types at ALL boundaries

6. **When in doubt, start fresh** - Creating new code is often safer than modifying complex existing code

7. **Recognize patterns** - If doing the same thing 3+ times, stop and reassess strategy

---

## 📝 Session Start Protocol

**AT THE START OF EVERY SESSION:**

1. Read this LESSONS-LEARNED.md file
2. Read CLAUDE.md for current architecture state
3. Check `git status` and `git log -5` to see what changed recently
4. Ask user: "What are we working on today?" before making assumptions
5. Review relevant documentation (ARCHITECTURE.md, API.md) if needed
6. Follow the Pre-Work Checklist above

---

## 🔄 Continuous Improvement

This document should be updated when new patterns emerge. Add new lessons learned with:
- Clear description of the problem
- Why it happens
- Rules to prevent it
- Examples of prevention steps

**Last Updated**: November 1, 2025
