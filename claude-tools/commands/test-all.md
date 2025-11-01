---
description: Run complete test suite (66 tests)
---
Run all tests:

1. Ensure all components are running (./gitbash-status.sh)
2. Clean Python cache (./gitbash-clean-python-cache.sh all)
3. Run pytest tests/ -v --tb=short
4. Display test results summary (passed/failed/skipped)
5. Show failed test details
