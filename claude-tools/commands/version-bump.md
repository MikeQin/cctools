---
description: Bump version in package.json and pyproject.toml
---
**VERSION BUMP** - Increment project version:

1. Show current versions:
   - Frontend (package.json): Read current version
   - Backend (pyproject.toml): Read current version

2. Ask user which version to bump:
   - Major (1.0.0 → 2.0.0) - Breaking changes
   - Minor (1.0.0 → 1.1.0) - New features
   - Patch (1.0.0 → 1.0.1) - Bug fixes

3. Bump versions:

   **Frontend**:
   - cd frontend && npm version <major|minor|patch> --no-git-tag-version

   **Backend** (pyproject.toml):
   - Update version = "x.y.z" in [project] section

   **Root** (pyproject.toml):
   - Update version = "x.y.z" in [project] section

4. Display new versions:
   - Frontend: 3.4.0 → 3.5.0
   - Backend: 3.4.0 → 3.5.0
   - Root: 3.4.0 → 3.5.0

5. Reminder:
   - Don't forget to update CHANGELOG.md
   - Use /changelog-update command
   - Commit with message: "chore: Bump version to x.y.z"

**Use when**:
- Preparing for new release
- After completing feature set
- Before deployment
