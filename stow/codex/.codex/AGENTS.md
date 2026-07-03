# Local Tooling

This machine uses `mise` for runtime/tool version management. Prefer `mise`-managed tools over Homebrew or language-specific version managers when a project depends on a specific runtime or CLI version.

- Global defaults live in `~/.config/mise/config.toml`.
- Project-specific versions should live in the project's `mise.toml`.
- Inspect `mise.toml`, `mise ls`, and `mise current` before assuming which runtime or CLI version is active.
- Use `mise install` after entering a project with a `mise.toml` if required tools are missing.
- Developer CLIs such as `gh` may be installed through `mise`; if a CLI is missing from the standard PATH or expected install location, check `mise` before falling back to Homebrew or other installers.
- Prefer purpose-built CLI commands over manual config edits when the CLI exists and preserves related state. For example, use the package manager's uninstall command instead of hand-editing `package.json` and lockfiles.
- Use `pnpm` as the default JavaScript package manager unless the project is explicitly using `bun`.
- Use `uv` as the default Python package and environment manager.

# Git-Excluded Instruction Files

`AGENTS.md` and `CLAUDE.md` are globally git-excluded on this machine. If a repository should track one of these files, unexclude it on a per-repository basis.
