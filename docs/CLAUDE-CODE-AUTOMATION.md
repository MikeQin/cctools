# Claude Code Automation Guide

**Token-conscious design: Automation is OPTIONAL (disabled by default)**

**Last Updated**: November 1, 2025

---

## ⚡ Balanced Token-Conscious Design (Current)

**Key Insight**: Concise LESSONS-LEARNED.md (31 lines vs 190) enables affordable automation!

**Active Automation (Essential Hooks Enabled):**
- ✅ Session-start hook (~400 tokens - reads concise LESSONS-LEARNED.md)
- ✅ Pre-edit prompts (~100 tokens/edit - reminds Claude to check types, test first)
- ✅ Post-edit validation (bash script, catches errors)
- ✅ Status line (no tokens)
- ✅ Git pre-commit hook (native git, no Claude tokens)

**Disabled (Lower Priority):**
- ❌ Pre-bash prompts (debug loop detection)
- ❌ Pre-grep/glob prompts (sub-agent suggestions)

**Token Savings**: 70-75% reduction vs original verbose automation

---

## 🤖 How Automation Works (When Enabled)

The tools can be configured with **intelligent hooks** that automatically trigger at the right moments. You focus on coding, the tools handle best practices.

**Note**: This guide describes hooks when ENABLED. By default, they're disabled for token savings.

---

## 📊 Always-On: Status Line

**What**: Real-time component health in your terminal
**When**: Always visible
**Shows**: `[main] MCP:✅ API:✅ UI:✅`

**You get**:
- ✅ Green checkmark = Component running
- ❌ Red X = Component down
- Current git branch
- Instant health visibility

**No action needed** - it updates automatically!

---

## 🚀 Auto-Trigger #1: Session Start

**What**: Session start protocol reminder
**When**: Every time Claude Code launches
**Triggers**: `.claude/scripts/session-start-auto.sh`

**What you see**:
```
🚀 Claude Code Session Starting...

📋 Session Start Protocol:
  1. ✅ Read .claude/LESSONS-LEARNED.md
  2. ✅ Check recent git changes
  3. ✅ Verify component status

💡 Tip: Use /session-start for full protocol

✅ Components appear to be running
```

**You get**:
- Reminder to follow best practices
- Quick component health check
- No need to remember `/session-start`

---

## ✏️ Auto-Trigger #2: Before Editing Files

**What**: Pre-edit reminders
**When**: Before using Edit or Write tools
**Triggers**: Prompt with checklist

**What you see** (Claude will consider):
```
Before editing [file], remember:
1) Have you read the type definitions?
2) Have you tested existing functionality?
3) Is this change necessary?

Proceeding with edit...
```

**You get**:
- Automatic .claude/LESSONS-LEARNED.md enforcement
- Prevents breaking working code
- No need to run `/pre-change` manually

**Covers**:
- ✅ Type definition checks
- ✅ Test-before-change reminder
- ✅ Necessity validation

---

## 🔧 Auto-Trigger #3: Before Running Commands

**What**: Debug loop prevention
**When**: Before bash commands (especially restarts)
**Triggers**: Smart prompt

**What you see** (Claude will consider):
```
You're about to run a bash command.
If restarting backend for the 3rd time,
consider using /debug-checklist instead.

Proceeding...
```

**You get**:
- Automatic debugging workflow enforcement
- Prevents trial-and-error loops
- No need to remember `/debug-checklist`

**Catches**:
- ✅ Multiple backend restarts
- ✅ Inefficient debugging patterns
- ✅ Suggests systematic approach

---

## 📝 Auto-Trigger #4: After File Edits ⚡ AUTOMATIC

**What**: Syntax and type validation
**When**: Automatically after editing ANY file (PostToolUse:Edit hook)
**How**: Runs automatically - no action needed!

**What it does**:
```
✅ POST-EDIT CHECK: backend/agent-profiles/chat_agent_v3.py

Checking Python syntax...
✅ Python syntax OK

Running mypy type check...
✅ No type errors

Checking for anti-patterns...
⚠️ Found 'any[]' - Consider using specific type

✅ Post-edit checks complete
```

**You get**:
- ✅ **Automatic** Python syntax validation
- ✅ **Automatic** TypeScript type checking
- ✅ **Automatic** Anti-pattern detection
- ✅ **Immediate feedback** after every edit

**Performance**: Runs in background after each edit (~1-3 seconds)

---

## 🔒 Auto-Trigger #5: Before Commits ⚡ 100% AUTOMATIC (Git Native Hook)

**What**: Quality gate enforcement
**When**: Before EVERY git commit (automatic)
**How**: Git native hook at `.git/hooks/pre-commit` automatically runs `./.claude/scripts/pre-commit.sh`

