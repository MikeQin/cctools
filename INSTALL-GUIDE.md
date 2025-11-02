# Installation Guide - Complete Reference

Quick reference for all installation scenarios.

---

## 🆕 Fresh Installation

**When**: First time installing Claude Code tools

**Steps**:
```bash
git clone https://github.com/yourusername/cctools.git
cd cctools
./install-tools.sh
```

**Prompts**:
1. Where to install? → `/path/to/your-project`
2. Which template? → `[1-4]`

**Result**: `.claude/` directory created in your project

---

## 🔄 Update Existing Installation

**When**: Tools already installed, want latest version

**Steps**:
```bash
cd cctools
git pull  # Get latest version
./install-tools.sh
```

**Installer detects existing installation**:
```
⚠️  Claude Code Tools Already Installed

Version information:
   Current: 1.0.0
   New:     2.0.0
📦 Upgrading to v2.0.0

What would you like to do?
1) Update (preserve settings.local.json)
2) Backup & Update  
3) Skip installation
```

**Choose**:
- **Option 1**: Keep your hook customizations, update commands
- **Option 2**: Create backup, fresh install (for major updates)
- **Option 3**: Cancel

---

## 🗑️  Uninstall

**When**: Want to remove Claude Code tools

**Steps**:
```bash
cd cctools
./uninstall-tools.sh
```

**Prompts**:
```
⚠️  WARNING: This Will Remove
Directory: /your-project/.claude/

Options:
1) Backup & Remove (recommended)
2) Remove without backup
3) Cancel
```

**Choose**:
- **Option 1**: Safe removal with backup
- **Option 2**: Permanent removal
- **Option 3**: Cancel

**Restore**:
```bash
mv .claude.backup.TIMESTAMP .claude
```

---

## 📊 Quick Decision Matrix

| I want to... | Command | Options |
|--------------|---------|---------|
| Install first time | `./install-tools.sh` | Choose template |
| Update to latest | `./install-tools.sh` | Choose: 1) Update |
| Major upgrade with backup | `./install-tools.sh` | Choose: 2) Backup & Update |
| Remove tools (safe) | `./uninstall-tools.sh` | Choose: 1) Backup & Remove |
| Remove tools (permanent) | `./uninstall-tools.sh` | Choose: 2) Remove |

---

## 🎯 Pro Tips

1. **Always commit `.claude/` to git** - Your team gets tools automatically
2. **Use Option 1 for updates** - Preserves your customizations
3. **Use Option 2 for major changes** - Safety backup
4. **Check VERSION file** - Know what's installed: `cat .claude/VERSION`
5. **Test before deploy** - Run installer in test project first

---

For detailed workflows and troubleshooting, see [SUMMARY.md](SUMMARY.md)
