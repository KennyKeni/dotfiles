# dotfiles

Personal macOS workstation config for Kenny's dev setup.

This repo uses GNU Stow. Config files live under `stow/<package>/` with
their real home-relative paths preserved, then Stow symlinks them into
`$HOME`.

## Layout

- `stow/`: symlinked config packages.
- `packages/agent-skills/`: edited/forked and personal skills installed through `npx skills`.
- `Brewfile`: Homebrew formulae and casks for restore.
- `packages/pnpm-globals.txt`: globally installed pnpm tools.
- `Taskfile.yml`: restore packages, link config, install tools, and restore global skills.
- `docs/secrets.md`: what must stay out of Git.
- `docs/apps.md`: app restore notes for non-Brew-managed apps.

## Not Stowed

Codex/agent skill folders, such as `~/.agents/skills` and `~/.claude/skills`,
are intentionally not managed by Stow here. Skill files should be installed with
`npx skills` so each app sees normal files in its own app-managed location.

The native global skills lock, `~/.agents/.skill-lock.json`, is shared through
dotfiles. Restore global skills from that lock with `task skills:restore-global`.

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

Restore global skills from the native global lock:

```sh
task skills:restore-global
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

Edited and personal skills live in `packages/agent-skills/`, split between
`forks/` and `personal/`. Edited forks use the `keni-` prefix; original personal
skills remain unprefixed. Push changes to this GitHub repo, then install them with
`npx skills --full-depth` from:

```sh
https://github.com/KennyKeni/dotfiles/tree/main/packages/agent-skills
```

After changing global skill installs, commit the updated native global lock.
