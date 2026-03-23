# MCP configuration

```json
  "mcpServers": {
    "chrome-devtools": {
      "type": "stdio",
      "command": "cmd",
      "args": [
        "/c",
        "npx",
        "chrome-devtools-mcp@latest"
      ],
      "env": {}
    },
    "sequential-thinking": {
      "type": "stdio",
      "command": "cmd",
      "args": [
        "/c",
        "npx",
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ],
      "env": {}
    }
  }
```