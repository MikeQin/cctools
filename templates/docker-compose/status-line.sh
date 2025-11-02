#!/usr/bin/env bash

# Docker Compose Status Line
# Shows: Git Branch | Container Count

BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Count running containers
if command -v docker >/dev/null 2>&1; then
  CONTAINERS=$(docker ps --format "{{.Names}}" 2>/dev/null | wc -l | tr -d ' ')
  EXPECTED=5  # ⚠️ CUSTOMIZE: Set your expected container count
  
  if [ "$CONTAINERS" -eq "$EXPECTED" ]; then
    STATUS="✅ $CONTAINERS/$EXPECTED"
  elif [ "$CONTAINERS" -gt 0 ]; then
    STATUS="⚠️  $CONTAINERS/$EXPECTED"
  else
    STATUS="❌ $CONTAINERS/$EXPECTED"
  fi
else
  STATUS="❌ docker not found"
fi

echo "[$BRANCH] Containers:$STATUS"
