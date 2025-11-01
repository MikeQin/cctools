# Claude Code Tools - Quick Reference Cheat Sheet

**One-page reference for daily use** | [Full Docs](../docs/CLAUDE-CODE-TOOLS-USAGE.md)

---

## 📊 Status Line (Always Visible)

Your terminal shows: `[branch] MCP:✅ API:✅ UI:✅`
- ✅ = Component running
- ❌ = Component down

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
| `/debug-checklist` | After 3+ backend restarts | Instant |
| `/document` | Document changes (auto-detects type) | Instant |
| `/check-doc-needed` | Check if docs needed | 5s |

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

### Documentation
```
# After major changes
/check-doc-needed → /document

# Or just auto-document
/document  # Auto-detects: architecture vs session notes
```

---

## 🤖 Claude Code Auto Hooks (Balanced Automation)

**Active hooks run automatically to help Claude remember lessons learned:**

| Hook | Status | When | What |
|------|--------|------|------|
| Session Start | ✅ ACTIVE | Claude Code launches | Reads concise LESSONS-LEARNED.md (~400 tokens) |
| Pre-Edit | ✅ ACTIVE | Before editing files | Reminds: check types, test first (~100 tokens) |
| **Post-Edit** | ✅ ACTIVE | **After editing files** | **Auto-runs syntax/type validation** |
| Pre-Bash | ❌ Disabled | Before bash commands | Debug loop prevention (can enable) |
| Pre-Grep/Glob | ❌ Disabled | Before searches | Sub-agent suggestions (can enable) |
| Status Line | ✅ ACTIVE | Always visible | Component health |

**Token savings**: 70-75% vs original (concise LESSONS-LEARNED.md enables affordable automation)

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
- ✅ Tests MCP integration, V3 cache, type safety, hardcoded values, linting
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

**Debugging**: `/debug-checklist` `/verify-environment` `/db-status`

**Testing**: `/quick-test` (fast) or `/test-critical` (thorough)

**Committing**: `/test-critical` `git commit` (pre-commit hook auto-runs)

**Deploying**: `/deploy-check` `security-check.sh`

---

## 🔧 Advanced Commands

| Command | Purpose |
|---------|---------|
| `/logs` | View recent logs (MCP/Backend) |
| `/ports` | Check port usage |
| `/env-check` | Validate environment variables |
| `/model-check` | Verify Ollama models |
| `/version-bump` | Increment version |
| `/changelog-update` | Update CHANGELOG.md |

## 🚨 Emergency

**Nothing works**: `/clean-cache` `/sync-deps` `/stop-all` `/start-all`

**Port conflicts**: `/ports` → Kill orphaned processes

**Env issues**: `/env-check` → Fix missing variables

**Model errors**: `/model-check` → Verify Ollama

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
