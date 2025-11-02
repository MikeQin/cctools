---
description: Bump version (major/minor/patch)
---
**VERSION BUMP**:

Increment version number across your project.

## Quick Setup

### Example 1: NPM (package.json)
```bash
# Patch (1.0.0 → 1.0.1)
npm version patch

# Minor (1.0.0 → 1.1.0)
npm version minor

# Major (1.0.0 → 2.0.0)
npm version major
```

### Example 2: Python (pyproject.toml)
```bash
# Using poetry
poetry version patch
poetry version minor
poetry version major

# Manual edit
sed -i 's/version = "1.0.0"/version = "1.0.1"/' pyproject.toml
```

### Example 3: Multiple Files
```bash
# Update version in multiple places
VERSION="1.0.1"
sed -i "s/version = .*/version = \"$VERSION\"/" pyproject.toml
sed -i "s/\"version\": .*/\"version\": \"$VERSION\",/" package.json
```

### Example 4: Git Tag
```bash
# Create git tag after version bump
git tag -a v1.0.1 -m "Release v1.0.1"
git push --tags
```

## Semantic Versioning

- **MAJOR** (1.0.0 → 2.0.0): Breaking changes
- **MINOR** (1.0.0 → 1.1.0): New features, backward compatible
- **PATCH** (1.0.0 → 1.0.1): Bug fixes, backward compatible

## Typical Workflow

```bash
# 1. Bump version
npm version minor

# 2. Update changelog
/changelog-update

# 3. Commit version bump
git add package.json CHANGELOG.md
git commit -m "chore: bump version to v1.1.0"

# 4. Create git tag
git tag -a v1.1.0 -m "Release v1.1.0"

# 5. Push
git push && git push --tags
```

## Files to Update

Common files that contain version numbers:
- `package.json` (Node.js)
- `pyproject.toml` (Python)
- `Cargo.toml` (Rust)
- `go.mod` (Go)
- `build.gradle` (Java/Kotlin)
- `pom.xml` (Maven)
- `VERSION` file
- `CHANGELOG.md`
- Documentation
