#!/usr/bin/env bash

# Claude Code Tools Uninstaller
# Compatible with Windows Git Bash

set -e  # Exit on error

echo "=========================================="
echo "Claude Code Tools Uninstaller"
echo "=========================================="
echo ""

# Get target directory
echo "📂 Where are Claude Code tools installed?"
echo "Press Enter for current directory, or provide a path:"
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
echo "Uninstalling from: $TARGET_DIR"
echo ""

# Check if .claude exists
if [ ! -d "$TARGET_DIR/.claude" ]; then
    echo "❌ Error: No .claude directory found at $TARGET_DIR"
    echo "Nothing to uninstall."
    exit 1
fi

# Show what will be removed
echo "=========================================="
echo "⚠️  WARNING: This Will Remove"
echo "=========================================="
echo ""
echo "Directory: $TARGET_DIR/.claude/"
echo ""
if [ -d "$TARGET_DIR/.claude" ]; then
    echo "Contents:"
    ls -1 "$TARGET_DIR/.claude/" | sed 's/^/   • /'
fi
echo ""

# Check for git pre-commit hook
GIT_HOOK="$TARGET_DIR/.git/hooks/pre-commit"
if [ -f "$GIT_HOOK" ]; then
    if grep -q "\.claude/hooks/pre-commit.sh" "$GIT_HOOK" 2>/dev/null; then
        echo "Also will remove:"
        echo "   • Git pre-commit hook (.git/hooks/pre-commit)"
        echo ""
    fi
fi

# Offer backup option
echo "Options:"
echo ""
echo "1) Backup & Remove (save .claude/ to .claude.backup/)"
echo "2) Remove without backup"
echo "3) Cancel (keep everything)"
echo ""
read -p "Your choice [1-3]: " UNINSTALL_CHOICE

case $UNINSTALL_CHOICE in
  1)
    echo ""
    echo "📦 Creating backup..."
    BACKUP_DIR="$TARGET_DIR/.claude.backup.$(date +%Y%m%d-%H%M%S)"
    cp -r "$TARGET_DIR/.claude" "$BACKUP_DIR"
    echo "   ✅ Backup saved to: $BACKUP_DIR"
    echo ""
    PROCEED=true
    ;;
  2)
    echo ""
    echo "⚠️  No backup will be created."
    read -p "Are you sure? Type 'yes' to confirm: " CONFIRM
    if [ "$CONFIRM" = "yes" ]; then
      PROCEED=true
    else
      echo "❌ Uninstallation cancelled"
      exit 0
    fi
    ;;
  *)
    echo ""
    echo "❌ Uninstallation cancelled"
    exit 0
    ;;
esac

if [ "$PROCEED" = true ]; then
    echo "🗑️  Removing Claude Code tools..."
    
    # Remove .claude directory
    rm -rf "$TARGET_DIR/.claude"
    echo "   ✅ Removed .claude/"
    
    # Remove git hook if it exists and references our tools
    if [ -f "$GIT_HOOK" ]; then
        if grep -q "\.claude/hooks/pre-commit.sh" "$GIT_HOOK" 2>/dev/null; then
            # Backup existing hook
            cp "$GIT_HOOK" "$GIT_HOOK.removed.$(date +%Y%m%d-%H%M%S)"
            rm "$GIT_HOOK"
            echo "   ✅ Removed git pre-commit hook (backup created)"
        fi
    fi
    
    echo ""
    echo "=========================================="
    echo "✅ Uninstallation Complete!"
    echo "=========================================="
    echo ""
    
    if [ -n "$BACKUP_DIR" ]; then
        echo "Your backup is at: $BACKUP_DIR"
        echo ""
        echo "To restore:"
        echo "   mv $BACKUP_DIR $TARGET_DIR/.claude"
        echo ""
    fi
    
    echo "To reinstall:"
    echo "   cd /path/to/cctools"
    echo "   ./install-tools.sh"
    echo ""
fi