**What it does**:
```
🔍 PRE-COMMIT VALIDATION

STEP 1: Critical Smoke Tests
✅ MCP Integration: PASSED
✅ V3 Analyst Cache: PASSED

STEP 2: Type Safety Validation
✅ No problematic type casts

STEP 3: Hardcoded Values Check
✅ No hardcoded localhost URLs
✅ No test API keys

STEP 4: Frontend Linting
✅ 0 warnings

✅ PRE-COMMIT CHECKS PASSED
```

**You get**:
- ✅ **100% automatic** - runs before EVERY commit
- ✅ 5 critical tests (MCP, V3 cache, types, hardcoded values, linting)
- ✅ **BLOCKS commits** if any test fails
- ✅ Works with `git commit` command AND Git GUI tools
- ✅ **Zero configuration** - already installed at `.git/hooks/pre-commit`

**Performance**: Runs in 30-60 seconds (only when committing)

**You never need to remember** - git enforces quality automatically!

---

## 🎯 When Each Tool Auto-Triggers

### Status Line
- **Always on** - No action needed

### Session Start Hook
- **On Claude Code startup** - Automatic reminder

### Pre-Edit Prompts
- **Before Edit/Write** - Automatic .claude/LESSONS-LEARNED.md enforcement + sub agent suggestions
- **Before Bash** - Automatic debugging loop prevention + commit/deploy reminders
- **Before Glob** - Suggests refactor-agent for multi-file operations
- **Before Grep** - Suggests type-validator-agent for type consistency checks

### Post-Edit Validation ⚡ AUTOMATIC
- **After file edits** - Automatically runs `./.claude/scripts/post-edit.sh` (syntax/type validation)

### Pre-Commit Validation ⚡ 100% AUTOMATIC (Git Native)
- **Before commits** - Git native hook automatically runs `./.claude/scripts/pre-commit.sh` and BLOCKS commits if tests fail

---

## 💡 Smart Workflow Examples

### Example 1: Starting Your Day

**You do**:
```
Open Claude Code
```

**Automation does**:
1. ✅ Status Line shows component health
2. ✅ Session Start Hook reminds you of protocol
3. ✅ Quick health check runs

**You see**:
```
[main] MCP:✅ API:✅ UI:✅

🚀 Claude Code Session Starting...
✅ Components appear to be running
```

**No commands to remember!**

---

### Example 2: Editing a Backend File

**You say**:
```
"Please update the chat_agent_v3.py to fix the bug"
```

**Automation does**:
1. ✅ Pre-Edit Hook reminds Claude to check types
2. ✅ Claude reads type definitions automatically
3. ✅ Claude edits the file
4. ✅ You ask: "Run post-edit validation"
5. ✅ Syntax check runs automatically

**You see**:
```
✅ Python syntax OK
✅ No type errors
✅ Post-edit checks complete
```

**Type safety enforced automatically!**

---

### Example 3: Debugging Backend Issues

**You say**:
```
"The backend won't start, let me restart it again"
```

**Automation does**:
1. ✅ Pre-Bash Hook detects restart pattern
2. ✅ Suggests `/debug-checklist` instead
3. ✅ Prevents inefficient trial-and-error

**Claude considers**:
```
"You're restarting the backend again.
Consider using /debug-checklist for
systematic diagnosis instead."
```

**Inefficient debugging prevented!**

---

### Example 4: Committing Code (Git Native Hook)

**You do**:
```bash
git add .
git commit -m "fix: Fixed chat agent bug"
```

**Git native hook automatically runs**:
```
🔍 Git Pre-Commit Hook: Running quality checks...

🔍 PRE-COMMIT VALIDATION

STEP 1: Critical Smoke Tests
✅ MCP Integration: PASSED
✅ V3 Analyst Cache: PASSED

STEP 2: Type Safety Validation
✅ No problematic type casts

STEP 3: Hardcoded Values Check
✅ No hardcoded localhost URLs
✅ No test API keys

STEP 4: Frontend Linting
✅ 0 warnings

✅ PRE-COMMIT CHECKS PASSED

✅ All pre-commit checks passed!
Proceeding with commit...

[main 1a2b3c4] fix: Fixed chat agent bug
 2 files changed, 50 insertions(+), 10 deletions(-)
```

