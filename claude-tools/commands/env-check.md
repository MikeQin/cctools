---
description: Validate all environment variables are configured
---
**ENVIRONMENT VALIDATION** - Check all required env vars:

1. Load and verify .env file exists in root

2. Check critical environment variables:

   **Database**:
   - DB_HOST (should be: mike-linux)
   - DB_PORT (should be: 5432)
   - DB_NAME
   - DB_USER

   **API Keys**:
   - BACKEND_API_KEYS (should NOT be empty)
   - MCP_API_KEY (should NOT be default test value)

   **Ollama Models**:
   - PRIMARY_MODEL (should be: gpt-oss:20b)
   - FALLBACK_MODEL (should be: qwen3:8b)
   - OLLAMA_BASE_URL (should be configured)

   **NextAuth** (Frontend):
   - NEXTAUTH_URL
   - NEXTAUTH_SECRET (should NOT be "your-secret-key")
   - GOOGLE_CLIENT_ID
   - GOOGLE_CLIENT_SECRET

3. Display results:
   - ✅ Variable set and valid
   - ⚠️ Variable set but looks like default/test value
   - ❌ Variable missing or empty

4. Show summary:
   - Total variables checked
   - Issues found
   - Ready for production: YES/NO

**Use when**:
- After cloning repository
- Before deployment
- Debugging "connection refused" errors
- Setting up new environment
