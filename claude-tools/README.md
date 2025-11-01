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

## 🪝 Validation (Balanced Token-Conscious Design)

**Active Automation (Essential Hooks Enabled):**

- ✅ **Session Start Hook** - Runs when Claude Code launches (reads concise LESSONS-LEARNED.md ~400 tokens)
- ✅ **Pre-Edit Hook** - Reminds before editing files (~100 tokens per edit)
- ✅ **Post-Edit Validation** - Runs after file edits (syntax/type checking via bash script)
- 🔒 **Git Native Pre-Commit Hook** - Quality checks before commits (native git hook, no Claude tokens)
  - Installed at `.git/hooks/pre-commit`
  - **BLOCKS commits** if tests fail
  - Works with `git commit` command AND Git GUI tools

**Disabled Hooks (Lower Priority):**

- Pre-Bash prompts (debug loop detection)
- Pre-Grep/Glob prompts (sub-agent suggestions)

**Why this works**: Massive reduction in LESSONS-LEARNED.md (190 → 31 lines) makes essential hooks affordable.
**Token savings**: 70-75% reduction vs full verbose automation.

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

**Commands & Automation (Balanced Token-Conscious):**
- ✅ **33 Slash Commands** (on-demand, zero tokens until used)
- ✅ **4 Specialized Sub Agents** (on-demand, zero tokens until used)
- ✅ **4 Active Hooks** (session-start ~400 tokens, pre-edit ~100 tokens, post-edit validation, status line)
- ✅ **2 Disabled Hooks** (pre-bash, pre-grep/glob - can enable if needed)
- ✅ **Git Native Pre-Commit Hook** (native git, no Claude tokens)

**Documentation:**
- ✅ Concise LESSONS-LEARNED.md (31 lines, ~400 tokens - down from 2,500!)
- ✅ Simplified doc-agent (~500 tokens vs 8000+)
- ✅ Cheat Sheet Quick Reference
- ✅ Usage Examples & Practical Scenarios

**Token Savings**: 70-75% reduction vs original (essential automation preserved)

---

## 📚 Documentation

- 📖 **[Full Command Reference](../docs/CLAUDE-CODE-TOOLS-USAGE.md)** - Complete guide
- 📋 **[Usage Examples](../docs/CLAUDE-CODE-USAGE-EXAMPLES.md)** - Practical scenarios
- ⚡ **[Cheat Sheet](CHEAT-SHEET.md)** - One-page quick reference
