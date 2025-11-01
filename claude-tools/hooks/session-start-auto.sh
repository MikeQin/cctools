#!/usr/bin/env bash

# Auto-run on Claude Code startup
# Reminds about session start protocol

echo "🚀 Claude Code Session Starting..."
echo ""
echo "📋 Session Start Protocol:"
echo "  1. ✅ Read .claude/LESSONS-LEARNED.md"
echo "  2. ✅ Check recent git changes"
echo "  3. ✅ Verify component status"
echo ""
echo "💡 Tip: Use /session-start for full protocol"
echo ""

# Quick component status check
if curl -s http://localhost:8001/health >/dev/null 2>&1; then
  echo "✅ Components appear to be running"
else
  echo "⚠️  Components not running - use /start-all"
fi

exit 0
