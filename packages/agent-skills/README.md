# Edited Agent Skills

These skills are intentionally maintained in this dotfiles repo because the
installed copies have local edits or no reliable current upstream source.

Install them from GitHub, not from a local path:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex zed claude-code \
  -y
```

After installing, commit the updated native global lock at
`~/.agents/.skill-lock.json`.
