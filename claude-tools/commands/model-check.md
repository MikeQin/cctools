---
description: Verify Ollama models are available
---
**OLLAMA MODEL VERIFICATION** - Check AI models status:

1. Check Ollama service is running:
   - curl -s http://GMKtec-EVO-X2-AI-Mini-wired:11434/api/tags
   - If fails, show error that Ollama is not accessible

2. List all available models:
   - Parse response and show model names

3. Verify required models are installed:
   - ✅ gpt-oss:20b (PRIMARY_MODEL)
   - ✅ qwen3:8b (FALLBACK_MODEL)

4. Show model details for required models:
   - Size
   - Last modified
   - Format

5. Display summary:
   - Total models available
   - Required models present: YES/NO
   - Model server accessible: YES/NO

**Use when**:
- Backend fails with "model not found"
- After installing new Ollama models
- Verifying model availability
- Debugging LLM agent errors

**Note**: Only gpt-oss:20b and qwen3:8b are verified to work with LangChain tool calling (out of 11 tested)