**What happened**:
- ✅ Git **automatically** ran quality checks (you didn't ask!)
- ✅ Commit only proceeded after ALL tests passed
- ✅ If any test failed, commit would be BLOCKED

**You never need to remember** - git enforces quality!

---

### Example 5: Large-Scale Refactoring

**You say**:
```
"I need to rename the function calculateGEX to computeGammaExposure across all files"
```

**Automation does**:
1. ✅ Pre-Glob Hook detects multi-file search
2. ✅ Suggests using refactor-agent for safer systematic changes
3. ✅ I (Claude) consider using Task tool with subagent_type='refactor-agent'

**Claude considers**:
```
"You're searching for multiple files. Consider using
refactor-agent sub agent for safer large-scale refactoring.

This is a multi-file rename - I should use the refactor-agent
to ensure all references are updated safely."
```

**What happens**:
- Instead of manual Edit calls, I invoke refactor-agent
- Sub agent systematically finds all occurrences
- Tests existing functionality FIRST
- Makes changes one at a time with validation
- Ensures no references are missed

**Safe refactoring enforced!**

---

## 🎓 What You Don't Need to Remember

### ❌ Don't Need to Remember:
- Running `/session-start` every session
- Checking types before editing
- Running `/debug-checklist` after multiple restarts
- Manual syntax checking after edits
- Running tests before commits

### ✅ Automation Handles:
- Session start protocol
- Pre-edit type checking reminders
- Debug loop detection
- Sub agent suggestions for complex tasks
- Syntax validation (when asked)
- Pre-commit quality gates (when asked)

---

## 🔧 Enabling Automation

**Want automatic reminders?** Edit `.claude/settings.local.json`:

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/scripts/session-start-auto.sh"
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
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Edit",
        "hooks": [
          {
            "type": "command",
            "command": "./.claude/scripts/post-edit.sh $ARGUMENTS"
          }
        ]
      }
    ]
  }
}
```

**Trade-off**: Automation costs 100-200 tokens per action. Evaluate based on your usage patterns.

---

## 🚀 Quick Reference (Balanced Approach)

| Automation | Status | Trigger | Action | Token Cost |
|------------|--------|---------|--------|------------|
| **Status Line** | ✅ ACTIVE | Always | Shows component health | 0 |
| **Session Start** | ✅ ACTIVE | Claude Code launches | Reads concise LESSONS-LEARNED.md | ~400 |
| **Pre-Edit** | ✅ ACTIVE | Before Edit/Write | Reminds: check types, test first | ~100 |
| **Post-Edit** ⚡ | ✅ ACTIVE | **After Edit (AUTOMATIC)** | **Syntax/type validation** | Minimal |
| **Pre-Bash** | ❌ Disabled | Before Bash commands | Debug loop + deploy reminders | 0 |
| **Pre-Glob** | ❌ Disabled | Before file search | Refactor-agent suggestion | 0 |
| **Pre-Grep** | ❌ Disabled | Before code search | Type-validator-agent suggestion | 0 |
| **Git Pre-Commit** 🔒 | ✅ ACTIVE | **Before git commit (AUTOMATIC)** | **Quality gate - BLOCKS bad commits** | 0 |
| **Security Check** | ⚠️ Manual | Before deploy (manual) | Security validation | 0 |

---

## 💡 Pro Tips

**Token-Conscious Workflow (Default)**:
1. **Run /session-start manually** when starting work
2. **Read .claude/LESSONS-LEARNED.md** (only 31 lines now!)
3. **Use slash commands on-demand** (/pre-change, /check-types-*, /debug-checklist)
4. **Watch status line** - Instant component health visibility
5. **Trust post-edit validation** - Catches errors automatically
6. **Pre-commit hook prevents mistakes** - Always runs before committing

**Automation-Enabled Workflow (Optional)**:
1. **Trust the automation** - It enforces .claude/LESSONS-LEARNED.md patterns
2. **Let hooks remind you** - No need to remember manually
3. **Accept token cost** - 100-200 tokens per action for convenience

---

## 🎯 Token Economics

**Default Configuration (Minimal Automation)**:
- ✅ Post-edit validation catches errors (minimal tokens)
- ✅ Pre-commit hook prevents broken commits (no Claude tokens)
- ✅ Status line shows health (no tokens)
- ✅ Manual /session-start when needed
- ✅ Manual slash commands for checks

**Token Savings**: 80-90% reduction vs full automation
**Trade-off**: Less automatic reminders, more user discipline required

**Enabled Automation (Optional)**:
- ✅ Automatic reminders enforce best practices
- ✅ Type checking prompted before edits
- ✅ Inefficient patterns caught early
- ❌ Costs 100-200 tokens per action

**Token Cost**: Higher, but convenience may justify it for some users
**Trade-off**: Automation vs token efficiency

---

**See Also**:
- [CLAUDE-CODE-TOOLS-USAGE.md](./CLAUDE-CODE-TOOLS-USAGE.md) - Complete command reference
- [CLAUDE-CODE-USAGE-EXAMPLES.md](./CLAUDE-CODE-USAGE-EXAMPLES.md) - Practical scenarios
- [LESSONS-LEARNED.md](../.claude/LESSONS-LEARNED.md) - Anti-patterns being prevented
