---
name: setup-matt-pocock-skills
description: Sets up a root `AGENTS.md` block and gitignored `.local/agents/` files so the engineering skills know this repo's GitHub issue tracker, triage label vocabulary, and local-only domain doc layout. Run before first use of `to-issues`, `to-prd`, `triage`, `diagnose`, `tdd`, `improve-codebase-architecture`, or `zoom-out` — or if those skills appear to be missing context about GitHub issues, triage labels, or `.local/` domain docs.
disable-model-invocation: true
---

# Setup Matt Pocock's Skills

Scaffold the per-repo configuration that the engineering skills assume:

- **Issue tracker** — GitHub Issues for PRDs, implementation issues, QA reports, refactor plans, and triage state
- **Triage labels** — the strings used for the five canonical triage roles
- **Domain docs** — where local-only context docs and ADRs live, and the consumer rules for reading them

This is a prompt-driven skill, not a deterministic script. Explore, present what you found, then write the local setup. Ask only if the repo cannot be identified as a GitHub repo or the user wants non-default label names.

## Process

### 1. Explore

Look at the current repo to understand its starting state. Read whatever exists; don't assume:

- `git remote -v` and `.git/config` — is this a GitHub repo? Which one?
- `.gitignore` — is `.local/` already ignored?
- `AGENTS.md` at the repo root — does it exist, and is there already an `## Agent skills` section?
- `.local/agents/` — does this skill's output already exist?
- `.local/context/` and `.local/adr/` — do local-only domain docs already exist?
- Legacy locations, for reporting only: `docs/agents/`, root `CONTEXT.md`, root `CONTEXT-MAP.md`, `docs/adr/`, `.scratch/`, `.out-of-scope/`, and root `UBIQUITOUS_LANGUAGE.md`
- `gh auth status` and `gh label list` when available — are GitHub auth and expected labels present?

### 2. Present findings and defaults

Summarise what's present and what's missing. Then state the defaults this skill will apply:

- GitHub Issues is the canonical issue tracker.
- `AGENTS.md` is the only committed setup pointer this skill edits or creates.
- `.local/` is gitignored and holds all generated agent-owned config and domain docs.
- `.local/agents/` holds setup files consumed by the skills.
- `.local/context/` holds local-only domain context docs.
- `.local/adr/` holds local-only Architecture Decision Records.
- `.local/out-of-scope/` holds local rejected-feature memory for triage.

Do not offer non-GitHub tracker choices. If there is no GitHub remote, ask for the GitHub repository or remote to use before doing GitHub operations; do not fall back to local issue files.

### 3. Triage label vocabulary

> Explainer: When the `triage` skill processes an incoming issue, it moves it through a state machine — needs evaluation, waiting on reporter, ready for an AFK agent to pick up, ready for a human, or won't fix. To do that, it needs to apply labels (or the equivalent in your issue tracker) that match strings *you've actually configured*. If your repo already uses different label names (e.g. `bug:triage` instead of `needs-triage`), map them here so the skill applies the right ones instead of creating duplicates.

The five canonical roles:

- `needs-triage` — maintainer needs to evaluate
- `needs-info` — waiting on reporter
- `ready-for-agent` — fully specified, AFK-ready (an agent can pick it up with no human context)
- `ready-for-human` — needs human implementation
- `wontfix` — will not be actioned

Default: each role's string equals its name. If the GitHub repo has no existing labels, the defaults are fine. If labels are missing and the user wants them created, use `gh label create` rather than editing local files only.

### 4. Domain docs

> Explainer: Some skills (`improve-codebase-architecture`, `diagnose`, `tdd`, `grill-with-docs`) read local context docs to learn the project's domain language, and local ADRs for past architectural decisions. These files are agent-owned memory and should not be committed.

Use this layout:

- **Single-context** — `.local/context/CONTEXT.md` plus `.local/adr/`.
- **Multi-context** — `.local/context/CONTEXT-MAP.md` points to context files under `.local/context/`.
- **ADRs** — all ADRs live in `.local/adr/`; include the context name in the title or slug when a decision is context-specific.

### 5. Confirm and edit

Show the user a draft of:

- The `## Agent skills` block to add to root `AGENTS.md`
- The contents of `.local/agents/issue-tracker.md`, `.local/agents/triage-labels.md`, and `.local/agents/domain.md`

Let them edit before writing.

### 6. Write

**Edit root `AGENTS.md`:**

Create it if it doesn't exist. If an `## Agent skills` block already exists, update its contents in-place rather than appending a duplicate. Don't overwrite user edits to the surrounding sections. Do not edit other agent-instruction files.

The block:

```markdown
## Agent skills

This repo keeps agent-owned support files in `.local/`, which is intentionally gitignored.

### Issue tracker

Issues, PRDs, triage, QA reports, and refactor plans live in GitHub Issues. See `.local/agents/issue-tracker.md`.

### Triage labels

Use the repo's configured GitHub labels. See `.local/agents/triage-labels.md`.

### Domain docs

Local-only domain context and ADRs live under `.local/context/` and `.local/adr/`. See `.local/agents/domain.md`.
```

Also ensure `.gitignore` contains `.local/` as a standalone ignored path.

Then write the three setup files using the seed templates in this skill folder as a starting point:

- [issue-tracker-github.md](./issue-tracker-github.md) — GitHub issue tracker
- [triage-labels.md](./triage-labels.md) — label mapping
- [domain.md](./domain.md) — domain doc consumer rules + layout

Write them to `.local/agents/issue-tracker.md`, `.local/agents/triage-labels.md`, and `.local/agents/domain.md`.

Do not delete, move, or rewrite existing committed docs automatically. If legacy `docs/agents/`, root `CONTEXT.md`, root `CONTEXT-MAP.md`, `docs/adr/`, `.scratch/`, `.out-of-scope/`, or root `UBIQUITOUS_LANGUAGE.md` files exist, report them as legacy/manual cleanup candidates.

### 7. Done

Tell the user the setup is complete and which engineering skills will now read from `.local/agents/*`. Mention they can edit `.local/agents/*.md` directly later; re-running this skill is only necessary if they want to refresh the local setup.
