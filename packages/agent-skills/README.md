# Agent Skills

These skills are intentionally maintained in this dotfiles repo because the
installed copies have local edits, no reliable current upstream install path,
or are personal skills that only live here.

## Layout

- `forks/`: externally-originated skills with local edits or restore concerns.
- `ours/`: personal skills authored for this setup.

Install them from GitHub, not from a local path:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex zed claude-code opencode \
  -y
```

After installing, commit the updated native global lock at
`~/.agents/.skill-lock.json`.
