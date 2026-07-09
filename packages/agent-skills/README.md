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

The restore task preserves local per-skill agent overrides. The `inline` and
`progressive` goal-prompt A/B variants are Codex-only for now; because the
current `skills` CLI routes Codex through the universal `~/.agents/skills`
root, the restore task moves Codex-only skills into `~/.codex/skills` after the
`npx` install.

For a fresh install of both Codex-only variants:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex \
  -s goal-prompt-template-inline goal-prompt-template-progressive \
  -y

task skills:restore-global
```

The broad all-agent install command is only for skills intended for every
configured agent:

```sh
npx -y skills@latest add https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills \
  -g --copy --full-depth \
  -a codex zed claude-code opencode \
  -y
```

After installing, commit the updated native global lock at
`~/.agents/.skill-lock.json`.
