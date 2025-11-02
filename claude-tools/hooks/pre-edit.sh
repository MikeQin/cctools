#!/usr/bin/env bash

# Hook runs before editing ANY file
# Purpose: Verify file exists, read type definitions, check dependencies

FILE_TO_EDIT="$1"

echo "🔍 PRE-EDIT CHECK: $FILE_TO_EDIT"

# 1. Verify file exists
if [ ! -f "$FILE_TO_EDIT" ]; then
  echo "⚠️ File does not exist: $FILE_TO_EDIT"
  echo "This will CREATE a new file. Confirm this is intentional."
  exit 0  # Allow creation but warn
fi

# 2. Check if modifying critical files (backend agents, frontend components)
if [[ "$FILE_TO_EDIT" == backend/agent-profiles/* ]]; then
  echo "⚠️ CRITICAL FILE: Backend agent"
  echo "Have you:"
  echo "  - Read .claude/LESSONS-LEARNED.md?"
  echo "  - Tested existing functionality first?"
  echo "  - Reviewed Pydantic models for type definitions?"
  echo ""
  echo "Proceeding with edit..."
fi

if [[ "$FILE_TO_EDIT" == frontend/src/components/* ]]; then
  echo "⚠️ CRITICAL FILE: Frontend component"
  echo "Have you:"
  echo "  - Checked TypeScript interfaces?"
  echo "  - Verified API contract matches backend?"
  echo "  - Tested with real API response?"
  echo ""
  echo "Proceeding with edit..."
fi

# 3. Show recent changes to this file
if [ -f "$FILE_TO_EDIT" ]; then
  echo "Recent changes to this file:"
  git log -3 --oneline -- "$FILE_TO_EDIT" || echo "No git history"
fi

exit 0  # Always allow edit (this is informational only)
