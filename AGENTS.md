# AGENTS

Repository-level guidance for coding agents working in this project.

## Scope
- Apply these rules to the whole repository.
- Use workspace-local configuration under .agents as the source of truth.

## Working Rules
- Prefer small, reviewable changes.
- Preserve existing style and structure.
- Avoid unrelated refactors.
- Run relevant checks before completion when available.

## Safety
- Do not commit secrets, tokens, or private keys.
- Avoid destructive operations unless explicitly requested.
- Keep changes limited to the task scope.

## Agent Config Map
- Main guidance: .agents/agents.md
- MCP config: .agents/mcp.json
- System prompt: .agents/system-prompt.md
- Model profiles: .agents/models.json
- Skills: .agents/skills/
- Tasks: .agents/tasks/
- Memories: .agents/memories/
