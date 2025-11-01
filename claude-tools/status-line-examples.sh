#!/usr/bin/env bash

# Status Line Customization Examples
# Copy one of these examples to replace status-line.sh

# ============================================
# Example 1: Multi-Component Application
# ============================================
# For apps with MCP server, backend API, frontend
# (Like the 0DTE Options Trading Application)

example_multi_component() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
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
  
  echo "[$BRANCH] MCP:$MCP_STATUS API:$BACKEND_STATUS UI:$FRONTEND_STATUS"
}

# ============================================
# Example 2: Microservices Architecture
# ============================================
# For apps with multiple backend services

example_microservices() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
  # Count running services
  AUTH_RUNNING=$(curl -s http://localhost:3001/health >/dev/null 2>&1 && echo "✅" || echo "❌")
  USER_RUNNING=$(curl -s http://localhost:3002/health >/dev/null 2>&1 && echo "✅" || echo "❌")
  ORDER_RUNNING=$(curl -s http://localhost:3003/health >/dev/null 2>&1 && echo "✅" || echo "❌")
  
  echo "[$BRANCH] Auth:$AUTH_RUNNING User:$USER_RUNNING Order:$ORDER_RUNNING"
}

# ============================================
# Example 3: Database + Backend + Frontend
# ============================================

example_fullstack() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
  # Check PostgreSQL
  if pg_isready -h localhost -p 5432 >/dev/null 2>&1; then
    DB="✅"
  else
    DB="❌"
  fi
  
  # Check Backend
  if curl -s http://localhost:4000/api/health >/dev/null 2>&1; then
    API="✅"
  else
    API="❌"
  fi
  
  # Check Frontend
  if curl -s http://localhost:3000 >/dev/null 2>&1; then
    UI="✅"
  else
    UI="❌"
  fi
  
  echo "[$BRANCH] DB:$DB API:$API UI:$UI"
}

# ============================================
# Example 4: Docker Compose Setup
# ============================================

example_docker() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
  # Count running containers
  if command -v docker >/dev/null 2>&1; then
    CONTAINERS=$(docker ps --format "{{.Names}}" 2>/dev/null | wc -l | tr -d ' ')
    EXPECTED=5  # Adjust to your setup
    
    if [ "$CONTAINERS" -eq "$EXPECTED" ]; then
      STATUS="✅ $CONTAINERS/$EXPECTED"
    elif [ "$CONTAINERS" -gt 0 ]; then
      STATUS="⚠️  $CONTAINERS/$EXPECTED"
    else
      STATUS="❌ 0/$EXPECTED"
    fi
  else
    STATUS="no-docker"
  fi
  
  echo "[$BRANCH] Containers:$STATUS"
}

# ============================================
# Example 5: Simple Backend Only
# ============================================

example_simple() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
  # Check if server is running
  if curl -s http://localhost:8080/health >/dev/null 2>&1; then
    SERVER="✅ running"
  else
    SERVER="❌ stopped"
  fi
  
  echo "[$BRANCH] $SERVER"
}

# ============================================
# Example 6: Git Status with Test Coverage
# ============================================

example_with_tests() {
  BRANCH=$(git branch --show-current 2>/dev/null || echo "no-git")
  
  # Get uncommitted changes count
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if git diff-index --quiet HEAD -- 2>/dev/null; then
      GIT_STATUS="✅"
    else
      CHANGES=$(git status --short | wc -l | tr -d ' ')
      GIT_STATUS="📝$CHANGES"
    fi
  else
    GIT_STATUS="no-git"
  fi
  
  # Check if tests are passing (example with pytest)
  if [ -f ".test-status" ]; then
    TEST_STATUS=$(cat .test-status)
  else
    TEST_STATUS="?"
  fi
  
  echo "[$BRANCH] $GIT_STATUS Tests:$TEST_STATUS"
}

# ============================================
# USAGE:
# ============================================
# 1. Choose an example that matches your project
# 2. Copy the function body to status-line.sh
# 3. Remove the function wrapper
# 4. Make status-line.sh executable: chmod +x status-line.sh
# 5. Test it: ./.claude/status-line.sh

# To use example 1 (Multi-Component):
# cp status-line.sh status-line.sh.backup
# Copy lines from example_multi_component() to status-line.sh

