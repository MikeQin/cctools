---
description: Run agent tests (IF APPLICABLE)
---
**AGENT TESTS** (Only if your project uses AI agents):

⚠️ **This command is for projects using LangChain/LlamaIndex agents or similar.**

If your project doesn't use AI agents, you can delete this command or customize it for your testing needs.

## If You Use AI Agents

Run your agent tests:

```bash
# Example: LangChain agent tests
pytest tests/agents/ -v

# Example: Test specific agents
pytest tests/agents/test_trader_agent.py
pytest tests/agents/test_analyst_agent.py

# Example: Node.js agent tests
npm run test:agents
```

## If You DON'T Use Agents

Replace this with your own tests:

```bash
# Unit tests
pytest tests/unit/

# Service tests
npm run test:services

# Component tests
npm run test:components
```

## Or Delete This Command

If not applicable, delete this file and it won't appear in your slash commands.
