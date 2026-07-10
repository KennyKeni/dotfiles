# Agent Skills

These skills are intentionally maintained in this dotfiles repo because the
installed copies have local edits, no reliable current upstream install path,
or are personal skills that only live here.

## Layout

- `forks/`: externally-originated skills with local edits or restore concerns.
- `ours/`: personal skills authored for this setup.

Install them from GitHub, not from a local path. For an existing machine with
the native global lock, prefer:

```sh
task skills:restore-global
```

The restore task installs skills for Codex, Claude Code, and Zed by default and
preserves local per-skill agent overrides for harness-specific skills.

For a fresh install of the goal-prompt template:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex claude-code zed \
  -s goal-prompt-template \
  -y

task skills:restore-global
```

The broad install command is only for skills intended for all three default
agent harnesses:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex claude-code zed \
  -y
```

After installing, commit the updated native global lock at
`~/.agents/.skill-lock.json`.
