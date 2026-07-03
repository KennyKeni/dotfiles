# Issue tracker

This repo uses GitHub Issues as the canonical tracker. Use the `gh` CLI for all issue operations.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body "..."`. Use a heredoc for multi-line bodies.
- **Read an issue**: `gh issue view <number> --comments`, filtering comments by `jq` and also fetching labels.
- **List issues**: `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'` with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`

Infer the repo from `git remote -v` — `gh` does this automatically when run inside a clone.

Use `.local/agents/triage-labels.md` for the actual GitHub label strings to apply for category and state roles.

## When a skill says "publish to the issue tracker"

Create a GitHub issue. Do not create local issue files as a substitute.

## When a skill says "fetch the relevant ticket"

Run `gh issue view <number> --comments`.
