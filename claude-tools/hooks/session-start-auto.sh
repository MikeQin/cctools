#!/usr/bin/env bash

# Quick session start reminder

echo "🚀 Session Starting - Use /session-start for quick check"
echo ""

# Quick health check
if curl -s http://localhost:8001/health >/dev/null 2>&1; then
  echo "✅ Components running"
else
  echo "⚠️  Components down - use /start-all"
fi

exit 0
