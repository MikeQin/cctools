# Claude Code Tools Implementation

**Status**: ✅ FULLY IMPLEMENTED (Phase 1 + Phase 2)
**Date**: October 31, 2025
**Components**: 22 Slash Commands + 4 Quality Gate Hooks + 3 Sub Agents

> **Note**: Examples in this guide are from a real 0DTE Options Trading application. Adapt slash commands and hooks to match your project structure and workflows.


---

## 📁 Directory Structure

```
.claude/
├── README.md (this file)
├── settings.local.json (permissions + MCP configuration)
├── commands/ (22 slash commands)
│   ├── session-start.md ⭐ USE FIRST EVERY SESSION
│   ├── check-context.md
│   ├── pre-change.md
│   ├── read-docs.md
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
│   └── commit-session.md
├── hooks/ (4 quality gate hooks - call manually)
│   ├── pre-edit.sh
│   ├── post-edit.sh
│   ├── pre-commit.sh
│   └── security-check.sh
└── agents/ (3 sub agents - for complex tasks)
    ├── refactor-agent.json
    ├── type-validator-agent.json
    └── test-gen-agent.json
```

---

## 🚀 Quick Start

### 1. Session Start Protocol (CRITICAL)

**ALWAYS** start every Claude Code session with:

```
/session-start
```

This command enforces the Pre-Work Checklist from .claude/LESSONS-LEARNED.md:
- Reads .claude/LESSONS-LEARNED.md (anti-patterns)
- Reads CLAUDE.md (current architecture)
- Shows recent git changes
- Asks "What are we working on today?"

---

## 📋 Available Slash Commands

### Session Start Commands (CRITICAL - Use First)

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/session-start` | ⭐ Session start protocol | **FIRST command every session** |
| `/check-context` | Check current codebase state | Before making changes |
| `/pre-change` | Impact analysis before modifying code | Before editing existing files |
| `/read-docs` | Read relevant documentation | When starting work on specific area |

### Type Safety Commands (Prevent Type Mismatches)

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/check-types-backend` | Check Pydantic models | Before implementing API endpoints |
| `/check-types-frontend` | Check TypeScript interfaces | Before implementing components |
| `/validate-api-contract` | Test API response matches types | After implementing endpoint |

### Debugging Commands (Systematic Diagnosis)

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/debug-checklist` | Systematic debugging checklist | After 3+ backend restarts |
| `/verify-environment` | Check env vars and dependencies | When debugging connection issues |
| `/test-before-change` | Test existing functionality first | Before modifying any code |

### Component Management Commands

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/start-all` | Start all 3 components | At session start |
| `/stop-all` | Stop all 3 components | At session end |
| `/restart-backend` | Fast backend restart | During backend development |
| `/status` | Check health of all components | Anytime |

### Testing Commands

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/test-critical` | Run 5 critical smoke tests | Before commit/deploy |
| `/test-all` | Run complete test suite (66 tests) | Weekly |
| `/test-agents` | Run V3 agent tests | After agent changes |
| `/test-mcp` | Run MCP integration tests | After MCP changes |

### Development Commands

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/build-frontend` | Build frontend with linting | Before deployment |
| `/clean-cache` | Clean Python bytecode cache | Before backend restart |
| `/sync-deps` | Sync UV workspace dependencies | After adding packages |

### Git & Documentation Commands

| Command | Description | When to Use |
|---------|-------------|-------------|
| `/commit-session` | Create session commit | After completing work |
| `/read-docs` | Read relevant documentation | Before starting task |

---

## 🪝 Quality Gate Hooks

**Note**: Hooks are bash scripts that can be called manually. They enforce quality gates and prevent anti-patterns.

### How to Use Hooks

**Manually call hooks before specific actions**:

```bash
# Before editing critical files
./.claude/hooks/pre-edit.sh backend/agents/chat_agent_v3.py

# After editing files (syntax check)
./.claude/hooks/post-edit.sh backend/agents/chat_agent_v3.py

# Before committing (run critical tests)
./.claude/hooks/pre-commit.sh

# Before deploying (security validation)
./.claude/hooks/security-check.sh
```

### Hook Details

#### `pre-edit.sh` - Pre-Edit Validation
- Verifies file exists
- Shows recent git history for the file
- Warns if editing critical files (backend agents, frontend components)
- Reminds to read .claude/LESSONS-LEARNED.md

**Usage**:
```bash
./.claude/hooks/pre-edit.sh <file_path>
```

#### `post-edit.sh` - Post-Edit Validation
- Python syntax check (blocks on errors)
- TypeScript type checking
- Anti-pattern detection (hardcoded localhost, type casts)

**Usage**:
```bash
./.claude/hooks/post-edit.sh <file_path>
```

#### `pre-commit.sh` - Pre-Commit Quality Gate
- Runs 5 critical smoke tests
- Type safety validation (Python + TypeScript)
- Hardcoded value detection
- Frontend linting
- Auto cache cleanup

**Usage**:
```bash
./.claude/hooks/pre-commit.sh
```

**Exit codes**:
- `0`: All checks passed - safe to commit
- `1`: Tests failed - DO NOT commit

#### `security-check.sh` - Security Validation
- Exposed secrets detection
- SQL injection pattern checking
- XSS vulnerability detection
- Environment variable exposure check

