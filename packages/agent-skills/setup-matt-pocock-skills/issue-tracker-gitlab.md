# Issue tracker

This repo uses GitLab Issues as the canonical tracker.

Use `glab` from the repo root so it resolves the current GitLab project.

Common operations:

- **Read an issue**: `glab issue view <number> --comments`, including labels and discussion.
- **List issues**: `glab issue list` with the appropriate `--label`, `--state`, and JSON/JQ options when available.
- **Comment on an issue**: `glab issue note <number> --message "..."`
- **Create an issue**: `glab issue create --title "..." --description-file <file>` or `--description "..."`.
- **Update labels**: `glab issue update <number> --label "label"` and remove stale labels with the matching `glab` option available on this machine.
- **Close**: `glab issue close <number>` and add a final note when context is useful.

Use `.local/agents/triage-labels.md` for the actual GitLab label strings to apply for category and state roles.

## Creating issues

Create a GitLab issue. Do not create local issue files as a substitute.

## Reading issues

Run `glab issue view <number> --comments`. Read the body, labels, and comments before deciding what to do.
