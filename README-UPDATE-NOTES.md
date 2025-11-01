# cctools/README.md Updates Needed

## Key Changes for Token-Conscious Design:

1. **Header** (line 3):
   - OLD: "31 slash commands, 8 auto hooks, 3 sub agents"
   - NEW: "33 slash commands, 4 sub agents, optional hooks (token-optimized)"

2. **Section: What You Get** (lines 63-77):
   - Update hook count: 8 → 2 active by default
   - Add note: "3 optional hooks (disabled by default for token savings)"
   - Update sub agents: 3 → 4 (added doc-agent)

3. **Auto-Triggers Section** (lines 140-191):
   - Update to reflect hooks are OPTIONAL
   - Add note about enabling in settings.local.json

4. **Token Economics Section** (lines 362-404):
   - ADD NEW SECTION: "Token-Conscious Design"
   - Explain: hooks disabled by default, enable if needed
   - Show: doc-agent reduced 8000+ → 500 tokens
   - Show: LESSONS-LEARNED reduced 190 → 31 lines

User should manually update cctools/README.md with these changes.
