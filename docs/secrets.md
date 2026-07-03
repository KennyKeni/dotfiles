# Secrets and Generated State

Do not commit credentials, auth state, caches, sessions, generated databases,
or machine-local histories.

Examples that should stay out of this repo:

- `.npmrc`
- `.ssh/`
- `.aws/`
- `.docker/`
- `.terraform.d/`
- `.zsh_history`
- `.claude.json*`
- `.codex/auth.json`
- `.codex/cache/`
- `.codex/browser/sessions/`
- `.codex/ambient-suggestions/`
- `.claude/projects/`
- `.config/zed/prompts/`
- `.config/opencode/node_modules/`
- `.agents/skills/`
- `.claude/skills/`

If a tool needs a token or local identity file, document how to recreate it
instead of committing the file.
