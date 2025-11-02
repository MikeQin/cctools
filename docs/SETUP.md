# Setup Claude Code

```bash
user /c/dev/project (main)
$npm install -g @anthropic-ai/claude-code

added 12 packages in 3s

11 packages are looking for funding
  run `npm fund` for details

user /c/dev/project (main)
$claude doctor

 Diagnostics
 └ Currently running: npm-global (2.0.31)
 └ Path: C:\Program Files\nodejs\node.exe
 └ Invoked: C:\Users\user\AppData\Roaming\npm\node_modules\@anthropic-ai\claude-code\cli.js
 └ Config install method: unknown
 └ Auto-updates enabled: default (true)
 └ Update permissions: Yes
 └ Search: OK (vendor)

 Press Enter to continue…

user /c/dev/project (main)
$npm install -g ccusage

added 1 package in 979ms

1 package is looking for funding
  run `npm fund` for details

user /c/dev/project (main)
$claude mcp add chrome-devtools npx chrome-devtools-mcp@latest
Added stdio MCP server chrome-devtools with command: npx chrome-devtools-mcp@latest to local config
File modified: C:\Users\user\.claude.json [project: C:\dev\project]

user /c/dev/project (main)
$claude mcp add-json "sequential-thinking" '{"command":"npx","args":["-y","@modelcontextprotocol/server-sequential-thinking"]}'
Added stdio MCP server sequential-thinking to local config
```