#!/usr/bin/env bash

# Simple Backend Status Line
# Shows: Git Branch | Backend API

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Check Backend API (port 8080)
if curl -s http://localhost:8080/health >/dev/null 2>&1; then
  API="✅"
else
  API="❌"
fi

echo "[$BRANCH] API:$API"
