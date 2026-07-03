# dotfiles

Personal macOS workstation config for Kenny's dev setup.

This repo uses GNU Stow. Config files live under `stow/<package>/` with
their real home-relative paths preserved, then Stow symlinks them into
`$HOME`.

## Layout

- `stow/`: symlinked config packages.
- `Brewfile`: Homebrew formulae and casks for restore.
- `packages/pnpm-globals.txt`: globally installed pnpm tools.
- `scripts/bootstrap.sh`: restore Homebrew packages, link config, install tools.
- `scripts/link.sh`: back up conflicting files and run Stow.
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
./scripts/link.sh --dry-run
```

Link all packages:

```sh
./scripts/link.sh
```

Link a subset:

```sh
./scripts/link.sh shell git zed
```

Restore packages:

```sh
brew bundle --file Brewfile
mise install
./scripts/install-pnpm-globals.sh
```

Full restore:

```sh
./scripts/bootstrap.sh
```

## Updating

Edit config through the usual path, such as `~/.zshrc` or
`~/.config/zed/settings.json`. Once linked, those paths point back into this
repo, so `git diff` shows the real changes here.

For app-managed skill folders, update them through their installer or copy
workflow rather than through this dotfiles repo.
