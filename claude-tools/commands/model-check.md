---
description: Verify AI models available (IF APPLICABLE)
---
**AI MODEL CHECK** (Only if your project uses AI models):

⚠️ **This command is for projects using Ollama, OpenAI, or other LLMs.**

If your project doesn't use AI models, you can delete this command.

## If You Use Ollama

Check which models are available:

```bash
# List all models
ollama list

# Check if specific model exists
ollama list | grep "your-model-name"

# Test model
ollama run your-model-name "test prompt"
```

## If You Use OpenAI API

Check API access:

```bash
# Test API key
curl https://api.openai.com/v1/models \
  -H "Authorization: Bearer $OPENAI_API_KEY"

# Or use Python
python -c "import openai; print(openai.Model.list())"
```

## If You Use HuggingFace

Check model availability:

```python
from transformers import AutoModel
model_name = "your-model-name"
try:
    model = AutoModel.from_pretrained(model_name)
    print(f"✅ {model_name} is available")
except:
    print(f"❌ {model_name} not found")
```

## If You Use Cloud Services

### AWS Bedrock
```bash
aws bedrock list-foundation-models
```

### Azure OpenAI
```bash
az cognitiveservices account list
```

### Google Vertex AI
```bash
gcloud ai models list
```

## Or Delete This Command

If not applicable, delete this file and it won't appear in your slash commands.
