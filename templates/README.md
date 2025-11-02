# Project Templates

Choose a template that matches your project architecture.

## Available Templates

### 1. Multi-Component App
**Best for**: MCP + Backend API + Frontend (like ai-trade project)
- Multiple services on different ports
- Health check endpoints
- Coordinated startup/shutdown

**Ports**: 8000 (MCP), 8001 (Backend), 3000 (Frontend)

### 2. Simple Backend
**Best for**: Single service applications
- One backend service
- Simple health checks
- Minimal complexity

**Ports**: 8080 (Backend)

### 3. Docker Compose
**Best for**: Container-based deployments
- Multiple Docker containers
- Docker health checks
- Container orchestration

## Usage

During installation, the installer will ask which template to use.
Or manually copy template files to your project's `.claude/` directory.

## Customization

After installation, customize:
- Port numbers
- Service names
- Health check URLs
- Startup scripts
