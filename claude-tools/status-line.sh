#!/usr/bin/env bash

# Claude Code Status Line
# Shows: Git Branch | Component Health | Last Test Status

# Get git branch
BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Check component health (quick)
MCP_STATUS="❌"
BACKEND_STATUS="❌"
FRONTEND_STATUS="❌"

# Check MCP (port 8000)
if curl -s http://localhost:8000/health >/dev/null 2>&1; then
  MCP_STATUS="✅"
fi

# Check Backend (port 8001)
if curl -s http://localhost:8001/health >/dev/null 2>&1; then
  BACKEND_STATUS="✅"
fi

# Check Frontend (port 3000)
if curl -s http://localhost:3000/api/health >/dev/null 2>&1; then
  FRONTEND_STATUS="✅"
fi

# Output format: branch | MCP Backend Frontend
echo "[$BRANCH] MCP:$MCP_STATUS API:$BACKEND_STATUS UI:$FRONTEND_STATUS"
