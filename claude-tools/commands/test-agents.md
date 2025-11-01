---
description: Run V3 agent tests (Analyst, Trader, Chat)
---
Run agent tests:

1. Ensure backend is running (curl http://localhost:8001/health)
2. Run pytest tests/agents/ -v
3. Display results for all 10 agent tests
4. Show any failures with stack traces
