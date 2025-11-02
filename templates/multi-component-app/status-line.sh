#!/usr/bin/env bash

# Multi-Component App Status Line
# Shows: Git Branch | MCP | Backend API | Frontend

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
