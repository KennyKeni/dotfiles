---
name: claude-opencode-grok-first
description: "Route implementation work from Claude Code to OpenCode through xAI Grok 4.5; Claude specs, reviews, verifies."
---

# Claude OpenCode Grok First

Claude Code sessions only. Codex/other harnesses: skip; never self-delegate.

Rationale: Claude spends tokens on judgment, design, spec-writing, review, and orchestration. Grok 4.5 through OpenCode is a useful second implementation lane for frozen work orders, broad repo reading, and large-context execution. So Grok types, Claude thinks and verifies.

## Route

Delegate to OpenCode/Grok (default for hands-on work when the user asks for Grok/OpenCode or a second implementation lane):

- implementation from a frozen spec; refactors; mechanical migrations
- bug fixes with known repro; implementation fixes
- CI fixes, dependency bumps, scripts/tooling
- frontend implementation, UI build-out, visual polish, responsive layout, motion
- bulk codebase exploration where raw reading is much larger than the answer

Keep in Claude:

- design, API design, architecture, naming, UX judgment
- tasks where writing the spec IS the work
- tiny edits where delegation overhead loses
- anything needing session tools: MCP, browser/computer-use, 1Password, secrets
- destructive/irreversible ops, releases, pushes, GitHub mutations
- review of OpenCode output: never delegated, never skipped

Tests: for standalone test writing or coverage fills, prefer `$codex-first` when available. Let OpenCode touch tests only when tests and production edits are inseparable in one implementation lane. Claude still owns test intent and verification.

Mixed task: Claude designs first, freezes spec, delegates build-out.
Heuristic: prompt reads as a work order -> delegate; writing it forces decisions -> design, Claude.

## Invoke

Refresh model names before relying on them:

```bash
opencode models --refresh >/dev/null
opencode models | rg -i '^xai/grok-4\.5$'
```

Current main ID: `xai/grok-4.5`. If unavailable, stop and report the model availability issue instead of substituting another model.

Prompt via temp file, never inline quoting:

```bash
P=$(mktemp); cat >"$P" <<'EOF'
<goal, repo + key paths, constraints ("don't touch X"), non-goals, proof expected, output shape>
EOF
opencode run --dir <repo> \
  --model xai/grok-4.5 \
  --agent build \
  --file "$P" \
  --dangerously-skip-permissions \
  --title "grok delegated task" \
  "Read the attached prompt and complete it exactly." \
  | tee /tmp/opencode-last.md
```

- Use `--model xai/grok-4.5` for every delegated task in this variant.
- Use `--agent build` for implementation, edits, migrations, fixes, and any task expected to modify files.
- Use `--agent explore` only for read-only discovery, risk finding, implementation reconnaissance, or optional second-opinion context gathering. Exploration prompts must explicitly say not to edit files.
- Do not use `--agent build` for review. If OpenCode is used for review despite the default, use `--agent explore` and ask for candidate findings only.
- Use a unique `--title` for each delegated run.
- `opencode run` exits without leaving a live process, but it may leave a resumable session record; that record can remain.

Follow-up fixes:

```bash
opencode run --dir <repo> --continue \
  --file "$P2" \
  --dangerously-skip-permissions \
  "Read the attached follow-up and revise the existing session output."
```

## Prompt Contract

OpenCode starts with little useful session context. Every prompt: goal, exact repo/paths, constraints, non-goals, proof expected (exact test command), output shape ("report files changed + test output"). Spec quality decides success.

For UI prompts include target viewport sizes, references/screenshots, states, and what done looks like.

## Verify (Claude, Always)

- `git status -sb` + read the full diff; judge like a contributor PR
- run focused tests yourself or demand exact proof output; OpenCode claims are advisory
- for UI, run the app and inspect desktop and mobile screenshots for text fit, overlap, and generic output
- iterate via `--continue`; after 2 failed rounds, take over directly
- before final response after a hung/interrupted run, confirm no live OpenCode process remains:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

## Economics

Win = implementation and exploration tokens moved to Grok/OpenCode; Claude spends only on spec, orchestration, and diff review. Do not ping-pong trivia through delegation; do not re-read what OpenCode already summarized.
