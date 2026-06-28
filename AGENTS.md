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

## Astro Development
- When starting the dev server, use background mode:

	```
	astro dev --background
	```

- Manage the background server with `astro dev stop`, `astro dev status`, and `astro dev logs`.

## Astro Documentation
- Full documentation: https://docs.astro.build
- Consult these guides before working on related tasks:
	- Adding pages, dynamic routes, or middleware: https://docs.astro.build/en/guides/routing/
	- Working with Astro components: https://docs.astro.build/en/basics/astro-components/
	- Using React, Vue, Svelte, or other framework components: https://docs.astro.build/en/guides/framework-components/
	- Adding or managing content: https://docs.astro.build/en/guides/content-collections/
	- Adding styles or using Tailwind: https://docs.astro.build/en/guides/styling/
	- Supporting multiple languages: https://docs.astro.build/en/guides/internationalization/
