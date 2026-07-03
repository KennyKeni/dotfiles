# dotfiles

Personal macOS workstation config for Kenny's dev setup.

This repo uses GNU Stow. Config files live under `stow/<package>/` with
their real home-relative paths preserved, then Stow symlinks them into
`$HOME`.

## Layout

- `stow/`: symlinked config packages.
- `snapshots/skills/`: one-way copies of app-managed skill folders.
- `Brewfile`: Homebrew formulae and casks for restore.
- `packages/pnpm-globals.txt`: globally installed pnpm tools.
- `Taskfile.yml`: restore packages, link config, install tools, and snapshot skills.
- `docs/secrets.md`: what must stay out of Git.
- `docs/apps.md`: app restore notes for non-Brew-managed apps.

## Not Stowed

Codex/agent skill folders, such as `~/.agents/skills` and `~/.claude/skills`,
are intentionally not managed by Stow here. Codex expects skill files to be
normal files in their app-managed locations; symlinked `SKILL.md` files may not
register in the app.

## Common Commands

Preview links and conflicts:

```sh
task link:dry-run
```

Link all packages:

```sh
task link
```

Link a subset:

```sh
task link -- shell git zed
```

Snapshot app-managed skills:

```sh
task snapshot:skills
```

Restore packages:

```sh
brew bundle --file Brewfile
mise install
task pnpm:globals
```

Full restore:

```sh
task bootstrap
```

## Updating

Edit config through the usual path, such as `~/.zshrc` or
`~/.config/zed/settings.json`. Once linked, those paths point back into this
repo, so `git diff` shows the real changes here.

For app-managed skill folders, update them through their installer or copy
workflow rather than through this dotfiles repo.