**Usage**:
```bash
./.claude/hooks/security-check.sh
```

---

## 🎯 Recommended Workflow

### Daily Development Session

1. **Start Session**:
   ```
   /session-start
   ```

2. **Check Context**:
   ```
   /check-context
   /status
   ```

3. **Before Making Changes**:
   ```
   /pre-change
   /check-types-backend  (if working on API)
   /test-before-change
   ```

4. **During Development**:
   ```
   /restart-backend  (as needed)
   /clean-cache      (if import issues)
   ```

5. **Before Commit**:
   ```
   /test-critical
   ./.claude/hooks/pre-commit.sh
   /commit-session
   ```

6. **Before Deploy**:
   ```
   /build-frontend
   ./.claude/hooks/security-check.sh
   ```

---

## 🚨 Critical Reminders

### Every Session Start
- ✅ **ALWAYS** run `/session-start` FIRST
- ✅ **ALWAYS** read .claude/LESSONS-LEARNED.md before changes
- ✅ **ALWAYS** run `/pre-change` before modifying existing code

### Before Editing Files
- ✅ **ALWAYS** run `/check-types-backend` or `/check-types-frontend`
- ✅ **ALWAYS** run `/test-before-change` to verify current functionality
- ✅ **NEVER** modify working code without compelling reason

### During Debugging
- ✅ **STOP** after 3 backend restarts → run `/debug-checklist`
- ✅ **READ** full error messages (don't skim)
- ✅ **CHECK** environment variables first → run `/verify-environment`

### Before Commits
- ✅ **ALWAYS** run `./.claude/hooks/pre-commit.sh` (critical tests + type safety)
- ✅ **NEVER** skip hooks (no --no-verify)
- ✅ **VERIFY** all critical tests pass

---

## 📊 Success Metrics

Track these to measure anti-pattern prevention:

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

---

## 🤖 Sub Agents (Phase 2 - Optional)

**Sub agents are specialized AI agents for complex, multi-file tasks.** They follow .claude/LESSONS-LEARNED.md patterns.

### Available Sub Agents

#### 1. **Refactor Agent** (`refactor-agent`)
**Purpose**: Safe large-scale code refactoring

**Use When**:
- Refactoring 10+ files simultaneously
- Moving code between modules
- Renaming across codebase
- Restructuring architecture

**How to Use**:
```
Ask Claude Code to use the Task tool with subagent_type="refactor-agent"
```

**Key Rules** (built into agent):
- ✅ Test existing functionality FIRST before changes
- ✅ Read type definitions before modifying code
- ✅ Make small isolated changes
- ✅ Run tests after EACH change
- ✅ NEVER modify working code without compelling reason

---

#### 2. **Type Validator Agent** (`type-validator-agent`)
**Purpose**: Validate type safety across backend/frontend boundaries

**Use When**:
- After implementing new API endpoints
- Before major frontend/backend integration
- Debugging type mismatch errors
- Code review for type consistency

**How to Use**:
```
Ask Claude Code to use the Task tool with subagent_type="type-validator-agent"
```

**What It Checks**:
- ✅ Pydantic models (backend/models/) vs TypeScript interfaces (frontend/src/types/)
- ✅ API responses vs frontend expectations
- ✅ Function signatures vs actual usage
- ✅ References .claude/LESSONS-LEARNED.md Anti-Pattern #2

---

#### 3. **Test Generation Agent** (`test-gen-agent`)
**Purpose**: Generate comprehensive test suites following project patterns

**Use When**:
- Adding tests for new features
- Improving test coverage
- Creating integration tests
- Generating edge case tests

**How to Use**:
```
Ask Claude Code to use the Task tool with subagent_type="test-gen-agent"
```

**What It Creates**:
- ✅ Unit tests for new functions
- ✅ Integration tests for API endpoints
- ✅ Type validation tests
- ✅ Edge cases (null, empty, missing fields)
- ✅ Error handling tests
- ✅ ALWAYS verifies tests PASS before marking complete

---

### When to Use Sub Agents vs Commands

**Use Sub Agents When**:
- Task requires 10+ file operations
- Complex refactoring across modules
- Generating multiple test files
- Systematic validation across codebase

**Use Commands When**:
- Simple operations (start/stop components)
- Quick checks (status, types)
- Standard workflow (test, commit)
- Single-file operations

---

## 🔗 References

- **LESSONS-LEARNED.md**: [../.claude/LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md) - **READ THIS FIRST**
- **Recommendations**: [../docs/CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md](../docs/CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md)
- **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code

---

## ✅ Implementation Status

**Phase 1: Core Tools**
- ✅ **22 Slash Commands** - Fully implemented
- ✅ **4 Quality Gate Hooks** - Fully implemented (call manually)
- ✅ **Permissions Updated** - All necessary bash permissions added

**Phase 2: Optional Enhancements**
- ✅ **3 Sub Agents** - Fully implemented (refactor, type-validator, test-gen)
- ⚠️ **Git MCP Server** - Not installed (optional, requires `npm install -g @modelcontextprotocol/server-git`)

**Documentation**
- ✅ **Complete** - This README + CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md

---

**Last Updated**: October 31, 2025
**Status**: Production Ready
