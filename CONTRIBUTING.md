# Contributing to Claude Code Tools

Thank you for your interest in contributing to Claude Code Tools! 🎉

---

## 🤝 How to Contribute

### Reporting Issues

**Found a bug or have a suggestion?**

1. Check [existing issues](https://github.com/yourusername/claude-code-tools/issues) first
2. Create a new issue with:
   - Clear title and description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Your environment (OS, Claude Code version)

### Submitting Pull Requests

**Want to add a feature or fix a bug?**

1. **Fork the repository**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**:
   - Follow existing code style
   - Add/update documentation as needed
   - Test your changes thoroughly
4. **Commit your changes**:
   ```bash
   git commit -m "feat: Add your feature description"
   ```
   Use conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`
5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
6. **Create a Pull Request**:
   - Describe what your PR does
   - Reference any related issues
   - Include screenshots/examples if applicable

---

## 📋 Contribution Ideas

### New Slash Commands
- Add project-specific commands for common workflows
- Create commands for other tech stacks (Rust, Go, Java, etc.)
- Add deployment automation commands

### New Hooks
- Additional pre-tool-use validations
- Post-tool-use quality checks
- Framework-specific hooks

### New Sub Agents
- Security audit agent
- Performance optimization agent
- Documentation generation agent

### Status Line Examples
- Add examples for new architectures (serverless, Kubernetes, etc.)
- Platform-specific examples (macOS, Linux)

### Documentation
- Add tutorials for specific use cases
- Translate documentation
- Add video walkthroughs
- Improve existing examples

---

## 🎯 Code Guidelines

### Shell Scripts (.sh files)
- Use `#!/usr/bin/env bash` shebang
- Test on Windows Git Bash
- Add comments for complex logic
- Use descriptive variable names
- Handle errors gracefully

### Markdown Files (.md)
- Use clear headings
- Add code examples with syntax highlighting
- Include practical use cases
- Keep language concise and friendly

### Slash Commands (.md in commands/)
- Start with `---` frontmatter with description
- Use clear, action-oriented language
- Include examples when helpful
- Reference relevant documentation

---

## ✅ Quality Checklist

Before submitting a PR, ensure:

- [ ] Code follows existing patterns and style
- [ ] All shell scripts are executable (`chmod +x`)
- [ ] Documentation is updated
- [ ] Examples are tested and work
- [ ] Commit messages follow conventional commits
- [ ] PR description is clear and complete

---

## 🙏 Recognition

All contributors will be:
- Listed in release notes
- Mentioned in acknowledgments
- Credited in relevant documentation

---

## 📜 Code of Conduct

**Be respectful and inclusive**:
- Welcome newcomers
- Provide constructive feedback
- Focus on solutions, not blame
- Celebrate contributions

---

## 💡 Questions?

- Check the [documentation](docs/)
- Ask in [Discussions](https://github.com/yourusername/claude-code-tools/discussions)
- Open an issue with the `question` label

---

**Thank you for making Claude Code Tools better!** 🚀

## 🔖 Version Management

When contributing changes:

### Update VERSION File

```bash
# Bump version based on changes
# Major: Breaking changes (1.0.0 → 2.0.0)
# Minor: New features (1.0.0 → 1.1.0)
# Patch: Bug fixes (1.0.0 → 1.0.1)

echo "2.1.0" > VERSION
```

### Test Installation Workflows

Test all three scenarios:
```bash
# 1. Fresh installation
./install-tools.sh  # In empty project

# 2. Re-installation
./install-tools.sh  # In project with existing .claude/

# 3. Uninstallation  
./uninstall-tools.sh
```

Ensure:
- Version numbers display correctly
- Backups are created properly
- Settings preservation works (Option 1)
- Uninstaller shows correct files

