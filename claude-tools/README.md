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
| `/session-start` | ⭐ Start session (read .claude/LESSONS-LEARNED.md, check git) |
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

## 🪝 Automatic Validation

**100% Automatic - Zero Action Required:**

- ⚡ **Post-Edit Validation** - Runs automatically after every file edit (syntax/type checking)
- 🔒 **Git Native Pre-Commit Hook** ⚡ NEW - Automatically runs quality checks before EVERY commit
  - Installed at `.git/hooks/pre-commit`
  - **BLOCKS commits** if tests fail (MCP, V3 cache, types, linting)
  - Works with `git commit` command AND Git GUI tools
  - **Zero configuration** - already set up!

**Semi-automatic (reminded by hooks):**

```bash
# Before deploying (Claude will remind you via Pre-Bash hook)
./.claude/hooks/security-check.sh
```

**You never need to remember quality checks** - automation enforces them!

---

## 🤖 Sub Agents (Auto-Suggested)

For complex multi-file tasks:
- **refactor-agent** - Safe large-scale refactoring (auto-suggested when using Glob/Edit for multi-file operations)
- **type-validator-agent** - Type safety validation (auto-suggested when using Grep for type searches)
- **test-gen-agent** - Test suite generation
- **doc-agent** - 📚 Intelligent documentation with When/What/Where/How decision trees (use via `/document` command)

**How it works**: Hooks automatically suggest appropriate sub agents when Claude detects complex tasks

**Manual usage**: Ask Claude Code to use Task tool with appropriate subagent_type, or use `/document` for documentation

---

## 📁 What's Available

**Commands & Automation:**
- ✅ **33 Slash Commands** (including /document, /check-doc-needed for intelligent documentation)
- ✅ **4 Specialized Sub Agents** (refactor, test-gen, type-validator, doc-agent)
- ✅ **5 Automation Hooks** (session-start, pre-edit, post-edit, pre-commit, security-check)
- ✅ **Status Line** (always-visible component health monitoring)
- ✅ **Git Native Pre-Commit Hook** (100% automatic quality enforcement)

**Documentation:**
- ✅ Intelligent Documentation System (When/What/Where/How)
- ✅ Usage Examples & Practical Scenarios
- ✅ Cheat Sheet Quick Reference
- ✅ Automation Guide
- ✅ Anti-Patterns & Lessons Learned

---

## 📚 Documentation

- 📖 **[Full Command Reference](../docs/CLAUDE-CODE-TOOLS-USAGE.md)** - Complete guide
- 📋 **[Usage Examples](../docs/CLAUDE-CODE-USAGE-EXAMPLES.md)** - Practical scenarios
- ⚡ **[Cheat Sheet](CHEAT-SHEET.md)** - One-page quick reference
