#!/usr/bin/env bash

# Claude Code Tools Installer
# Compatible with Windows Git Bash
# Tested on: Git Bash 3.6.4 (Windows 10/11)
#
# Compatibility verified:
# - All commands are POSIX-compliant or Git Bash built-ins
# - Path handling works with Windows paths (C:/...)
# - Heredocs work correctly for creating config files
# - No Linux-specific utilities (like realpath, readlink -f)
#
# Installs: commands, hooks, agents, and configuration

set -e  # Exit on error

echo "=========================================="
echo "Claude Code Tools Installer"
echo "=========================================="
echo ""

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_DIR="$SCRIPT_DIR/claude-tools"

# Verify tools directory exists
if [ ! -d "$TOOLS_DIR" ]; then
    echo "❌ Error: claude-tools directory not found at $TOOLS_DIR"
    echo "Please ensure you're running this script from the cctools repository root."
    exit 1
fi

# Ask user for target directory
echo "📂 Where would you like to install Claude Code tools?"
echo "Press Enter to install in current directory, or provide a path:"
read -p "Target directory (default: $(pwd)): " TARGET_DIR

# Use current directory if no input
if [ -z "$TARGET_DIR" ]; then
    TARGET_DIR="$(pwd)"
fi

# Expand ~ to home directory if present
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

# Convert to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" 2>/dev/null && pwd || echo "$TARGET_DIR")"

echo ""
echo "Installing to: $TARGET_DIR"
echo ""

# Verify target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Error: Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Create .claude directory structure
echo "📁 Creating .claude directory structure..."
mkdir -p "$TARGET_DIR/.claude/commands"
mkdir -p "$TARGET_DIR/.claude/hooks"
mkdir -p "$TARGET_DIR/.claude/agents"

# Copy commands
echo "📋 Copying commands (31 slash commands)..."
cp -r "$TOOLS_DIR/commands/"* "$TARGET_DIR/.claude/commands/"
COMMANDS_COUNT=$(ls -1 "$TARGET_DIR/.claude/commands" | wc -l)
echo "   ✅ Installed $COMMANDS_COUNT commands"

# Copy hooks
echo "🪝 Copying hooks..."
cp -r "$TOOLS_DIR/hooks/"* "$TARGET_DIR/.claude/hooks/"
HOOKS_COUNT=$(ls -1 "$TARGET_DIR/.claude/hooks" | wc -l)
echo "   ✅ Installed $HOOKS_COUNT hooks"

# Make hooks executable
chmod +x "$TARGET_DIR/.claude/hooks/"*.sh

# Copy agents
echo "🤖 Copying sub agents..."
cp -r "$TOOLS_DIR/agents/"* "$TARGET_DIR/.claude/agents/"
AGENTS_COUNT=$(ls -1 "$TARGET_DIR/.claude/agents" | wc -l)
echo "   ✅ Installed $AGENTS_COUNT sub agents"

# Copy core files
echo "📄 Copying core files..."
cp "$TOOLS_DIR/ANTI-PATTERNS.md" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/LESSONS-LEARNED.md" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/CHEAT-SHEET.md" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/README.md" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/status-line.sh" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/status-line-examples.sh" "$TARGET_DIR/.claude/"
chmod +x "$TARGET_DIR/.claude/status-line.sh"
chmod +x "$TARGET_DIR/.claude/status-line-examples.sh"
echo "   ✅ Installed core files (including status-line-examples.sh)"

# Create settings.local.json if it doesn't exist
SETTINGS_FILE="$TARGET_DIR/.claude/settings.local.json"
if [ -f "$SETTINGS_FILE" ]; then
    echo ""
    echo "⚠️  settings.local.json already exists"
    echo "   Skipping (please merge manually if needed)"
