---
description: Quick session start protocol
---
**SESSION START**:

1. Read .claude/LESSONS-LEARNED.md (concise - 31 lines)

2. Run git status and recent commits:
   ```bash
   git status
   git log -3 --oneline
   ```

3. Check component health (if applicable):
   ```bash
   /status
   # Or if you have a custom health check:
   # curl http://localhost:YOUR_PORT/health
   ```

4. Ask: "What are we working on today?"

**Note**: Customize step 3 based on your project architecture.
See `templates/` for architecture-specific examples.
