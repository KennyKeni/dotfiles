# Issue tracker

This repo uses GitHub Issues as the canonical tracker. Run every GitHub issue operation through the `gh` CLI from the target repository. Prefer `gh issue` and `gh label`; use `gh api` only for GitHub issue features that those high-level commands do not expose.

Keep the interface consistent. Do not switch to a connector, browser automation, `curl`, or handwritten GraphQL. If `gh` is missing, unauthenticated, or lacks permission, stop and report that blocker instead of choosing another interface.

## Conventions

- **Create an issue**: `gh issue create --title "..." --body-file -`. Supply multi-line bodies with a heredoc on standard input.
- **Read an issue**: `gh issue view <number> --comments`, filtering comments by `jq` and also fetching labels.
- **List issues**: `gh issue list --state open --json number,title,body,labels,comments --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'` with appropriate `--label` and `--state` filters.
- **Comment on an issue**: `gh issue comment <number> --body "..."`
- **Apply / remove labels**: `gh issue edit <number> --add-label "..."` / `--remove-label "..."`
- **Close**: `gh issue close <number> --comment "..."`

After any create or mutation, inspect the result with `gh issue view` or the matching `gh api` read and report the issue URL. A successful command without read-back is not completion.

## Native sub-issues

An umbrella, tracking, or parent issue and its children must use GitHub's native sub-issue relationship. A `#123` link in an issue body is useful context but is not a substitute for that relationship.

Create each child with `gh issue create`, capture its number or URL, then attach it:

```bash
child_id="$(gh api "repos/{owner}/{repo}/issues/$child_number" --jq '.id')"
gh api --method POST \
  "repos/{owner}/{repo}/issues/$parent_number/sub_issues" \
  -F "sub_issue_id=$child_id"
```

After attaching all children, verify the complete set:

```bash
gh api --paginate \
  "repos/{owner}/{repo}/issues/$parent_number/sub_issues" \
  --jq '.[].number'
```

Do not report a breakdown as published until every intended child appears in this read-back. `gh api` is the sanctioned CLI path here because `gh issue` does not expose native sub-issue management.

Infer the repo from `git remote -v` — `gh` does this automatically when run inside a clone.

Use `.local/agents/triage-labels.md` for the actual GitHub label strings to apply for category and state roles.

## When a skill says "publish to the issue tracker"

Create a GitHub issue. Do not create local issue files as a substitute.

## When a skill says "fetch the relevant ticket"

Run `gh issue view <number> --comments`.
