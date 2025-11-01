# Claude Code Tools

**Quick reference for Claude Code slash commands, hooks, and sub agents.**

📖 **Full Documentation**: See [docs/CLAUDE-CODE-TOOLS-USAGE.md](../docs/CLAUDE-CODE-TOOLS-USAGE.md)

---

## 🚀 Quick Start

### ALWAYS Start With:
```
/session-start
```

---

## 📋 Most Used Commands

| Command | Purpose |
|---------|---------|
| `/session-start` | ⭐ Quick session check (git status, health check, read concise LESSONS-LEARNED.md) |
| `/status` | Check health of all components |
| `/quick-test` | Fast validation (2 tests, ~30s) |
| `/test-critical` | Run 5 critical smoke tests (~3min) |
| `/pre-change` | Impact analysis before modifying code |
| `/check-types-backend` | Check Pydantic models before API work |
| `/debug-checklist` | Systematic debugging (after 3+ restarts) |
| `/db-status` | Check database connectivity |
| `/deploy-check` | Pre-deployment validation |
| `/logs` | View MCP/Backend logs |
| `/ports` | Check what's using ports 8000/8001/3000 |
| `/env-check` | Validate all environment variables |
| `/model-check` | Verify Ollama models available |
| `/version-bump` | Bump version (major/minor/patch) |
| `/changelog-update` | Add CHANGELOG entry |
| `/restart-backend` | Fast backend restart |
| `/commit-session` | Create commit with co-author |
| `/document` | 📚 Intelligent documentation (auto-detects type & location) |
| `/check-doc-needed` | Analyze if documentation is needed |

---

## 🪝 Validation (Token-Conscious Design)

**Active Automation (Minimal Tokens):**

- ⚡ **Post-Edit Validation** - Runs after file edits (syntax/type checking via bash script)
- 🔒 **Git Native Pre-Commit Hook** - Quality checks before commits (native git hook, no Claude tokens)
  - Installed at `.git/hooks/pre-commit`
  - **BLOCKS commits** if tests fail
  - Works with `git commit` command AND Git GUI tools

**Optional Hooks (Disabled by Default):**

- Session-start reminders (can enable in settings.local.json)
- Pre-tool prompts (Edit/Bash/Grep/Glob) (can enable in settings.local.json)

**Why disabled?** Token savings! Hooks add 100-200 tokens per action. You can enable them in `.claude/settings.local.json` if you prefer automation over token efficiency.

---

## 🤖 Sub Agents (On-Demand)

Available for complex multi-file tasks (zero tokens until you invoke them):
- **refactor-agent** - Safe large-scale refactoring
- **type-validator-agent** - Type safety validation across components
- **test-gen-agent** - Test suite generation
- **doc-agent** - Simplified documentation (concise prompts, ~500 tokens)

**Usage**: Ask Claude Code to use Task tool with appropriate subagent_type, or use `/document` command

---

## 📁 What's Available

**Commands & Automation (Token-Conscious):**
- ✅ **33 Slash Commands** (on-demand, zero tokens until used)
- ✅ **4 Specialized Sub Agents** (on-demand, zero tokens until used)
- ✅ **2 Active Hooks** (post-edit validation, status line - minimal tokens)
- ✅ **3 Optional Hooks** (session-start, pre-tool prompts - disabled by default for token savings)
- ✅ **Git Native Pre-Commit Hook** (native git, no Claude tokens)

**Documentation:**
- ✅ Concise LESSONS-LEARNED.md (31 lines, ~300 tokens)
- ✅ Simplified doc-agent (~500 tokens vs 8000+)
- ✅ Cheat Sheet Quick Reference
- ✅ Usage Examples & Practical Scenarios

---

## 📚 Documentation

- 📖 **[Full Command Reference](../docs/CLAUDE-CODE-TOOLS-USAGE.md)** - Complete guide
- 📋 **[Usage Examples](../docs/CLAUDE-CODE-USAGE-EXAMPLES.md)** - Practical scenarios
- ⚡ **[Cheat Sheet](CHEAT-SHEET.md)** - One-page quick reference
