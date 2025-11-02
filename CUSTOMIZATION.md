# Customization Guide

This guide explains how to customize Claude Code Tools for your specific project.

---

## 📊 Status Line Customization

### Generic Default

The default `status-line.sh` shows **git branch and status only**:

```bash
[main] ✅ clean
[main] 📝 3 changes
```

This works for **any project** without modification.

---

### Project-Specific Customization

To customize for your project's components:

1. **Open** `.claude/status-line.sh`
2. **Choose an example** from `status-line-examples.sh`
3. **Copy the relevant code** to status-line.sh
4. **Adjust ports/URLs** for your services

---

### Example 1: Multi-Component Application

**For projects with multiple services (MCP, Backend, Frontend):**

```bash
#!/usr/bin/env bash

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Check MCP Server (port 8000)
if curl -s http://localhost:8000/health >/dev/null 2>&1; then
  MCP="✅"
else
  MCP="❌"
fi

# Check Backend API (port 8001)
if curl -s http://localhost:8001/health >/dev/null 2>&1; then
  API="✅"
else
  API="❌"
fi

# Check Frontend (port 3000)
if curl -s http://localhost:3000/api/health >/dev/null 2>&1; then
  UI="✅"
else
  UI="❌"
fi

echo "[$BRANCH] MCP:$MCP API:$API UI:$UI"
```

**Output**: `[main] MCP:✅ API:✅ UI:✅`

---

### Example 2: Simple Backend Only

**For projects with just one backend service:**

```bash
#!/usr/bin/env bash

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Check if server is running
if curl -s http://localhost:8080/health >/dev/null 2>&1; then
  SERVER="✅"
else
  SERVER="❌"
fi

echo "[$BRANCH] Server:$SERVER"
```

**Output**: `[main] Server:✅`

---

### Example 3: Docker Compose

**For Docker-based projects:**

```bash
#!/usr/bin/env bash

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Count running containers
CONTAINERS=$(docker ps --format "{{.Names}}" 2>/dev/null | wc -l | tr -d ' ')
EXPECTED=5  # Adjust to your setup

if [ "$CONTAINERS" -eq "$EXPECTED" ]; then
  STATUS="✅ $CONTAINERS/$EXPECTED"
else
  STATUS="⚠️  $CONTAINERS/$EXPECTED"
fi

echo "[$BRANCH] Containers:$STATUS"
```

**Output**: `[main] Containers:✅ 5/5`

---

## 🪝 Hook Customization

### Pre-Commit Hook

**Default**: Runs 5 generic tests (syntax, types, linting)

**To customize**:

1. Edit `.claude/hooks/pre-commit.sh`
2. Add project-specific tests:

```bash
# Add your custom tests
echo "Running custom database migration check..."
if ! python manage.py migrate --check; then
  echo "❌ Pending migrations found"
  exit 1
fi

echo "Running custom API contract tests..."
if ! npm run test:contracts; then
  echo "❌ API contracts broken"
  exit 1
fi
```

---

### Security Check Hook

**Default**: Generic security checks

**To customize** (`.claude/hooks/security-check.sh`):

```bash
# Add project-specific security checks

# Check for exposed API keys
if grep -r "sk-[a-zA-Z0-9]" src/; then
  echo "❌ Found exposed API keys"
  exit 1
fi

# Check for insecure dependencies
if npm audit --audit-level=high | grep -q "high"; then
  echo "❌ High severity vulnerabilities found"
  exit 1
fi
```

---

## 📋 Slash Commands Customization

### Adding Project-Specific Commands

**Create new command** (`.claude/commands/my-command.md`):

```markdown
---
description: Your custom command description
---

**MY CUSTOM COMMAND**

Instructions for Claude to follow when this command is invoked:

1. Do something specific to your project
2. Check your project-specific requirements
3. Run your project-specific tests
```

**Usage**: `/my-command`

---

### Modifying Existing Commands

**Example**: Customize `/test-critical` for your project

1. Edit `.claude/commands/test-critical.md`
2. Replace generic tests with your tests:

```markdown
---
description: Run YOUR 5 critical tests
---

**CRITICAL SMOKE TESTS** (Project-Specific):

Run these 5 tests that MUST pass:

1. Database connection test
   pytest tests/test_database.py

2. API integration test
   pytest tests/test_api_integration.py

3. Authentication test
   pytest tests/test_auth.py

4. Payment processing test
   pytest tests/test_payments.py

5. Frontend build test
   npm run build
```

---

## 🤖 Sub Agent Customization

### Customizing Agent Prompts

**Edit** `.claude/agent-profiles/refactor-agent.json`:

```json
{
  "name": "refactor-agent",
  "description": "Safe refactoring for YOUR project",
  "tools": ["Read", "Edit", "Glob", "Grep", "Bash"],
  "model": "claude-sonnet-4",
  "systemPrompt": "You are a refactoring specialist for [YOUR PROJECT NAME]. Follow these project-specific rules: 1) Always maintain backward compatibility with API v2. 2) Update unit tests in tests/ directory. 3) Run 'npm run lint' after changes. 4) Never modify files in legacy/ directory."
}
```

---

## 🎯 Best Practices

### 1. Keep Generic Tools Generic

**Don't modify** these files (they're project-agnostic):
- `ANTI-PATTERNS.md`
- `CHEAT-SHEET.md`
- Most commands like `/session-start`, `/debug-checklist`

### 2. Customize These Files

**Safe to customize** for your project:
- `status-line.sh` ← Always customize this
- `hooks/pre-commit.sh` ← Add project tests
- `hooks/security-check.sh` ← Add security checks
- Project-specific commands (create new ones)

### 3. Document Your Customizations

Add comments explaining your project-specific changes:

```bash
# Project-Specific: We check port 8080 because that's our FastAPI server
if curl -s http://localhost:8080/health >/dev/null 2>&1; then
```

---

## 📚 See Also

- `status-line-examples.sh` - 6 status line examples
- `claude-tools/README.md` - Quick reference
- `docs/CLAUDE-CODE-TOOLS-USAGE.md` - Complete guide

