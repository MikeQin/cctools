---
description: Create a commit with session summary
---
Create session commit:

1. Run git status to show changes
2. Run git diff --stat to show file changes summary
3. Run git log --oneline -5 to show recent commits
4. Create commit message following project style:
   - feat: for new features
   - fix: for bug fixes
   - docs: for documentation
   - refactor: for code refactoring
   - test: for test additions
   - chore: for maintenance
5. Add Claude Code co-author:
   Co-Authored-By: Claude <noreply@anthropic.com>
6. Run git add . && git commit -m "message"
7. Display commit summary
