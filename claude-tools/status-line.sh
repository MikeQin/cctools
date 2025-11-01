#!/usr/bin/env bash

# Claude Code Status Line - Generic Version
# Shows: Git Branch | Git Status

# Get git branch
BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")

# Get git status
if git rev-parse --git-dir > /dev/null 2>&1; then
  # Check if there are uncommitted changes
  if git diff-index --quiet HEAD -- 2>/dev/null; then
    GIT_STATUS="✅ clean"
  else
    CHANGES=$(git status --short | wc -l | tr -d ' ')
    GIT_STATUS="📝 $CHANGES changes"
  fi
else
  GIT_STATUS="no-git"
fi

# Output format: [branch] status
echo "[$BRANCH] $GIT_STATUS"

# CUSTOMIZATION INSTRUCTIONS:
# ============================
# This is a generic status line that shows git branch and status.
#
# To customize for your project, add health checks for your components:
#
# Example 1: Check if a server is running on a port
#   if curl -s http://localhost:8000/health >/dev/null 2>&1; then
#     SERVER_STATUS="✅"
#   else
#     SERVER_STATUS="❌"
#   fi
#   echo "[$BRANCH] Server:$SERVER_STATUS $GIT_STATUS"
#
# Example 2: Check multiple services
#   # Check database
#   if pg_isready -h localhost -p 5432 >/dev/null 2>&1; then
#     DB_STATUS="✅"
#   else
#     DB_STATUS="❌"
#   fi
#
#   # Check Redis
#   if redis-cli ping >/dev/null 2>&1; then
#     REDIS_STATUS="✅"
#   else
#     REDIS_STATUS="❌"
#   fi
#
#   echo "[$BRANCH] DB:$DB_STATUS Redis:$REDIS_STATUS $GIT_STATUS"
#
# Example 3: Check Docker containers
#   CONTAINERS=$(docker ps --format "{{.Names}}" | wc -l)
#   echo "[$BRANCH] Containers:$CONTAINERS $GIT_STATUS"
#
# See status-line-examples.sh for more customization examples
