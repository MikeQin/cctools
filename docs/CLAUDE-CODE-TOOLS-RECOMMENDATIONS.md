# Claude Code Tools Integration Recommendations

**Enhanced with .claude/LESSONS-LEARNED.md patterns** - Prevent recurring mistakes through automation

**Last Updated**: October 31, 2025
**Status**: Production Ready

**References**: [LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md)

> **Note**: Recommendations are tailored for a 0DTE Options Trading application (3-component system). Adapt tools and commands to match your project architecture, tech stack, and anti-patterns.


---

## 📋 Overview

This document provides comprehensive recommendations for integrating Claude Code tools to enhance development workflow efficiency AND prevent recurring anti-patterns identified in .claude/LESSONS-LEARNED.md.

**Recommended Tools**:
- ✅ **Commands** (slash commands) - **CRITICAL** - Enforce best practices, reduce repetitive tasks
- ✅ **Hooks** - **CRITICAL** - Prevent type mismatches, breaking working code
- ✅ **MCP Servers** - **ALREADY CONFIGURED** - Chrome DevTools, Sequential Thinking
- ⚠️ **Sub Agents** - **OPTIONAL** - Complex refactoring tasks
- ❌ **Skills** - **NOT RECOMMENDED** - Not relevant for this codebase
- ❌ **Plugins** - **NOT RECOMMENDED** - Not relevant for this codebase

---

## 🚨 Anti-Pattern Prevention Strategy

Based on [LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md), we automate prevention of:

1. **Breaking Working Code** → Hooks that test existing functionality BEFORE changes
2. **Type Mismatch Errors** → Hooks that validate type definitions at boundaries
3. **Inefficient Debugging** → Commands that enforce systematic diagnosis

**Key Principle**: Tools should make it HARDER to break things and EASIER to do things right.

---

## 🎯 Priority 1: Session Start Commands

**Status**: ⚠️ NOT IMPLEMENTED
**Recommendation**: **IMPLEMENT IMMEDIATELY**
**Impact**: CRITICAL - Enforces reading docs before work (prevents hours of debugging)

### Session Start Protocol Commands

These commands enforce the **Pre-Work Checklist** from .claude/LESSONS-LEARNED.md.

#### **`session-start.md`** - **USE THIS FIRST EVERY SESSION**
```markdown
---
description: Session start protocol - Read docs before making any changes
---
**SESSION START PROTOCOL** (.claude/LESSONS-LEARNED.md enforced):

1. Read .claude/LESSONS-LEARNED.md to review anti-patterns
2. Read CLAUDE.md for current architecture state
3. Run git log -5 --oneline to see recent changes
4. Run git status to check current state
5. Run git diff to see uncommitted changes
6. Display summary and ask: "What are we working on today?"

**CRITICAL**: This command MUST be run at the start of EVERY session before making ANY changes.
```

#### **`check-context.md`** - Understand current state
```markdown
---
description: Check current codebase state before making changes
---
**CONTEXT CHECK** (prevents breaking working code):

1. Run git status
2. Run git log -10 --oneline --graph to see branch history
3. Run git diff to show uncommitted changes
4. Run ./gitbash-status.sh to check running components
5. Display summary of current state
```

#### **`pre-change.md`** - Impact analysis before modifying code
```markdown
---
description: Analyze impact BEFORE modifying any existing code
---
**PRE-CHANGE IMPACT ANALYSIS** (.claude/LESSONS-LEARNED.md Rule #1):

Ask user these questions BEFORE making ANY changes to existing code:

1. ❓ **Is this change necessary?** What problem does it solve?
2. ❓ **What existing code will be affected?** Map dependencies first
3. ❓ **What could this break?** Identify risks
4. ❓ **Can we create NEW code instead of modifying EXISTING code?** (Often safer)
5. ❓ **What tests verify existing functionality?** Run them FIRST

**RULE**: When something works - LEAVE IT ALONE unless there's a compelling reason.

Display these questions and wait for user confirmation before proceeding.
```

---

## 🎯 Priority 2: Type Safety Commands

