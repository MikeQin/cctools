# Claude Code Tools Implementation

**Status**: ✅ TOKEN-CONSCIOUS DESIGN
**Date**: November 1, 2025
**Components**: 33 Slash Commands + 5 Hooks (2 active by default) + 4 Sub Agents

**NEW**: Token-optimized - hooks disabled by default, simplified prompts, concise docs (80-90% token savings)

---

## 📁 Directory Structure

```
.claude/
├── README.md (quick reference)
├── LESSONS-LEARNED.md (31 lines - concise anti-patterns)
├── CHEAT-SHEET.md (one-page reference)
├── ANTI-PATTERNS.md (condensed quick ref)
├── settings.local.json (hooks DISABLED by default for token savings)
├── status-line.sh (component health - active)
├── status-line-examples.sh (customization templates)
├── commands/ (33 slash commands - on-demand, zero tokens until used)
│   ├── session-start.md ⭐ SIMPLIFIED (manual use recommended)
│   ├── document.md 📚 NEW - Simplified doc agent (~500 tokens)
│   ├── check-doc-needed.md 📚 NEW - Analyze if docs needed
│   ├── check-context.md
│   ├── pre-change.md
│   ├── check-types-backend.md
│   ├── check-types-frontend.md
│   ├── validate-api-contract.md
│   ├── debug-checklist.md
│   ├── verify-environment.md
│   └── ... (+ 23 more)
├── hooks/ (5 hooks - 2 active by default)
│   ├── post-edit.sh ✅ ACTIVE (bash script, minimal tokens)
│   ├── session-start-auto.sh ❌ DISABLED (enable for auto reminders)
│   ├── pre-edit.sh ❌ DISABLED (enable for pre-edit prompts)
│   ├── pre-commit.sh ✅ GIT NATIVE (runs outside Claude, no tokens)
│   └── security-check.sh ⚠️ MANUAL (run before deploy)
└── agents/ (4 sub agents - on-demand, zero tokens until used)
    ├── doc-agent.json 📚 NEW - Simplified (~500 tokens vs 8000+)
    ├── refactor-agent.json
    ├── type-validator-agent.json
    └── test-gen-agent.json
```

**Token-Conscious Design**:
- ❌ SessionStart hook disabled → saves ~500 tokens/session
- ❌ PreToolUse hooks disabled → saves ~100-200 tokens/action
- ✅ Commands available on-demand (zero tokens until you use them)
- ✅ Post-edit validation active (minimal tokens, catches errors)

---

## 🚀 Quick Start

### 1. Token-Conscious Session Start (Recommended)

**Manually run** when starting work:

```
/session-start
```

This command now runs a quick check:
- Reads .claude/LESSONS-LEARNED.md (now only 31 lines!)
- Shows git status and recent commits
- Checks component health
- Asks "What are we working on today?"

**Why manual?** Saves ~500 tokens per session. Run it when you need the reminder.

**Want automatic?** See [Enabling Automation](#enabling-automation) section below.

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

## 🔧 Enabling Automation

**Want automatic hooks?** Edit `.claude/settings.local.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/hooks/session-start-auto.sh"
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Edit",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Before editing $ARGUMENTS: 1) Read type definitions? 2) Test existing functionality? 3) Is this necessary?"
          }
        ]
      },
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Before bash: 1) If restarting 3+ times, use /debug-checklist. 2) If committing, run pre-commit.sh first."
          }
        ]
      },
      {
        "matcher": "Glob",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Searching multiple files? Consider using refactor-agent for safer multi-file changes."
          }
        ]
      },
      {
        "matcher": "Grep",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Validating types? Consider using type-validator-agent for comprehensive validation."
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit",
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/hooks/post-edit.sh $ARGUMENTS"
          }
        ]
      }
    ]
  }
}
```

**Token Cost**: Automation adds 100-200 tokens per action. Enable if you prefer convenience over token efficiency.

---

## 🔗 References

- **LESSONS-LEARNED.md**: [../.claude/LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md) - **READ THIS FIRST**
- **Recommendations**: [../docs/CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md](../docs/CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md)
- **Claude Code Docs**: https://docs.claude.com/en/docs/claude-code

---

## ✅ Implementation Status

**Token-Conscious Design (November 2025)**
- ✅ **33 Slash Commands** - All on-demand (zero tokens until used)
- ✅ **4 Sub Agents** - Including new doc-agent (~500 tokens vs 8000+)
- ✅ **5 Hooks (2 active)** - Post-edit validation + Git pre-commit (minimal tokens)
- ✅ **3 Optional Hooks** - Disabled by default (can enable for automation)
- ✅ **Concise Docs** - LESSONS-LEARNED.md 84% smaller (31 lines)
- ✅ **Token Savings** - 80-90% reduction in automatic token usage

**Documentation**
- ✅ **Complete + Updated** - Token-conscious design documented across all guides
- ✅ **Audit Summary** - .claude/AUDIT-SUMMARY.md documents changes

---

**Last Updated**: November 1, 2025
**Status**: Production Ready (Token-Optimized)
