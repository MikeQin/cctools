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

# Check if .claude directory already exists
if [ -d "$TARGET_DIR/.claude" ]; then
    echo ""
    echo "=========================================="
    echo "⚠️  Claude Code Tools Already Installed"
    echo "=========================================="
    echo ""
    echo "Existing installation found at: $TARGET_DIR/.claude"
    echo ""
    echo "What would you like to do?"
    echo ""
    echo "1) Update (preserve settings.local.json, overwrite everything else)"
    echo "2) Backup & Update (backup existing .claude/ to .claude.backup/, then update)"
    echo "3) Skip installation (cancel)"
    echo ""
    read -p "Your choice [1-3]: " REINSTALL_CHOICE
    
    case $REINSTALL_CHOICE in
      1)
        echo "✅ Updating tools (preserving settings.local.json)..."
        UPDATE_MODE="update"
        ;;
      2)
        echo "✅ Creating backup and updating..."
        BACKUP_DIR="$TARGET_DIR/.claude.backup.$(date +%Y%m%d-%H%M%S)"
        cp -r "$TARGET_DIR/.claude" "$BACKUP_DIR"
        echo "   📦 Backup saved to: $BACKUP_DIR"
        UPDATE_MODE="backup-update"
        ;;
      *)
        echo "❌ Installation cancelled"
        exit 0
        ;;
    esac
    echo ""
else
    UPDATE_MODE="fresh"
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Error: Target directory does not exist: $TARGET_DIR"
    exit 1
fi

# Create .claude directory structure
echo "📁 Creating .claude directory structure..."
mkdir -p "$TARGET_DIR/.claude/commands"
mkdir -p "$TARGET_DIR/.claude/scripts"
mkdir -p "$TARGET_DIR/.claude/agents"

# Copy commands
echo "📋 Copying commands (31 slash commands)..."
cp -r "$TOOLS_DIR/commands/"* "$TARGET_DIR/.claude/commands/"
COMMANDS_COUNT=$(ls -1 "$TARGET_DIR/.claude/commands" | wc -l)
echo "   ✅ Installed $COMMANDS_COUNT commands"

# Copy hooks
echo "🪝 Copying hooks..."
cp -r "$TOOLS_DIR/scripts/"* "$TARGET_DIR/.claude/scripts/"
HOOKS_COUNT=$(ls -1 "$TARGET_DIR/.claude/scripts" | wc -l)
echo "   ✅ Installed $HOOKS_COUNT hooks"

# Make hooks executable
chmod +x "$TARGET_DIR/.claude/scripts/"*.sh

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
n# Copy VERSION file
if [ -f "$SCRIPT_DIR/VERSION" ]; then
    cp "$SCRIPT_DIR/VERSION" "$TARGET_DIR/.claude/"
fi
cp "$TOOLS_DIR/status-line.sh" "$TARGET_DIR/.claude/"
cp "$TOOLS_DIR/status-line-examples.sh" "$TARGET_DIR/.claude/"
chmod +x "$TARGET_DIR/.claude/status-line.sh"
chmod +x "$TARGET_DIR/.claude/status-line-examples.sh"
echo "   ✅ Installed core files (including status-line-examples.sh)"

# Create settings.local.json if it doesn't exist
SETTINGS_FILE="$TARGET_DIR/.claude/settings.local.json"
if [ "$UPDATE_MODE" = "fresh" ]; then
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
EOF
    echo "   ✅ Created settings.local.json"
elif [ -f "$SETTINGS_FILE" ]; then
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
EOF
    echo "   ✅ Created settings.local.json"
fi

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
