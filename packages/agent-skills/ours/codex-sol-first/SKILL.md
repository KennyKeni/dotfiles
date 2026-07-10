---
name: codex-sol-first
description: Route bounded scout, worker, and validator roles from a Codex lead to native Codex subagents using GPT-5.6 Sol at balanced reasoning efforts. Use when the user invokes $codex-sol-first, requests Codex-only subagent model routing, or combines native Codex delegation with the goal prompt template. Do not use for OpenCode or non-Codex delegation.
---

# Codex Sol First

Use this skill only from the user-facing, goal-owning Codex session. Treat
native Codex subagents as bounded execution lanes, not as the lead or final
judge. If a scout, worker, or validator encounters this skill, have it remain
within its assigned role and return to the lead instead of delegating.

## Preserve The Role Model

Use only the existing software-work roles:

- the user-facing, goal-owning Codex session is the `lead`;
- a native Codex subagent may fill the `scout` role;
- a native Codex subagent may fill the `worker` role;
- a fresh native Codex subagent fills the `validator` role.

Treat implementation, testing, review, and integration as activities owned by
these roles rather than additional roles. Keep requirements, contracts,
architecture, assignment, integration, cost control, and final completion
judgment with the lead.

When a goal or mission workflow is active, let it decide whether a scout,
worker, or validator is justified and let it own concurrency, agent-session
budgets, review cadence, and completion criteria. Count each newly spawned
subagent as the role session it fills; a focused follow-up to the same session
does not create another role.

Pass a compact, verified assignment rather than the full goal template or
mission history. Keep delegation one layer deep.

## Use The Sol Lane

Steer native Codex subagents to these defaults:

- use GPT-5.6 Sol at medium effort for bounded read-only scouting;
- use GPT-5.6 Sol at high effort when scouting must reconcile contradictory
  evidence, diagnose an unknown cause across unfamiliar subsystems, shape
  several feature contracts, or inform architecture, security, schema,
  migration, concurrency, or public-interface decisions;
- use GPT-5.6 Sol at medium effort for normal bounded implementation;
- use GPT-5.6 Sol at high effort for difficult cross-cutting implementation or
  work affecting security, migrations, concurrency, data integrity, schemas,
  or public interfaces;
- use GPT-5.6 Sol at high effort for independent validation.

Retain the current lead model and effort. Prefer GPT-5.6 Sol at xhigh effort
for a long-horizon mission lead, but leave parent-session selection to the
user.

Choose the effort before spawning and state it in the assignment. Keep the
canonical role name `scout`, `worker`, or `validator`; medium and high are
execution settings, not roles. If the requested model or effort is unavailable,
keep the work in the lead or report the limitation.

## Route Deliberately

Use a medium-effort scout for objectively checkable retrieval such as
repository mapping, symbol discovery, dependency tracing, validation-command
discovery, or implementation reconnaissance.

Use a high-effort scout when the evidence requires consequential synthesis.
The assignment remains read-only evidence gathering; the lead makes the
decision. Skip the scout when the lead already knows the relevant surface or
the worker can inspect it within a bounded implementation assignment.

Use a medium-effort worker for one normal bounded implementation lane. Use a
high-effort worker only after the lead has resolved the contract and material
design decisions and the remaining implementation is still difficult or
high-risk.

Keep unresolved product, architecture, security, schema, data-model, public
interface, and delivery decisions with the lead. Default to one active
writable worker in a workspace. Use broader parallelism only when the active
goal workflow permits independent write scopes.

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
pointers rather than the raw scout transcript.

## Assign The Worker

Give the worker:

- the bounded goal and exact repository scope;
- allowed paths or expected change surface;
- acceptance assertions and verified evidence;
- constraints, non-goals, and relevant repository instructions;
- required tests, proof commands, and UI evidence when applicable;
- the authorized commit and external-delivery boundary;
- stop conditions and the required return format.

Let the worker implement production changes and tightly coupled tests. The
lead owns test intent and independently verifies behavior. Use a separate
test-scoped worker only for high-risk behavior, a difficult regression
reproducer, or an explicit requirement of the active goal workflow; keep it
within the same worker budget rather than creating a new role.

Require the worker to stop before changing the contract, architecture, public
API, schema, migration behavior, or authorized scope. Require it to return
files changed, assertions addressed, commands actually run, observed results,
unrun checks, deviations, and remaining risks.

## Validate At Coherent Boundaries

Have the lead inspect every worker handoff, the complete diff, repository
state, focused tests, and exact proof output. For UI work, have the lead run the
application and inspect the required desktop and mobile states.

Follow the active goal workflow's validator requirements and cadence. When no
active workflow specifies them, assign one fresh high-effort Codex validator
after a coherent non-trivial PR or milestone passes focused gates. Add a
second validator only for high-risk work when the active workflow and budget
permit it. Reuse the same validator only for delta revalidation in the current
review cycle.

Have validators return findings without implementing fixes. Have the lead
verify each finding, decide severity and disposition, assign accepted fixes to
a worker, and own the user-facing result.

## Invoke Codex

Use the current native subagent controls. Give each spawned session the
canonical role, requested Sol effort, bounded assignment, applicable project
instructions, evidence pointers, proof requirements, and return shape. Record
the task name or identifier used to steer, wait for, or stop it.

Use focused follow-ups with the same worker for accepted fixes within its
scope. Start validation in a fresh session. If two focused follow-up rounds
fail to converge, stop delegating and finish or re-scope the work in the lead.

## Clean Up Interrupted Runs

When a native subagent hangs or is interrupted, inspect the active agent list
and stop only the session created for the delegated assignment. Preserve its
last useful evidence in the lead before replacing or closing it.
