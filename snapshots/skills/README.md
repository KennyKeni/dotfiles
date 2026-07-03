# Skill Snapshots

This directory is a one-way copy of app-managed skill folders.

The live skill folders stay as normal files under:

- `~/.agents/skills`
- `~/.claude/skills`

Do not Stow, symlink, or hardlink these folders. Codex may fail to register
symlinked `SKILL.md` files.

Refresh the snapshot with:

```sh
task snapshot:skills
```
