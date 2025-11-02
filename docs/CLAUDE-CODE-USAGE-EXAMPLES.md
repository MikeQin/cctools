# Claude Code Tools - Usage Examples

**Practical examples for common development scenarios**

**Last Updated**: November 1, 2025

**Balanced Token-Conscious Approach**: Essential automation active (session-start, pre-edit hooks) with 70-75% token savings vs original. Commands available on-demand.

---

## 🚀 Daily Development Scenarios

### Scenario 1: Starting Your Day (Balanced Approach)

**Goal**: Begin a new development session safely with balanced token usage

```
1. Session starts automatically (hook runs when Claude Code launches)
   → Reads .claude/LESSONS-LEARNED.md (now only 31 lines - ~400 tokens!)
   → Shows recent git changes
   → Asks what you're working on
   → 84% token savings vs original (2,500 → 400 tokens)

2. /status
   → Checks if all components are running
   → Shows health status

3. If components aren't running:
   /start-all
   → Starts MCP (8000), Backend (8001), Frontend (3000)
```

**Token Cost**: ~400 tokens per session (automatic session-start hook)
**Token Savings**: 84% vs original verbose LESSONS-LEARNED.md (2,500 → 400 tokens)

**Expected Output**:
```
🚀 Claude Code Session Starting...

📋 Session Start Protocol:
  1. ✅ Read .claude/LESSONS-LEARNED.md (concise - 31 lines)
  2. ✅ Check recent git changes
  3. ✅ Verify component status

💡 Tip: Use /session-start for full protocol

✅ Components appear to be running

SESSION START PROTOCOL:
✅ Read .claude/LESSONS-LEARNED.md
✅ Read CLAUDE.md
📋 Recent commits:
   - fix: Fixed bug in gamma flip calculation
   - feat: Added new API endpoint
🎯 What are we working on today?
```

---

### Scenario 2: Adding a New API Endpoint

**Goal**: Create `/api/v3/new-endpoint` without type mismatches

```
1. /pre-change
   → Asks impact analysis questions
   → "What existing code will be affected?"

2. /check-types-backend
   → Read backend/models/new_endpoint.py (Pydantic model)
   → Display field types (required vs optional)
   → Show example JSON structure

3. Implement the endpoint

4. /check-types-frontend
   → Read frontend/src/types/api.ts
   → Verify TypeScript interface matches Pydantic model

5. /validate-api-contract
   → Make actual API call
   → Compare response to type definitions
   → Check for mismatches

6. /test-before-change
   → Run relevant tests to verify nothing broke
```

**Expected Workflow**:
```
Step 1: Pre-Change Analysis
❓ Is this change necessary? → Yes, new feature requirement
❓ What existing code will be affected? → None, new endpoint
❓ What could this break? → Nothing if types match
❓ Can we create NEW code? → Yes (safer than modifying)
✅ Proceed

Step 2: Backend Type Check
📖 Reading backend/models/new_endpoint_response.py
{
  "status": str (required),
  "data": List[Dict] (required),
  "timestamp": datetime (optional)
}
✅ Types documented

Step 5: API Contract Validation
🌐 Calling http://localhost:8001/api/v3/new-endpoint
✅ Response matches Pydantic model
✅ Response matches TypeScript interface
✅ No type mismatches detected
```

---

### Scenario 3: Debugging "Backend Won't Start"

**Goal**: Systematically fix backend startup issues

```
After 3 failed restart attempts:

1. /debug-checklist
   → Runs systematic diagnosis
   → Phase 1: Obvious checks (env vars, cache, imports)
   → Phase 2: Data flow analysis
   → Phase 3: Documentation review
   → Phase 4: Error analysis

Common issues found:
- ❌ Python bytecode cache stale
- ❌ Database not reachable
- ❌ Environment variable missing
```

**Expected Workflow**:
```
🔍 SYSTEMATIC DEBUGGING CHECKLIST

Phase 1: Obvious Checks
✅ Git diff: No recent changes
❌ Python cache: Found stale __pycache__
   → Run: ./gitbash-clean-python-cache.sh all

Phase 2: Data Flow Analysis
❌ Database connectivity FAILED
   → Run: /db-status
   → Database mike-linux:5432 not reachable
   → Start database server first

Phase 3: Documentation Review
📖 ARCHITECTURE.md: MCP requires database
📖 SCRIPTS-GUIDE.md: Database-first startup

✅ Issue Found: Database not running
✅ Solution: Start database, then run /start-all
```

---

### Scenario 4: Before Committing Code

**Goal**: Ensure no broken code reaches git

```
1. /test-critical
   → Runs 5 critical smoke tests
   → MCP integration (22 tools)
   → V3 analyst cache
   → Model fallback
   → V3 endpoints
   → OI integration

2. ./.claude/hooks/pre-commit.sh
   → Runs tests again
   → Type safety validation
   → Hardcoded value detection
   → Frontend linting
   → Cache cleanup

3. If all pass:
   /commit-session
   → Creates commit with co-author
```

**Expected Output**:
```
CRITICAL SMOKE TESTS:

1. MCP Integration (22 tools): ✅ PASSED (8.2s)
2. V3 Analyst Cache: ✅ PASSED (3.1s)
3. Model Fallback: ✅ PASSED (2.5s)
4. V3 Endpoints: ✅ PASSED (4.7s)
5. OI Integration: ✅ PASSED (6.3s)

Total: 5/5 tests passed (24.8s)

✅ Safe to commit
```

---

### Scenario 5: Frontend Component with API Integration

**Goal**: Create new React component that calls backend API