else
    echo ""
    echo "⚙️  Creating settings.local.json..."
    cat > "$SETTINGS_FILE" << 'EOF'
{
  "permissions": {
    "allow": [],
    "deny": [],
    "ask": []
  },
  "statusLine": {
    "type": "command",
    "command": "./.claude/status-line.sh"
  },
  "hooks": {
    "SessionStart": [],
    "PreToolUse": [],
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
EOF
    echo "   ✅ Created settings.local.json"
fi

# Install git pre-commit hook if git repository exists
if [ -d "$TARGET_DIR/.git" ]; then
    echo ""
    echo "🔒 Installing Git native pre-commit hook..."

    GIT_HOOK="$TARGET_DIR/.git/hooks/pre-commit"
    if [ -f "$GIT_HOOK" ]; then
        echo "   ⚠️  Git pre-commit hook already exists"
        echo "   Backing up to pre-commit.backup"
        cp "$GIT_HOOK" "$GIT_HOOK.backup"
    fi

    cat > "$GIT_HOOK" << 'EOF'
#!/usr/bin/env bash

# Git Native Pre-Commit Hook
# Automatically runs .claude/hooks/pre-commit.sh before EVERY commit
# This hook will BLOCK the commit if pre-commit.sh fails

echo "🔍 Git Pre-Commit Hook: Running quality checks..."
echo ""

# Get the root directory of the git repository
REPO_ROOT=$(git rev-parse --show-toplevel)

# Run the Claude Code pre-commit validation script
if [ -f "$REPO_ROOT/.claude/hooks/pre-commit.sh" ]; then
    # Execute the pre-commit script
    bash "$REPO_ROOT/.claude/hooks/pre-commit.sh"
    EXIT_CODE=$?

    if [ $EXIT_CODE -ne 0 ]; then
        echo ""
        echo "❌ PRE-COMMIT CHECKS FAILED"
        echo "Commit blocked. Fix the issues above and try again."
        echo ""
        echo "💡 Tip: Run './.claude/hooks/pre-commit.sh' manually to see details"
        exit 1
    fi

    echo ""
    echo "✅ All pre-commit checks passed!"
    echo "Proceeding with commit..."
    exit 0
else
    echo "⚠️  Warning: .claude/hooks/pre-commit.sh not found"
    echo "Skipping pre-commit validation (commit will proceed)"
    exit 0
fi
EOF

    chmod +x "$GIT_HOOK"
    echo "   ✅ Git pre-commit hook installed"
else
    echo ""
    echo "ℹ️  No git repository found - skipping git pre-commit hook"
    echo "   (Run 'git init' first if you want the git hook)"
fi

echo ""
echo "=========================================="
echo "✅ Installation Complete!"
echo "=========================================="
echo ""
echo "📊 Summary:"
echo "   • $COMMANDS_COUNT slash commands"
echo "   • $HOOKS_COUNT hook scripts"
echo "   • $AGENTS_COUNT sub agents"
echo "   • Auto hooks configured"
echo "   • Status line enabled"
if [ -d "$TARGET_DIR/.git" ]; then
    echo "   • Git pre-commit hook installed"
fi
echo ""
echo "📚 Next Steps:"
echo ""
echo "1. Review the documentation:"
echo "   - .claude/README.md - Quick reference"
echo "   - .claude/CHEAT-SHEET.md - One-page cheat sheet"
echo "   - .claude/LESSONS-LEARNED.md - Anti-patterns to avoid"
echo ""
echo "2. Customize .claude/settings.local.json:"
echo "   - Add project-specific permissions to 'allow' array"
echo "   - Configure environment-specific settings"
echo ""
echo "3. Customize .claude/status-line.sh (recommended):"
echo "   - See .claude/status-line-examples.sh for 6 ready-to-use examples"
echo "   - Multi-component apps, microservices, Docker, etc."
echo "   - Default shows git branch + status (generic)"
echo ""
echo "4. Test the installation:"
echo "   - Start Claude Code in this directory"
echo "   - Try: /session-start"
echo "   - Try: /document (intelligent documentation system)"
echo "   - Status line should show in terminal"
echo ""
echo "5. Read the automation guide:"
echo "   - See what triggers automatically"
echo "   - No need to remember commands!"
echo ""
echo "🎉 Happy coding with Claude Code tools!"
echo ""