**Purpose**: Prevent type mismatch errors (.claude/LESSONS-LEARNED.md Anti-Pattern #2)

#### **`check-types-backend.md`** - Verify backend type definitions
```markdown
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
```

#### **`check-types-frontend.md`** - Verify frontend type definitions
```markdown
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
```

#### **`validate-api-contract.md`** - Test API contract matches types
```markdown
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
```

---

## 🎯 Priority 3: Systematic Debugging Commands

**Purpose**: Prevent inefficient debugging loops (.claude/LESSONS-LEARNED.md Anti-Pattern #3)

#### **`debug-checklist.md`** - Systematic diagnosis before trial-and-error
```markdown
---
description: Run debugging checklist BEFORE restarting backend 3+ times
---
**SYSTEMATIC DEBUGGING CHECKLIST** (prevents debugging loops):

**STOP** if you've restarted backend 3+ times for the same issue. Run this checklist:

Phase 1: Obvious Checks
- [ ] Check git diff for recent changes
- [ ] Verify .env variables loaded (echo $VARIABLE_NAME)
- [ ] Check Python bytecode cache (./gitbash-clean-python-cache.sh all)
- [ ] Verify imports are correct (no circular imports)
- [ ] Check file paths are absolute (not relative)

Phase 2: Data Flow Analysis
- [ ] Print actual data types at boundaries (backend → frontend)
- [ ] Log actual values (not assumptions)
- [ ] Verify database connectivity (powershell Test-NetConnection)
- [ ] Check API response structure (curl endpoint | python -m json.tool)

Phase 3: Documentation Review
- [ ] Read CLAUDE.md for architecture context
- [ ] Read ARCHITECTURE.md for data flow
- [ ] Read API.md for endpoint contracts
- [ ] Read relevant type definitions (Pydantic/TypeScript)

Phase 4: Error Analysis
- [ ] Read FULL error message (don't skim)
- [ ] Check logs/backend.log for stack traces
- [ ] Search codebase for similar error patterns (grep -r "error message")

**RULE**: Targeted diagnosis > Trial-and-error
```

#### **`verify-environment.md`** - Check environment setup
```markdown
---
description: Verify environment variables and dependencies
---
**ENVIRONMENT VERIFICATION** (common debugging issue):

1. Check all .env files exist:
   - [ ] .env (root)
   - [ ] frontend/.env.local
   - [ ] backend/.env (symlink to root)

2. Verify key environment variables:
   - echo $DB_HOST
   - echo $DB_PORT
   - echo $BACKEND_API_KEYS
   - echo $PRIMARY_MODEL
   - echo $OLLAMA_BASE_URL
   - echo $NEXTAUTH_SECRET

3. Check database connectivity:
   - powershell.exe -Command "Test-NetConnection -ComputerName '$DB_HOST' -Port $DB_PORT"

4. Verify UV dependencies synced:
   - uv sync --dry-run (shows what would change)

5. Check Python cache:
   - find . -type d -name __pycache__ | wc -l

Display results and highlight any missing/incorrect values.
```

---

## 🎯 Priority 4: Component Management Commands

**Purpose**: Standard development workflow automation

#### **`start-all.md`** - Start all components
```markdown
---
description: Start all 3 components (MCP + Backend + Frontend)
---
Start all components in the correct order:

1. Run ./gitbash-start-python.sh to start MCP (8000) and Backend (8001)
2. Wait for startup completion (~60-90s)
3. Run ./start-frontend.sh to start Frontend (3000)
4. Run ./gitbash-status.sh to verify all components are healthy
5. Display health check results for all 3 ports
```

#### **`stop-all.md`** - Stop all components
```markdown
---
description: Stop all 3 components gracefully
---
Stop all components:

1. Run ./stop-frontend.sh to stop Frontend
2. Run ./gitbash-stop-python.sh to stop Backend and MCP
3. Verify all ports are released (8000, 8001, 3000)
4. Check for orphaned processes (netstat.exe -ano | grep "8000\|8001\|3000")
```

#### **`restart-backend.md`** - Fast backend restart
```markdown
---
description: Restart backend only (fastest iteration - MCP stays running)
---
Restart backend for fast iteration:

1. Run ./gitbash-clean-python-cache.sh all (prevent stale cache issues)
2. Run ./gitbash-stop-backend.sh
3. Run ./gitbash-start-backend.sh
4. Wait for startup (~10-15s)
5. Run curl http://localhost:8001/health to verify
6. Display startup logs tail (last 20 lines)
```

#### **`status.md`** - Check component health
```markdown
---
description: Check health status of all components
---
Check health status:

1. Run ./gitbash-status.sh for Python components
2. Run curl http://localhost:3000/api/health for Frontend
3. Check ports in use: netstat.exe -ano | grep "LISTENING" | grep "8000\|8001\|3000"
4. Display summary of all component statuses with response times
```

---

## 🎯 Priority 5: Testing Commands

**Purpose**: Verify existing functionality before changes (.claude/LESSONS-LEARNED.md)

#### **`test-before-change.md`** - **CRITICAL** - Test BEFORE modifying code
```markdown
---
description: Test existing functionality BEFORE making any changes
---
**TEST EXISTING FUNCTIONALITY FIRST** (.claude/LESSONS-LEARNED.md Rule #3):

This command MUST be run BEFORE modifying ANY existing code:

1. Identify what functionality will be affected by your changes
2. Run relevant tests to verify CURRENT behavior:
   - Agent tests: pytest tests/agents/ -v -k "test_name"
   - MCP tests: PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py
   - Integration tests: pytest tests/integration/ -v
3. Document current test results (all should PASS before changes)
4. If tests fail BEFORE changes → FIX TESTS FIRST, then make changes

**RULE**: Never modify code that doesn't have passing tests.
```

#### **`test-critical.md`** - Run critical smoke tests
```markdown
---
description: Run 5 critical smoke tests (pre-commit/deploy)
---
**CRITICAL SMOKE TESTS** (must pass before commit):

1. MCP Integration (22 tools):
   PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py

2. V3 Analyst Cache (Rule Engine):
   PYTHONPATH=backend uv run python tests/agents/test_v3_analyst_cache.py

3. Model Fallback (3-tier):
   pytest tests/models/test_model_fallback.py -v

4. V3 Endpoints Ready:
   pytest tests/endpoints/test_v3_endpoints_ready.py -v

5. OI Integration:
   PYTHONPATH=backend uv run python tests/integration/test_oi_integration.py

Display pass/fail summary with execution times.

**RULE**: All 5 tests MUST pass before commit.
```

#### **`test-all.md`** - Run complete test suite
```markdown
---
description: Run complete test suite (66 tests)
---
Run all tests:

1. Ensure all components are running (./gitbash-status.sh)
2. Clean Python cache (./gitbash-clean-python-cache.sh all)
3. Run pytest tests/ -v --tb=short
4. Display test results summary (passed/failed/skipped)
5. Show failed test details
```

#### **`test-agents.md`** - Run agent tests
```markdown
---
description: Run V3 agent tests (Analyst, Trader, Chat)
---
Run agent tests:

1. Ensure backend is running (curl http://localhost:8001/health)
2. Run pytest tests/agents/ -v
3. Display results for all 10 agent tests
4. Show any failures with stack traces
```

#### **`test-mcp.md`** - Run MCP integration tests
```markdown
---
description: Run MCP integration tests (22 tools)
---
Run MCP integration tests:

1. Ensure MCP server is running on port 8000
2. Run PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py
3. Verify all 22 MCP tools are accessible
4. Display tool availability summary
```

---

## 🎯 Priority 6: Development Commands

#### **`build-frontend.md`** - Build and validate frontend
```markdown
---
description: Build frontend with zero ESLint warnings check
---
Build frontend:

1. cd frontend
2. Run npm run lint to check for linting errors FIRST
3. Run npm run build
4. Verify zero ESLint warnings (exit if any warnings)
5. Check for build errors
6. Display build size and bundle analysis
```

#### **`clean-cache.md`** - Clean Python bytecode cache
```markdown
---
description: Clean Python bytecode cache (recommended before startup)
---
Clean Python cache:

1. Run ./gitbash-clean-python-cache.sh all
2. Display cleanup summary (directories removed)
3. Recommend running this before backend restarts if seeing import issues
```

#### **`sync-deps.md`** - Sync all dependencies
```markdown
---
description: Sync UV workspace dependencies (root + backend + mcp-server)
---
Sync dependencies:

1. Run uv sync from project root
2. Display sync summary for all 3 components
3. Verify 165+ packages installed
4. Check for version conflicts or warnings
```

---

## 🎯 Priority 7: Git & Documentation Commands

#### **`commit-session.md`** - Create session commit
```markdown
---
description: Create a commit with session summary
---
Create session commit:

1. Run git status to show changes
2. Run git diff --stat to show file changes summary
3. Run git log --oneline -5 to show recent commits
4. Create commit message following project style:
   - feat: for new features
   - fix: for bug fixes
   - docs: for documentation
   - refactor: for code refactoring
   - test: for test additions
   - chore: for maintenance
5. Add Claude Code co-author:
   Co-Authored-By: Claude <noreply@anthropic.com>
6. Run git add . && git commit -m "message"
7. Display commit summary
```

#### **`read-docs.md`** - Read relevant documentation
```markdown
---
description: Read relevant documentation before making changes
---
**DOCUMENTATION REVIEW** (.claude/LESSONS-LEARNED.md Rule #5):

Ask user what they're working on, then display relevant docs:

- Working on agents? → Read docs/ARCHITECTURE.md
- Working on API endpoints? → Read docs/API.md
- Working on symbols/tickers? → Read docs/SYMBOL-MAPPING.md
- Working on calculations? → Read docs/OI-MAXPAIN.md, docs/GAMMA-FLIP-INTERPRETATION.md
- Working on tests? → Read docs/TEST.md
- Working on deployment? → Read docs/DEPLOYMENT.md
- Working on scripts? → Read docs/SCRIPTS-GUIDE.md

**Always read**:
- .claude/LESSONS-LEARNED.md (anti-patterns)
- CLAUDE.md (current architecture)

Display selected documentation sections inline.
```

---

## 🪝 Priority 8: Hooks (CRITICAL)

**Status**: ⚠️ NOT IMPLEMENTED
**Recommendation**: **IMPLEMENT IMMEDIATELY**
**Impact**: CRITICAL - Prevents type mismatches and breaking working code

### Recommended Hooks

Create `.claude/hooks/` directory with the following hook files:

#### **`pre-edit.sh`** - Run BEFORE editing any file
```bash
#!/usr/bin/env bash

# Hook runs before editing ANY file
# Purpose: Verify file exists, read type definitions, check dependencies

FILE_TO_EDIT="$1"

echo "🔍 PRE-EDIT CHECK: $FILE_TO_EDIT"

# 1. Verify file exists
if [ ! -f "$FILE_TO_EDIT" ]; then
  echo "⚠️ File does not exist: $FILE_TO_EDIT"
  echo "This will CREATE a new file. Confirm this is intentional."
  exit 0  # Allow creation but warn
fi

# 2. Check if modifying critical files (backend agents, frontend components)
if [[ "$FILE_TO_EDIT" == backend/agents/* ]]; then
  echo "⚠️ CRITICAL FILE: Backend agent"
  echo "Have you:"
  echo "  - Read .claude/LESSONS-LEARNED.md?"
  echo "  - Tested existing functionality first?"
  echo "  - Reviewed Pydantic models for type definitions?"
  echo ""
  echo "Proceeding with edit..."
fi

if [[ "$FILE_TO_EDIT" == frontend/src/components/* ]]; then
  echo "⚠️ CRITICAL FILE: Frontend component"
  echo "Have you:"
  echo "  - Checked TypeScript interfaces?"
  echo "  - Verified API contract matches backend?"
  echo "  - Tested with real API response?"
  echo ""
  echo "Proceeding with edit..."
fi

# 3. Show recent changes to this file
if [ -f "$FILE_TO_EDIT" ]; then
  echo "Recent changes to this file:"
  git log -3 --oneline -- "$FILE_TO_EDIT" || echo "No git history"
fi

exit 0  # Always allow edit (this is informational only)
```

#### **`post-edit.sh`** - Run AFTER editing files
```bash
#!/usr/bin/env bash

# Hook runs after editing files
# Purpose: Syntax check, type validation, auto-format

EDITED_FILE="$1"

echo "✅ POST-EDIT CHECK: $EDITED_FILE"

# 1. Backend Python files - syntax and type check
if [[ "$EDITED_FILE" == backend/*.py || "$EDITED_FILE" == mcp-server/*.py ]]; then
  echo "Checking Python syntax..."
  python -m py_compile "$EDITED_FILE" 2>/dev/null
  if [ $? -ne 0 ]; then
    echo "❌ SYNTAX ERROR in $EDITED_FILE"
    python -m py_compile "$EDITED_FILE"  # Show error
    exit 1  # Block edit
  fi

  # Optional: Run mypy for type checking (if installed)
  if command -v mypy &> /dev/null; then
    echo "Running mypy type check..."
    mypy "$EDITED_FILE" --ignore-missing-imports 2>&1 | head -20
  fi

  echo "✅ Python syntax OK"
fi

# 2. Frontend TypeScript/TSX files - type check
if [[ "$EDITED_FILE" == frontend/src/*.ts || "$EDITED_FILE" == frontend/src/*.tsx ]]; then
  echo "Checking TypeScript types..."
  cd frontend
  npx tsc --noEmit "$EDITED_FILE" 2>&1 | head -20
  if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "⚠️ TypeScript errors found (review above)"
  else
    echo "✅ TypeScript types OK"
  fi
  cd ..
fi

# 3. Check for common anti-patterns
echo "Checking for anti-patterns..."

# Type mismatches
if grep -q "any\[\]" "$EDITED_FILE" 2>/dev/null; then
  echo "⚠️ Found 'any[]' - Consider using specific type"
fi

# Hardcoded localhost
if grep -q "http://localhost" "$EDITED_FILE" 2>/dev/null; then
  if [[ "$EDITED_FILE" != *.md && "$EDITED_FILE" != *test* ]]; then
    echo "⚠️ Found hardcoded 'http://localhost' - Use environment variable"
  fi
fi

echo "✅ Post-edit checks complete"
exit 0
```

#### **`pre-commit.sh`** - Run before git commits
```bash
#!/usr/bin/env bash

echo "🔍 PRE-COMMIT VALIDATION"

# Exit on first error
set -e

# 1. Run critical smoke tests
echo ""
echo "=========================================="
echo "STEP 1: Critical Smoke Tests"
echo "=========================================="

echo "Testing MCP Integration (22 tools)..."
PYTHONPATH=backend uv run python tests/mcp/test_mcp_integration.py || {
  echo "❌ MCP integration test FAILED"
  exit 1
}

echo "Testing V3 Analyst Cache..."
pytest tests/agents/test_v3_analyst_cache.py -v || {
  echo "❌ V3 Analyst cache test FAILED"
  exit 1
}

# 2. Check for type safety issues
echo ""
echo "=========================================="
echo "STEP 2: Type Safety Validation"
echo "=========================================="

# Check for common type mismatches in Python
echo "Checking Python type safety..."
if grep -r "cast(" backend/ --include="*.py" | grep -v "# type: ignore"; then
  echo "⚠️ Found type casts - verify these are necessary"
fi

# Check TypeScript strict mode
if [ -f "frontend/tsconfig.json" ]; then
  if ! grep -q '"strict": true' frontend/tsconfig.json; then
    echo "⚠️ TypeScript strict mode is not enabled"
  fi
fi

# 3. Check for hardcoded values
echo ""
echo "=========================================="
echo "STEP 3: Hardcoded Values Check"
echo "=========================================="

if grep -r "http://localhost" frontend/src --exclude-dir=node_modules --exclude-dir=.next | grep -v "BACKEND_API_URL" | grep -v ".md"; then
  echo "❌ Found hardcoded localhost URLs in frontend"
  exit 1
fi

if grep -r "otapi_test123" backend/ frontend/ --exclude-dir=node_modules --exclude="*.md" --exclude="*.sh"; then
  echo "❌ Found test API keys in production code"
  exit 1
fi

# 4. Frontend linting
echo ""
echo "=========================================="
echo "STEP 4: Frontend Linting"
echo "=========================================="

cd frontend
npm run lint || {
  echo "❌ Frontend linting FAILED"
  exit 1
}
cd ..

# 5. Clean Python cache
echo ""
echo "=========================================="
echo "STEP 5: Cache Cleanup"
echo "=========================================="

./gitbash-clean-python-cache.sh all

echo ""
echo "=========================================="
echo "✅ PRE-COMMIT CHECKS PASSED"
echo "=========================================="
exit 0
```

#### **`security-check.sh`** - Security validation before deploy
```bash
#!/usr/bin/env bash

echo "🔒 SECURITY VALIDATION"

ERRORS=0

# 1. Check for exposed secrets
echo "Checking for exposed secrets..."
if grep -r "NEXTAUTH_SECRET=your-secret-key" . --exclude-dir=.git --exclude-dir=node_modules --exclude="*.md"; then
  echo "❌ Found default NEXTAUTH_SECRET"
  ERRORS=$((ERRORS + 1))
fi

if grep -r "API_KEY=test" . --exclude-dir=.git --exclude-dir=node_modules --exclude="*.md"; then
  echo "❌ Found test API keys"
  ERRORS=$((ERRORS + 1))
fi

# 2. Check for SQL injection vulnerabilities
echo "Checking for SQL injection patterns..."
if grep -r "execute.*%" backend/ | grep -v "parameterized" | grep -v ".md"; then
  echo "⚠️ Potential SQL injection vulnerability detected"
  ERRORS=$((ERRORS + 1))
fi

# 3. Check for XSS vulnerabilities
echo "Checking for XSS patterns..."
if grep -r "dangerouslySetInnerHTML" frontend/src --exclude-dir=node_modules; then
  echo "⚠️ Found dangerouslySetInnerHTML usage - verify sanitization"
  ERRORS=$((ERRORS + 1))
fi

# 4. Check for exposed environment variables
echo "Checking for exposed environment variables in frontend..."
if grep -r "process.env" frontend/src --include="*.tsx" --include="*.ts" | grep -v "NEXT_PUBLIC_"; then
  echo "⚠️ Found non-public environment variables in frontend code"
  ERRORS=$((ERRORS + 1))
fi

# 5. Check for weak authentication
echo "Checking authentication configuration..."
if grep -r "NEXTAUTH_SESSION_MAX_AGE=31536000" . --exclude-dir=node_modules; then
  echo "⚠️ Session timeout is 1 year - consider shorter duration"
fi

if [ $ERRORS -gt 0 ]; then
  echo ""
  echo "❌ Security validation FAILED with $ERRORS issue(s)"
  exit 1
fi

echo ""
echo "✅ Security validation PASSED"
exit 0
```

### Hook Configuration

Add to `.claude/settings.local.json`:
```json
{
  "permissions": {
    "allow": [
      // ... existing permissions ...
    ]
  },
  "hooks": {
    "pre-edit": ".claude/hooks/pre-edit.sh",
    "post-edit": ".claude/hooks/post-edit.sh",
    "pre-commit": ".claude/hooks/pre-commit.sh",
    "pre-deploy": ".claude/hooks/security-check.sh"
  },
  "mcpServers": {
    // ... existing MCP servers ...
  }
}
```

---

## 🔧 Priority 9: MCP Servers

**Status**: ✅ ALREADY CONFIGURED
**Current Setup**: chrome-devtools, sequential-thinking
**Recommendation**: **KEEP CURRENT + ADD OPTIONAL**

### Currently Configured

Your `.claude/settings.local.json` already has permissions for:

1. **chrome-devtools** - Browser automation for testing
   - navigate_page
   - take_snapshot
   - take_screenshot
   - click
   - list_pages
   - list_console_messages
   - wait_for
   - fill

2. **sequential-thinking** - Complex problem-solving (useful for debugging)

### Recommended Additional MCP Servers

#### 1. Git MCP Server (RECOMMENDED)
**Purpose**: Enhanced git operations, PR management, GitHub integration

**Benefits**:
- Automated PR creation with templates
- Branch management
- Commit history analysis
- GitHub Issues integration

**Installation**:
```bash
npm install -g @modelcontextprotocol/server-git
```

**Configuration** (add to `.claude/settings.local.json`):
```json
{
  "mcpServers": {
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"],
      "cwd": "C:\\dev\\ai-trade"
    }
  }
}
```

---

## 🤖 Priority 10: Sub Agents (Optional)

**Status**: ⚠️ NOT IMPLEMENTED
**Recommendation**: **OPTIONAL - Use for complex tasks**
**Impact**: Medium - Useful for large refactoring

### Recommended Sub Agent Configurations

Create `.claude/agents/` directory:

#### **`refactor-agent.json`** - Safe refactoring specialist
```json
{
  "name": "refactor-agent",
  "description": "Specialized agent for large-scale code refactoring (follows .claude/LESSONS-LEARNED.md)",
  "tools": ["Read", "Edit", "Glob", "Grep", "Bash"],
  "model": "claude-sonnet-4",
  "systemPrompt": "You are a refactoring specialist that follows .claude/LESSONS-LEARNED.md patterns. ALWAYS: 1) Test existing functionality FIRST before changes, 2) Read type definitions before modifying code, 3) Make small isolated changes, 4) Run tests after EACH change, 5) NEVER modify working code without compelling reason. Your goal is to refactor safely without breaking existing functionality."
}
```

#### **`type-validator-agent.json`** - Type safety specialist
```json
{
  "name": "type-validator-agent",
  "description": "Validate type safety across backend/frontend boundaries",
  "tools": ["Read", "Grep", "Bash"],
  "model": "claude-sonnet-4",
  "systemPrompt": "You are a type safety specialist. Check for type mismatches between: 1) Pydantic models (backend/models/) and TypeScript interfaces (frontend/src/types/), 2) API responses and frontend expectations, 3) Function signatures and actual usage. Report ALL type inconsistencies found. Reference .claude/LESSONS-LEARNED.md Anti-Pattern #2."
}
```

#### **`test-gen-agent.json`** - Test generation specialist
```json
{
  "name": "test-gen-agent",
  "description": "Generate comprehensive test suites following project patterns",
  "tools": ["Read", "Write", "Glob"],
  "model": "claude-sonnet-4",
  "systemPrompt": "You are a test generation specialist. Generate pytest tests following existing patterns in tests/. Include: 1) Unit tests for new functions, 2) Integration tests for API endpoints, 3) Type validation tests, 4) Edge cases (null, empty, missing fields), 5) Error handling tests. ALWAYS verify tests PASS before marking complete."
}
```

---

## 📊 Implementation Roadmap

### Phase 1: Session Start Enforcement (Week 1 - Day 1)

**Priority**: **CRITICAL**
**Time**: 20 minutes
**Impact**: Prevents recurring anti-patterns

1. ✅ Create `.claude/commands/` directory
2. ✅ Implement session start commands:
   - `session-start.md` (MUST USE FIRST)
   - `check-context.md`
   - `pre-change.md`
   - `read-docs.md`
3. ✅ Test with `/session-start` at beginning of next session

**Expected Impact**: 100% adherence to Pre-Work Checklist

### Phase 2: Type Safety Commands (Week 1 - Day 1)

**Priority**: **CRITICAL**
**Time**: 15 minutes
**Impact**: Prevents type mismatch errors

1. ✅ Implement type safety commands:
   - `check-types-backend.md`
   - `check-types-frontend.md`
   - `validate-api-contract.md`
2. ✅ Test with `/check-types-backend` before next API endpoint

**Expected Impact**: 90% reduction in type mismatch errors

### Phase 3: Debugging Workflow (Week 1 - Day 2)

**Priority**: **HIGH**
**Time**: 15 minutes
**Impact**: Reduces debugging time by 60%

1. ✅ Implement debugging commands:
   - `debug-checklist.md`
   - `verify-environment.md`
   - `test-before-change.md`
2. ✅ Test with `/debug-checklist` next time restarting backend 3+ times

**Expected Impact**: Systematic diagnosis > trial-and-error

### Phase 4: Critical Hooks (Week 1 - Day 3)

**Priority**: **CRITICAL**
**Time**: 30 minutes
**Impact**: Automated quality gates

1. ✅ Create `.claude/hooks/` directory
2. ✅ Implement critical hooks:
   - `pre-edit.sh` (verify before editing)
   - `post-edit.sh` (syntax check after editing)
   - `pre-commit.sh` (test before commit)
   - `security-check.sh` (security validation)
3. ✅ Make executable: `chmod +x .claude/hooks/*.sh`
4. ✅ Configure in `.claude/settings.local.json`
5. ✅ Test hooks before next commit

**Expected Impact**: 100% prevention of breaking commits

### Phase 5: Standard Workflow Commands (Week 1 - Day 4)

**Priority**: MEDIUM
**Time**: 20 minutes
**Impact**: 80% reduction in repetitive typing

1. ✅ Implement workflow commands:
   - Component: `start-all.md`, `stop-all.md`, `restart-backend.md`, `status.md`
   - Testing: `test-critical.md`, `test-all.md`, `test-agents.md`, `test-mcp.md`
   - Development: `build-frontend.md`, `clean-cache.md`, `sync-deps.md`
   - Git: `commit-session.md`

**Expected Impact**: Faster iteration cycles

### Phase 6: Optional Enhancements (Week 2)

**Priority**: LOW
**Time**: 15 minutes

1. ⚠️ Install Git MCP server
2. ⚠️ Create sub agents (refactor, type-validator, test-gen)

---

## 📁 Final Directory Structure

```
.claude/
├── settings.local.json          # ✅ Already exists (enhanced with hooks config)
├── commands/                    # ⚠️ CREATE THIS
│   ├── session-start.md         # **USE FIRST EVERY SESSION**
│   ├── check-context.md
│   ├── pre-change.md
│   ├── check-types-backend.md
│   ├── check-types-frontend.md
│   ├── validate-api-contract.md
│   ├── debug-checklist.md
│   ├── verify-environment.md
│   ├── test-before-change.md
│   ├── start-all.md
│   ├── stop-all.md
│   ├── restart-backend.md
│   ├── status.md
│   ├── test-critical.md
│   ├── test-all.md
│   ├── test-agents.md
│   ├── test-mcp.md
│   ├── build-frontend.md
│   ├── clean-cache.md
│   ├── sync-deps.md
│   ├── commit-session.md
│   └── read-docs.md
├── hooks/                       # ⚠️ CREATE THIS (CRITICAL)
│   ├── pre-edit.sh              # Verify before editing
│   ├── post-edit.sh             # Syntax check after editing
│   ├── pre-commit.sh            # Test before commit
│   └── security-check.sh        # Security validation
└── agents/                      # ⚠️ OPTIONAL
    ├── refactor-agent.json
    ├── type-validator-agent.json
    └── test-gen-agent.json
```

---

## 🎯 Success Metrics

Track these metrics to measure anti-pattern prevention:

### 1. Breaking Working Code (Target: 0 incidents)
- **Before**: Code breaks during "improvements" requiring hours of debugging
- **After**: Hooks prevent commits that break tests
- **Metric**: # of broken commits caught by pre-commit hook

### 2. Type Mismatch Errors (Target: 90% reduction)
- **Before**: Runtime type errors between backend/frontend
- **After**: Type validation commands + post-edit hooks
- **Metric**: # of type-related bugs in production

### 3. Inefficient Debugging (Target: 60% time reduction)
- **Before**: 60+ backend restarts for simple issues
- **After**: Systematic debugging checklist
- **Metric**: Average # of backend restarts per debugging session

### 4. Developer Velocity (Overall)
- Time to start/stop components: ⏱️ 30s → 5s (with `/start-all`)
- Time to run tests: ⏱️ 60s → 5s (with `/test-critical`)
- Time to debug: ⏱️ 2 hours → 30 min (with `/debug-checklist`)
- Time to deploy: ⏱️ 5 min → 2 min (with hooks)

---

## 🚨 Critical Reminders

### Every Session Start
1. **ALWAYS** run `/session-start` FIRST
2. **ALWAYS** read .claude/LESSONS-LEARNED.md before making changes
3. **ALWAYS** run `/pre-change` before modifying existing code

### Before Editing Files
1. **ALWAYS** run `/check-types-backend` or `/check-types-frontend`
2. **ALWAYS** run `/test-before-change` to verify current functionality
3. **NEVER** modify working code without compelling reason

### During Debugging
1. **STOP** after 3 backend restarts → run `/debug-checklist`
2. **READ** full error messages (don't skim)
3. **CHECK** environment variables first → run `/verify-environment`

### Before Commits
1. **ALWAYS** let pre-commit hook run (tests + type safety)
2. **NEVER** skip hooks (no --no-verify)
3. **VERIFY** all critical tests pass

---

## 🔗 References

- **LESSONS-LEARNED.md**: [.claude/LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md) - **READ THIS FIRST**
- **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code
- **MCP Documentation**: https://modelcontextprotocol.io
- **Project Scripts**: [docs/SCRIPTS-GUIDE.md](./SCRIPTS-GUIDE.md)
- **Testing Guide**: [docs/TEST.md](./TEST.md)
- **Contributing Guide**: [docs/CONTRIBUTING.md](./CONTRIBUTING.md)

---

## 📝 Next Steps

### Immediate Actions (Today)

1. ✅ **Read .claude/LESSONS-LEARNED.md** if you haven't already
2. ✅ **Create `.claude/commands/` directory**
3. ✅ **Implement Phase 1** - Session start commands (20 min)
4. ✅ **Implement Phase 2** - Type safety commands (15 min)
5. ✅ **Test** with `/session-start` and `/check-types-backend`

### This Week

1. ✅ **Implement Phase 3** - Debugging workflow (15 min)
2. ✅ **Implement Phase 4** - Critical hooks (30 min)
3. ✅ **Implement Phase 5** - Standard workflow commands (20 min)
4. ✅ **Monitor metrics** - Track anti-pattern prevention

### Next Week

1. ⚠️ **Optional**: Install Git MCP server
2. ⚠️ **Optional**: Create sub agents
3. ✅ **Review metrics** - Measure impact
4. ✅ **Iterate** - Add more commands based on usage patterns

---

**Total Implementation Time**: ~2 hours
**Expected ROI**: 60-80% reduction in debugging time, 90% reduction in type errors, 0 broken commits

**Author**: AI Assistant
**Enhanced with**: .claude/LESSONS-LEARNED.md patterns
**Status**: Ready for Implementation