```
1. /check-types-frontend
   → Read TypeScript interface for props
   → Verify expected data structure

2. Implement component

3. ./.claude/hooks/post-edit.sh frontend/src/components/NewComponent.tsx
   → TypeScript type check
   → Verifies no 'any' types
   → Checks for hardcoded localhost

4. /build-frontend
   → npm run lint
   → npm run build
   → Verify zero ESLint warnings
```

**Expected Workflow**:
```
Step 1: Type Check
📖 Reading frontend/src/types/new-component.ts

interface NewComponentProps {
  data: Array<{
    id: number;
    name: string;
    value: number | null;
  }>;
  onUpdate: (id: number) => void;
}

✅ Types defined
⚠️ Watch out for: null handling on 'value' field

Step 3: Post-Edit Validation
✅ TypeScript compilation successful
✅ No type errors found
⚠️ Found 'any[]' on line 45 - consider specific type
✅ No hardcoded localhost found
```

---

### Scenario 6: Large-Scale Refactoring

**Goal**: Safely refactor 15+ files to extract common code

```
1. /pre-change
   → Document all affected files
   → Map dependencies

2. Use refactor-agent (sub agent):
   "Use the refactor-agent to extract common code from backend/agent-profiles/ into backend/agent-profiles/common/"

3. Agent workflow:
   → Tests existing functionality FIRST
   → Reads type definitions
   → Makes small isolated changes
   → Runs tests after EACH change
   → Verifies nothing broke

4. After refactoring:
   /test-all
   → Run complete test suite
   → Verify all 66 tests still pass
```

**Expected Agent Output**:
```
🤖 Refactor Agent Starting:

Step 1: Test Existing Functionality
✅ Running pytest tests/agent-profiles/ -v
✅ All 10 agent tests PASSED

Step 2: Analyze Code for Common Patterns
📖 Found common code in:
   - chat_agent_v3.py (lines 45-120)
   - analyst_agent_v3.py (lines 67-145)
   - trader_agent_v3.py (lines 89-160)

Step 3: Extract to backend/agent-profiles/common/tool_utils.py
✅ Created new file
✅ Updated imports in 3 files

Step 4: Test After Change
✅ Running pytest tests/agent-profiles/ -v
✅ All 10 agent tests still PASSED

✅ Refactoring complete - no functionality broken
```

---

### Scenario 7: Quick Iteration During Development

**Goal**: Fast feedback loop while coding

```
1. Make code changes

2. /quick-test
   → Runs 2 most critical tests (~30s)
   → MCP integration
   → V3 analyst cache

3. If pass:
   /restart-backend
   → Fast restart without restarting MCP

4. Repeat
```

**Speed Comparison**:
```
/quick-test:     ~30-45 seconds
/test-critical:  ~2-3 minutes
/test-all:       ~5-8 minutes

Use /quick-test for rapid iteration ✨
```

---

### Scenario 8: Before Deploying to Production

**Goal**: Comprehensive pre-deployment validation

```
1. /deploy-check
   → Runs /test-critical
   → Runs /build-frontend
   → Runs security-check.sh
   → Verifies environment variables
   → Checks git status

2. If any fail:
   → DO NOT deploy
   → Fix issues first
   → Re-run /deploy-check

3. If all pass:
   → Safe to deploy ✅
```

**Expected Output**:
```
PRE-DEPLOYMENT VALIDATION:

Step 1: Critical Tests
✅ All 5 tests PASSED

Step 2: Frontend Build
✅ npm run lint: 0 warnings
✅ npm run build: SUCCESS

Step 3: Security Validation
✅ No exposed secrets
✅ No test API keys in code
✅ No SQL injection patterns
✅ No XSS vulnerabilities

Step 4: Environment Check
✅ NEXTAUTH_SECRET: Production value
✅ BACKEND_API_KEYS: Production keys
✅ Database connection: Configured

Step 5: Git Status
✅ Working directory clean

========================================
✅ READY TO DEPLOY
========================================
```

---

## 🎯 Quick Reference by Task Type

### Starting Work
```
/session-start → /status → /start-all
```

### API Development
```
/check-types-backend → implement → /validate-api-contract
```

### Frontend Development
```
/check-types-frontend → implement → /build-frontend
```

### Debugging
```
After 3 restarts → /debug-checklist
Connection issues → /verify-environment → /db-status
```

### Before Commit
```
/test-critical → ./.claude/hooks/pre-commit.sh → /commit-session
```

### Before Deploy
```
/deploy-check → (fix any issues) → deploy
```

---

## 🚨 Emergency Scenarios

### "Nothing Works After git pull"

```
1. /clean-cache
2. /sync-deps
3. /verify-environment
4. /stop-all
5. /start-all
```

### "Type Errors Everywhere"

```
1. /check-types-backend
2. /check-types-frontend
3. Use type-validator-agent: "Validate all API contracts"
```

### "Tests Suddenly Failing"

```
1. /check-context (what changed?)
2. git log -5 (recent commits)
3. /verify-environment
4. /clean-cache
5. /test-all
```

---

## 📝 Pro Tips

1. **Always start with `/session-start`** - It prevents hours of debugging
2. **Use `/quick-test` during development** - Faster feedback loop
3. **Run pre-commit hook BEFORE git add** - Catches issues earlier
4. **Use `/pre-change` before modifying existing code** - Prevents breaking working code
5. **Keep `/status` handy** - Quick health check anytime

---

**See Also**:
- [CLAUDE-CODE-TOOLS-USAGE.md](./CLAUDE-CODE-TOOLS-USAGE.md) - Complete command reference
- [LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md) - Anti-patterns to avoid
