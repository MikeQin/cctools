# Claude Code Tools - Quick Reference Cheat Sheet

**One-page reference for daily use** | [Full Docs](../docs/CLAUDE-CODE-TOOLS-USAGE.md)

> **Note**: Commands shown are from the original project. Customize slash commands in `.claude/commands/` to match your project needs.


---

## 📊 Status Line (Always Visible)

Your terminal shows: `[branch] ✅ clean` (customize in `.claude/status-line.sh`)
- See `status-line-examples.sh` for 6 ready-to-use templates
- Adapt to show your components, services, or metrics

---

## ⭐ START EVERY SESSION

```
/session-start
```

---

## 🚀 Most Used Commands

| Command | Use When | Speed |
|---------|----------|-------|
| `/status` | Check component health | 5s |
| `/quick-test` | Fast validation | 30s |
| `/test-critical` | Before commit | 3min |
| `/restart-backend` | After code changes | 15s |
| `/pre-change` | Before editing existing code | Instant |
| `/debug-checklist` | After 3+ service restarts | Instant |

---

## 📋 Workflow Shortcuts

### Daily Start
```
/session-start → /status
```

### API Work
```
/check-types-backend → /validate-api-contract
```

### Frontend Work
```
/check-types-frontend → /build-frontend
```

### Before Commit
```
/test-critical → git commit
# Note: Git native hook auto-runs pre-commit.sh
```

### Debugging
```
/debug-checklist → /verify-environment
```

---

## 🤖 Claude Code Auto Hooks (Trigger Automatically)

**You don't invoke these - they run automatically within Claude Code!**

| Hook | When | What |
|------|------|------|
| Session Start | Claude Code launches | Protocol reminder |
| Pre-Edit | Before editing files | Type check + refactor-agent suggestion |
| **Post-Edit** ⚡ | **After editing files** | **Auto-runs syntax/type validation** |
| Pre-Bash | Before bash commands | Debug loop prevention + commit/deploy reminders |
| Pre-Glob | Before file search | Refactor-agent suggestion |
| Pre-Grep | Before code search | Type-validator-agent suggestion |
| Status Line | Always visible | Project status |

---

## 🔒 Git Native Hook (100% Automatic) ⚡ NEW

**Git automatically enforces quality before commits:**

```bash
# .git/hooks/pre-commit (native git hook)
# Runs AUTOMATICALLY before EVERY git commit
# BLOCKS commit if checks fail
```

**What it does**:
- ✅ Runs `./.claude/hooks/pre-commit.sh` automatically
- ✅ Runs your project-specific tests (customize in pre-commit.sh)
- ✅ **BLOCKS commit** if any test fails
- ✅ Works with `git commit` command AND Git GUI tools
- ✅ **Zero configuration needed** - already installed!

**You never need to remember** - git enforces quality automatically!

---

## 🪝 Semi-Auto Hook (Reminded by Claude)

**Claude will remind you to run this before deployment:**

```bash
# Before deployment (reminder in Pre-Bash hook)
./.claude/hooks/security-check.sh
```

---

## 🎯 By Scenario

**Starting work**: `/session-start` `/status` `/start-all`

**Making changes**: `/pre-change` `/check-types-*` `/test-before-change`

**Debugging**: `/debug-checklist` `/verify-environment`

**Testing**: `/quick-test` (fast) or `/test-critical` (thorough)

**Committing**: `/test-critical` `git commit` (pre-commit hook auto-runs)

**Deploying**: `/deploy-check` `security-check.sh`

---

## 🔧 Advanced Commands

| Command | Purpose |
|---------|---------|
| `/logs` | View recent logs |
| `/ports` | Check port usage |
| `/env-check` | Validate environment variables |
| `/model-check` | Verify AI models (if using) |
| `/version-bump` | Increment version |
| `/changelog-update` | Update CHANGELOG.md |

## 🚨 Emergency

**Nothing works**: `/clean-cache` `/sync-deps` `/stop-all` `/start-all`

**Port conflicts**: `/ports` → Kill orphaned processes

**Env issues**: `/env-check` → Fix missing variables

**Model errors**: `/model-check` → Verify model availability

**Type errors**: `/check-types-*` → Use `type-validator-agent`

**Tests failing**: `/check-context` `git log -5` `/verify-environment`

---

## 💡 Pro Tips

✅ **Always** `/session-start` first
✅ Use `/quick-test` for fast iteration
✅ **Git native hook** auto-blocks bad commits (no need to remember!)
✅ `/pre-change` prevents breaking code
✅ Auto hooks suggest sub agents for complex tasks
✅ Post-edit validation runs after every file edit

---

**Full Documentation**: [CLAUDE-CODE-TOOLS-USAGE.md](../docs/CLAUDE-CODE-TOOLS-USAGE.md)
**Examples**: [CLAUDE-CODE-USAGE-EXAMPLES.md](../docs/CLAUDE-CODE-USAGE-EXAMPLES.md)
