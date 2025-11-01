---
description: Check current codebase state before making changes
---
**CONTEXT CHECK** (prevents breaking working code):

1. Run git status
2. Run git log -10 --oneline --graph to see branch history
3. Run git diff to show uncommitted changes
4. Run ./gitbash-status.sh to check running components
5. Display summary of current state
