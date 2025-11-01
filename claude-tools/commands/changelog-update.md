---
description: Add entry to CHANGELOG.md for new version
---
**CHANGELOG UPDATE** - Document version changes:

1. Read current CHANGELOG.md

2. Get version number:
   - Ask user for version (e.g., 3.5.0)
   - Or read from package.json/pyproject.toml

3. Ask user for change summary:
   - What changed in this version?
   - Type (feat/fix/docs/refactor/etc.)

4. Create changelog entry following existing format:

```markdown
## [x.y.z] - YYYY-MM-DD

### Added
- New feature description

### Changed
- Changed feature description

### Fixed
- Bug fix description

### Removed
- Removed feature description
```

5. Insert at top of CHANGELOG.md (after title)

6. Display diff to confirm

7. Reminder:
   - Review entry for clarity
   - Commit with: "docs: Update CHANGELOG for version x.y.z"
   - Consider creating git tag: git tag vx.y.z

**Use when**:
- After /version-bump
- Preparing release notes
- Before deployment
- Documenting version history
