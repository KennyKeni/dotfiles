---
name: codex-opencode-grok-first
description: Route selected Codex work to OpenCode through xAI Grok 4.5 only, with Codex orchestrating and verifying. Use when the user asks to delegate to OpenCode/Grok/xAI, wants Grok 4.5 as a second implementation agent, or asks for the Grok variant of Codex OpenCode delegation.
---

# Codex OpenCode Grok First

Codex sessions only. Current harness is Codex; OpenCode is the subagent. Codex keeps the spec, judgment, final diff review, test verification, and user conversation.

## Default Stance
Default to `xai/grok-4.5` for all delegated OpenCode work. This variant is intentionally Grok-only: do not substitute GLM, Kimi, Minimax, or other Ollama Cloud lanes from this skill.

Use the same Grok 4.5 lane for repo engineering, frontend implementation, text/code tasks, visual UI work, screenshot/reference-driven implementation, and large-context research. If `xai/grok-4.5` is unavailable, stop and report the model availability issue instead of silently choosing another model.

## Model Check
Names move. Refresh and inspect before delegating:

```bash
opencode models --refresh >/dev/null
opencode models | rg -i '^xai/grok-4\.5$'
```

Current main ID: `xai/grok-4.5`.

## Route
Delegate to OpenCode when the prompt is mostly execution:

- repo-scale reading, implementation, refactors, migrations, dependency bumps
- known-repro bug fixes, tests, coverage fills, script/tooling work
- frontend implementation, UI build-out, visual polish, responsive layout, motion, and design exploration
- a second-model implementation pass would materially reduce risk

Keep in Codex:

- ambiguous product/design/architecture decisions before the spec is frozen
- tiny obvious edits where delegation overhead loses
- authenticated MCP/app tools, secrets, releases, pushes, destructive ops
- serious or high-stakes reviews where Codex should be the primary reviewer
- final review of every OpenCode change: diff, tests, screenshots for UI, and closeout

## Review Delegation
Do not route important reviews to OpenCode as the primary reviewer. Codex owns review judgment, severity, and final wording.

Use OpenCode for review only when at least one is true:

- the review is small and inconsequential
- the user explicitly wants a second-agent second opinion
- it runs in parallel with Codex's own review and Codex reconciles the results

OpenCode review prompts should ask for concrete findings with file/line references and evidence, not a final verdict. Codex must still inspect the diff, decide whether each finding is real, and write the user-facing review.

Mixed task: Codex writes a precise work order first, then delegates to Grok 4.5. For visual-reference UI work, Codex should state acceptance criteria, attach the relevant references, and then verify visually.

## OpenCode Agent
Use `--agent plan` for read-only discovery: repo mapping, large-context research, design exploration, risk finding, implementation reconnaissance, and second-opinion context gathering. Exploration prompts must explicitly say not to edit files and should ask for findings, relevant paths, tradeoffs, and recommended next actions.

Do not pass `--agent explore` to `opencode run`. In current OpenCode, `explore` is a subagent, not a primary CLI agent, and OpenCode falls back to the default `build` agent. Verify the run header says `> plan` for read-only exploration or `> build` for implementation.

Use `--agent build` for implementation, edits, tests, migrations, fixes, and any task expected to modify files. Keep the default implementation invocation on `build`.

## Invoke
Prompt via temp file and attach it; do not inline a large prompt.

```bash
P=$(mktemp); cat >"$P" <<'EOF'
Goal:
Repo:
Key paths:
Constraints:
Non-goals:
Proof expected:
Output: report files changed, commands run, test output, and remaining risks.
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

Use `--model xai/grok-4.5` for every delegated task in this variant. Use `--variant max` only if xAI/OpenCode supports it for the selected run and the task justifies slower output.

Exploration-only run:

```bash
opencode run --dir <repo> \
  --model xai/grok-4.5 \
  --agent plan \
  --file "$P" \
  --title "grok exploration task" \
  "Read the attached prompt and report findings only. Do not edit files."
```

Follow-up fixes:

```bash
opencode run --dir <repo> --continue \
  --file "$P2" \
  --dangerously-skip-permissions \
  "Read the attached follow-up and revise the existing session output."
```

## Session Cleanup
Use a unique `--title` for each delegated run. `opencode run` exits without leaving a live process, but it may leave a resumable session record; that record can remain.

Do not delete sessions just because they are persisted. Only act when a run hangs, is interrupted, or appears to leave a live process. Before final response in those cases, confirm no OpenCode process is still active:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

If a live OpenCode process from the delegated run remains, stop it or report why it is intentionally still running.

## Prompt And Verify
OpenCode starts with little useful session context. Every prompt must include the goal, exact repo/path scope, constraints, non-goals, proof command, and output shape. For UI prompts include target viewport sizes, references/screenshots, states, and what "done" looks like.

Codex always verifies `git status -sb`, the full diff, focused tests, and exact proof output. For UI, run the app and inspect desktop and mobile screenshots for text fit, overlap, and generic output. Iterate with `--continue` when close; after two poor rounds, stop delegating and finish in Codex.
