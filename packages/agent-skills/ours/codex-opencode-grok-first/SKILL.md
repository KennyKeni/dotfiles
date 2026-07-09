---
name: codex-opencode-grok-first
description: Route one bounded scout or worker role from Codex to OpenCode through xAI Grok 4.5, while Codex remains lead and supplies every formal validator. Use when the user explicitly requests Grok 4.5 or xAI through OpenCode, invokes $codex-opencode-grok-first, or asks for the Grok variant of Codex-to-OpenCode delegation. Do not use for provider-unspecified OpenCode requests.
---

# Codex OpenCode Grok First

Use this skill only from the user-facing, goal-owning Codex session. Treat
OpenCode and Grok 4.5 as a lower-cost execution lane, not as the lead or final
judge. If a Codex scout, worker, or validator encounters this skill, have it
remain within its assigned role and return to the lead instead of delegating.

## Preserve The Role Model

Use only the existing software-work roles:

- the user-facing, goal-owning Codex session is the `lead`;
- OpenCode `explore` may fill the `scout` role;
- OpenCode `build` may fill the `worker` role;
- a fresh Codex subagent fills every formal `validator` role.

Do not invent reviewer, test-author, integration-agent, or orchestrator roles.
Treat worker self-check as part of the worker role and final judgment as part of
the lead role.

When a goal or mission workflow is active, let it decide whether a scout,
worker, or validator is justified and let it own concurrency, agent-session
budgets, review cadence, and completion criteria. Count each new OpenCode
session as the scout or worker session it fills. Do not count a focused
follow-up to the same session as a new agent session.

Do not ask OpenCode to interpret the full goal template or mission history.
Pass a compact, verified assignment. Do not let OpenCode create agents.

## Use The Grok Lane

Use `xai/grok-4.5` for every OpenCode session created through this skill. Do
not silently substitute another provider or model.

Refresh and verify the model once before the first delegation in the current
skill invocation:

```bash
opencode models --refresh >/dev/null
opencode models | rg -x 'xai/grok-4\.5'
```

If the model is unavailable or lacks a capability required by the assignment,
keep the work in Codex or report the limitation.

## Route Deliberately

Use an OpenCode scout for lower-cost, objectively checkable retrieval such as
repository mapping, symbol discovery, dependency tracing, validation-command
discovery, or implementation reconnaissance.

Use a Codex subagent as the scout instead when the assigned investigation
requires accurate synthesis across unfamiliar subsystems, diagnosis of an
unknown cause, reconciliation of contradictory evidence, or evidence that
will shape several feature contracts or survive later compactions. The Codex
scout replaces the OpenCode scout; do not run both by default.

Skip the scout when the lead already knows the relevant surface or the worker
can inspect it within a bounded implementation assignment.

Use an OpenCode worker for one bounded implementation lane:

- a known-scope feature, refactor, migration, or dependency update;
- a reproduced bug with defined expected behavior;
- repository tooling or scripts with explicit proof commands;
- frontend implementation with specified references, states, and viewports;
- focused tests coupled to the implementation.

Keep unresolved product, architecture, security, schema, data-model, public
interface, and delivery decisions with the lead. Keep authenticated tools,
secrets, releases, pushes, merges, destructive operations, and final
completion judgment in Codex.

Do not run a competing implementation merely to obtain a second answer.
Default to one active writable OpenCode worker. Use broader parallelism only
when the active goal workflow explicitly permits independent write scopes.

## Assign The Scout

Before assigning a scout, state the questions blocking the next contract or
implementation decision. Require the scout to return:

- observed facts with file, symbol, line, command, log, or source references;
- relevant patterns, dependency paths, and validation commands;
- inferences separated from observations;
- contradictions, uncertainties, and missing evidence;
- a recommended change surface labeled as a recommendation.

Treat the report as an evidence index. Have the lead verify claims that
materially determine scope, architecture, ownership, security, migrations, or
public behavior. Pass the worker a curated contract and primary-source
pointers, not the raw scout transcript.

## Assign The Worker

Give the worker:

- the bounded goal and exact repository scope;
- allowed paths or expected change surface;
- acceptance assertions and verified evidence;
- constraints, non-goals, and relevant repository instructions;
- required tests, proof commands, and UI evidence when applicable;
- the authorized commit and external-delivery boundary;
- stop conditions and the required return format.

Let the worker implement production changes and their tightly coupled tests.
The lead owns test intent and independently verifies behavior. Use a separate
test-scoped worker only for high-risk behavior, a difficult regression
reproducer, or an explicit requirement of the active goal workflow; keep it
within the same worker budget rather than creating a new role.

Require the worker to stop rather than silently changing the contract,
architecture, public API, schema, migration behavior, or authorized scope.
Require it to return files changed, assertions addressed, commands actually
run, observed results, unrun checks, deviations, and remaining risks.

## Validate At Coherent Boundaries

Do not use OpenCode as a validator or independent reviewer. OpenCode may
self-check its own implementation, but treat that as worker evidence rather
than independent review.

Have the lead inspect every OpenCode handoff, the complete diff, repository
state, focused tests, and exact proof output. For UI work, have the lead run the
application and inspect the required desktop and mobile states.

Follow the active goal workflow's validator requirements and cadence. When no
active workflow specifies them, assign one fresh Codex validator after a
coherent non-trivial PR or milestone passes focused gates. Add a second
validator only for high-risk work when the active workflow and budget permit
it. Do not run a full validator after every WIP revision. Reuse the same
validator only for delta revalidation in the current review cycle.

Have validators return findings without implementing fixes. Have the lead
verify each finding, decide severity and disposition, assign accepted fixes to
a worker, and own the user-facing result.

## Invoke OpenCode

The built-in `explore` agent must be available as a primary agent for direct
CLI use. Verify `opencode agent list` shows `explore (primary)`. Use
`--agent explore` for a scout and `--agent build` for a worker.

Create a prompt file using the environment's approved file-writing mechanism.
Include the role, goal, repository, exact scope, acceptance assertions,
constraints, non-goals, proof, delivery boundary, stop conditions, and output
shape. Attach references or screenshots required by the assignment. Set
`REPO` and `PROMPT_FILE` to their absolute paths before using the examples.

Worker invocation:

```bash
opencode run --dir "$REPO" \
  --model xai/grok-4.5 \
  --agent build \
  --file "$PROMPT_FILE" \
  --dangerously-skip-permissions \
  --title "grok worker: <bounded-task>" \
  "Read the attached assignment and complete only that worker scope."
```

Scout invocation:

```bash
opencode run --dir "$REPO" \
  --model xai/grok-4.5 \
  --agent explore \
  --file "$PROMPT_FILE" \
  --title "grok scout: <bounded-question>" \
  "Read the attached assignment and return evidence only. Do not edit files."
```

Give every run a unique title and record its exact session ID. Resume a worker
with `--session <session-id>` and a focused follow-up file; do not use bare
`--continue` when more than one OpenCode session may exist.

If two focused follow-up rounds fail to converge, stop delegating and finish
or re-scope the work in Codex.

## Clean Up Interrupted Runs

Persisted resumable sessions may remain. Only check for a live process when a
run hangs or is interrupted:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

Stop a leftover process created by the delegated run or report why it remains.
