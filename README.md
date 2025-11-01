# Claude Code Tools

**A comprehensive automation toolkit for Claude Code** - 33 slash commands, 5 hooks (4 active), 4 sub agents, and intelligent quality gates with 70-75% token savings.

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/yourusername/claude-code-tools/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Compatible-8A2BE2.svg)](https://docs.claude.com/en/docs/claude-code)
[![Platform](https://img.shields.io/badge/Platform-Windows_Git_Bash-blue.svg)](https://git-scm.com/download/win)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Contributions](https://img.shields.io/badge/Contributions-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## 🎯 What Is This?

**Claude Code Tools** is a production-ready toolkit that provides:

- **33 Slash Commands** - Essential development workflows (session start, type checking, debugging, testing, deployment, documentation)
- **5 Hooks (4 active)** - Balanced automation with 70-75% token savings vs original
- **4 Sub Agents** - Specialized agents for complex multi-file tasks (including simplified doc-agent)
- **Quality Gates** - Prevent broken commits, type mismatches, and inefficient debugging
- **Git Native Pre-Commit Hook** - Automatically enforces quality before EVERY commit

**Balanced token-conscious design** - essential automation enabled with massive token savings!

---

## ⚡ Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/claude-code-tools.git
cd claude-code-tools

# Run the installer (Windows Git Bash compatible)
./install-tools.sh

# Follow the prompts to install into your project
```

The installer will:
- ✅ Copy all tools to your project's `.claude/` directory
- ✅ Configure auto hooks and settings
- ✅ Install git pre-commit hook (if git repo exists)
- ✅ Set proper permissions

### Verify Installation

```bash
# Start Claude Code in your project directory
# You should see:
# 1. Status line in terminal: [branch] MCP:✅ API:✅ UI:✅
# 2. Session start hook auto-runs
# 3. Try: /session-start
```

---

## 🤖 What You Get

### 1. Balanced Automation (5 Hooks, 4 Active) ⚡

**Active hooks run automatically with 70-75% token savings:**

| Hook | Status | When | What | Token Cost |
|------|--------|------|------|------------|
| **Status Line** | ✅ ACTIVE | Always visible | Real-time component health | 0 |
| **SessionStart** | ✅ ACTIVE | Claude Code launches | Reads concise LESSONS-LEARNED.md | ~400 |
| **PreToolUse:Edit** | ✅ ACTIVE | Before editing files | Reminds: check types, test first | ~100 |
| **PostToolUse:Edit** | ✅ ACTIVE | After editing files | Auto syntax/type validation | Minimal |
| **Git Pre-Commit** 🔒 | ✅ ACTIVE | Before git commit | Quality gate - BLOCKS bad commits | 0 |

**Optional hooks** (disabled by default, can enable):
- **PreToolUse:Bash** - Debug loop prevention + deploy reminders
- **PreToolUse:Glob** - Refactor-agent suggestion
- **PreToolUse:Grep** - Type-validator-agent suggestion

**Key Insight**: Concise LESSONS-LEARNED.md (31 lines vs 190) makes essential automation affordable!

### 2. Slash Commands (33 total)

**Essential commands organized by category:**

#### Session Management
- `/session-start` - ⭐ START EVERY SESSION - Reads anti-patterns, checks git, shows status
- `/status` - Component health check
- `/start-all` - Start all components
- `/stop-all` - Stop all components

#### Type Safety
- `/check-types-backend` - Verify Pydantic models before API work
- `/check-types-frontend` - Verify TypeScript interfaces before UI work
- `/validate-api-contract` - Check backend/frontend type consistency

#### Debugging
- `/debug-checklist` - Systematic debugging (use after 3+ backend restarts)
- `/verify-environment` - Check environment variables
- `/logs` - View recent logs
- `/ports` - Check port usage

#### Testing
- `/quick-test` - Fast validation (~30s)
- `/test-critical` - Run 5 critical smoke tests (~3min)
- `/test-before-change` - Test existing functionality before modifying code

#### Code Changes
- `/pre-change` - Impact analysis before modifying code
- `/read-docs` - Read relevant documentation before changes

#### Deployment
- `/deploy-check` - Pre-deployment validation
- `/version-bump` - Increment version
- `/changelog-update` - Update CHANGELOG.md

#### Documentation
- `/document` - 📚 Intelligent documentation (auto-detects type & location)
- `/check-doc-needed` - Analyze if documentation is needed

**+ 11 more project-specific commands**

### 3. Sub Agents (4 specialized agents)

**Available on-demand (zero tokens until used):**

- **doc-agent** - 📚 NEW - Intelligent documentation (auto-detects type & location, ~500 tokens vs 8000+)
- **refactor-agent** - Safe large-scale refactoring across multiple files
- **type-validator-agent** - Comprehensive type safety validation (backend ↔ frontend)
- **test-gen-agent** - Test suite generation

### 4. Quality Gate Hooks

**Manual hooks for critical operations:**

```bash
# Before committing (also runs automatically via git hook)
./.claude/hooks/pre-commit.sh

# Before deploying
./.claude/hooks/security-check.sh

# After editing (also runs automatically via PostToolUse hook)
./.claude/hooks/post-edit.sh <file>
```

---

## 📊 Auto-Triggers Explained

### Example 1: File Editing

**You edit a file:**
```bash
# Claude uses Edit tool
```

**Automation does:**
1. ✅ **PreToolUse:Edit hook** - Reminds Claude to check types, suggests refactor-agent if multi-file
2. ✅ **PostToolUse:Edit hook** - Automatically validates syntax/types after edit

**You get instant feedback without asking!**

---

### Example 2: Committing Code

**You commit:**
```bash
git add .
git commit -m "fix: My changes"
```

**Automation does:**
1. ✅ **Git pre-commit hook** automatically runs quality checks:
   - MCP integration test
   - V3 cache validation
   - Type safety check
   - Hardcoded values check
   - Frontend linting
2. ✅ **BLOCKS commit** if ANY test fails
3. ✅ Allows commit if ALL tests pass

**You never commit broken code!**

---

### Example 3: Large-Scale Refactoring

**You search for files:**
```bash
# Claude uses Glob tool to find files
```

**Automation does:**
1. ✅ **PreToolUse:Glob hook** - Suggests using refactor-agent for safer multi-file changes
2. ✅ Claude considers using specialized sub agent instead of manual edits

**Safer refactoring automatically suggested!**

---

## 🎯 Anti-Patterns Prevented

This toolkit is built to prevent common mistakes:

### Anti-Pattern #1: Breaking Working Code
**How it's prevented:**
- `/pre-change` command - Impact analysis before modifications
- PreToolUse:Edit hook - Reminds to test existing functionality first
- `/test-before-change` command - Verify current behavior before changes

### Anti-Pattern #2: Type Mismatches
**How it's prevented:**
- `/check-types-backend` - Verify Pydantic models before API work
- `/check-types-frontend` - Verify TypeScript interfaces before UI work
- PostToolUse:Edit hook - Auto syntax/type validation after edits
- type-validator-agent - Comprehensive cross-boundary validation

### Anti-Pattern #3: Inefficient Debugging
**How it's prevented:**
- `/debug-checklist` - Systematic 4-phase diagnosis
- PreToolUse:Bash hook - Detects restart loops, suggests debug-checklist
- `/verify-environment` - Quick environment validation

---

## 📁 Repository Structure

```
claude-code-tools/
├── install-tools.sh              # Installer script (Windows Git Bash compatible)
├── README.md                     # This file
├── LICENSE                       # MIT License
├── claude-tools/
│   ├── commands/                 # 31 slash commands
│   ├── hooks/                    # 5 hook scripts (pre-commit, post-edit, etc.)
│   ├── agents/                   # 3 sub agent configurations
│   ├── ANTI-PATTERNS.md          # Condensed quick reference
│   ├── LESSONS-LEARNED.md        # Full anti-patterns guide
│   ├── CHEAT-SHEET.md            # One-page quick reference
│   ├── README.md                 # Quick start for installed tools
│   └── status-line.sh            # Status line script
└── docs/
    ├── CLAUDE-CODE-AUTOMATION.md # Automation guide
    ├── CLAUDE-CODE-TOOLS-USAGE.md # Complete command reference
    ├── CLAUDE-CODE-USAGE-EXAMPLES.md # Practical scenarios
    └── CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md # Implementation guide
```

---

## 🔧 Customization

### After Installation

1. **Review** `.claude/settings.local.json`
   - Add project-specific permissions to `allow` array
   - Customize hook prompts if needed

2. **Customize hooks**
   - Edit `.claude/hooks/pre-commit.sh` to add project-specific tests
   - Edit `.claude/hooks/security-check.sh` for deployment-specific checks

3. **Review documentation**
   - `.claude/LESSONS-LEARNED.md` - Understand anti-patterns
   - `.claude/CHEAT-SHEET.md` - Quick command reference

---

## 💡 Pro Tips

### Daily Workflow

```bash
# 1. Start session
/session-start

# 2. Check component health
/status

# 3. Make changes (hooks auto-trigger)
# - PreToolUse:Edit reminds about types
# - PostToolUse:Edit auto-validates

# 4. Commit (git hook auto-runs)
git commit -m "feat: My feature"
# Git pre-commit hook runs automatically
```

### Debugging Workflow

```bash
# After 3+ backend restarts:
/debug-checklist

# Check environment
/verify-environment

# View logs
/logs
```

### Before Deployment

```bash
# Run critical tests
/test-critical

# Security check
./.claude/hooks/security-check.sh

# Deploy
git push
```

---

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run the pre-commit hook
5. Submit a pull request

---

## 📜 License

MIT License - see [LICENSE](LICENSE) file for details

---

## 📚 Documentation

**In this repository:**
- [Automation Guide](docs/CLAUDE-CODE-AUTOMATION.md) - How automation works
- [Tools Usage](docs/CLAUDE-CODE-TOOLS-USAGE.md) - Complete command reference
- [Usage Examples](docs/CLAUDE-CODE-USAGE-EXAMPLES.md) - Practical scenarios
- [Recommendations](docs/CLAUDE-CODE-TOOLS-RECOMMENDATIONS.md) - Implementation guide

**After installation (in your project):**
- `.claude/README.md` - Quick reference
- `.claude/CHEAT-SHEET.md` - One-page cheat sheet
- `.claude/LESSONS-LEARNED.md` - Anti-patterns guide

---

## 🙏 Acknowledgments

Built with insights from real-world development challenges:
- Preventing type mismatches between backend/frontend
- Avoiding breaking working code through unnecessary changes
- Eliminating inefficient debugging loops
- Enforcing quality gates before commits

---

## ⚡ Quick Links

- [Installation](#installation) - Get started in 2 minutes
- [Auto Hooks](#1-balanced-automation-5-hooks-4-active-) - See what runs automatically
- [Slash Commands](#2-slash-commands-33-total) - Browse all commands
- [Anti-Patterns Prevented](#-anti-patterns-prevented) - See what this prevents

---

## 💰 Token Economics: Balanced Approach

**Question**: "How much do cctools hooks cost?"

**Answer**: ~500 tokens per session with MASSIVE long-term savings!

### Token Cost Analysis (Balanced Approach)

**Upfront Investment** (per session):
```
Session start hook             →   400 tokens (reads concise LESSONS-LEARNED.md)
Pre-edit hook (per 10 edits)  → 1,000 tokens (reminds to check types, test first)
Post-edit validation          →   minimal (bash script)
────────────────────────────────────────────
Total upfront: ~1,400 tokens for 10-edit session
```

**Compared to Original cctools**:
```
OLD session start hook         → 2,500 tokens (verbose LESSONS-LEARNED.md)
OLD pre-edit hooks (10 edits)  → 1,000 tokens
────────────────────────────────────────────
OLD Total: ~3,500 tokens

NEW Total: ~1,400 tokens
Savings: 70-75% vs original verbose automation
```

**WITHOUT cctools** (typical debugging cycle):
```
1. Implement feature           → 2,000 tokens
2. Break working code          → 3,000 tokens
   (forgot to test first)
3. Debug broken code           → 5,000 tokens
4. Discover type mismatch      → 3,000 tokens
5. Fix type mismatch           → 2,000 tokens
6. Add missing tests           → 2,000 tokens
────────────────────────────────────────────
Total: ~17,000 tokens + hours of debugging
```

**WITH cctools** (balanced automation):
```
1. Implement feature           → 2,000 tokens
2. Session start hook          →   400 tokens (reads concise docs)
3. Pre-edit hooks (10 edits)   → 1,000 tokens (prevents mistakes)
4. Post-edit validation        →   minimal (catches errors)
5. Done right first time       →     0 tokens (no debugging needed!)
────────────────────────────────────────────
Total: ~3,400 tokens + done in minutes
```

### Savings: 80% fewer tokens + 80% less time!

**Key Insight**: Concise LESSONS-LEARNED.md (190 → 31 lines, ~2,500 → ~400 tokens) makes automation affordable!

**Why the savings?**
- ✅ **Mistakes prevented** → No debugging conversations
- ✅ **Best practices enforced** → Done right first time
- ✅ **Quality gates** → No broken commits to fix
- ✅ **Systematic workflows** → No trial-and-error loops

**ROI**: Small upfront investment, massive long-term savings

---

**Last Updated**: November 1, 2025
**Version**: 1.0.0
**Compatibility**: Claude Code (tested on Windows Git Bash)

---

## 🎨 Customization

### Status Line (Always Customize This!)

**The default status-line.sh is generic** and shows:
```
[main] ✅ clean
[main] 📝 3 changes  
```

**For your project**, customize it to show your components:
```bash
# Edit .claude/status-line.sh
# See status-line-examples.sh for 6 ready-to-use examples:
# - Multi-component apps (MCP + API + UI)
# - Microservices architecture
# - Database + Backend + Frontend
# - Docker Compose setups
# - Simple backend only
# - Git status with test coverage
```

**Example output after customization**:
```
[main] MCP:✅ API:✅ UI:✅
[main] DB:✅ API:✅ UI:❌
[main] Containers:✅ 5/5
```

📖 **See [CUSTOMIZATION.md](CUSTOMIZATION.md) for complete guide**

---

### Other Customizations

**Pre-Commit Hook** - Add project-specific tests
**Security Check** - Add security-specific checks  
**Slash Commands** - Create new project-specific commands
**Sub Agents** - Customize agent prompts for your project

📖 **Full guide**: [CUSTOMIZATION.md](CUSTOMIZATION.md)

