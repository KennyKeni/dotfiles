---
name: codex-subagent-routing
description: Route bounded scout, worker, and validator assignments from a Codex lead through native Codex Sol, Codex Efficient, OpenCode/Grok, or OpenCode/Ollama execution lanes. Use when the user invokes $codex-subagent-routing, requests one of these Codex-led delegation policies, or combines lane selection with the goal prompt template.
---

# Codex Subagent Routing

Use this skill only from the user-facing, goal-owning Codex session. Treat each
subagent or OpenCode session as a bounded execution lane. Keep the current
session as the lead and final judge.

## Select The Execution Lane

Treat an explicit provider or model request as policy selection, subject to that
policy's role and risk eligibility. Without one, use native Codex Sol. Use an
OpenCode lane only when the user requests it or the active mission has a
recorded preference for it.

Select a lane independently for each assignment. Before the first assignment
to a lane in the current context, read its reference completely:

- native Codex: read [codex-sol.md](references/codex-sol.md);
- mixed cost-aware routing: read
  [codex-efficient.md](references/codex-efficient.md), then read the native
  Codex or Grok execution reference only when that policy selects it;
- xAI through OpenCode: read
  [opencode-grok.md](references/opencode-grok.md);
- Ollama Cloud through OpenCode: read
  [opencode-ollama.md](references/opencode-ollama.md).

Retain a loaded lane reference for later assignments; do not reread it for
every spawn. Load another reference only when a later assignment selects that
lane. After compaction, reload only the reference required for the recorded
next assignment.

If a selected lane is unavailable, use another lane only when the user or
active mission authorizes fallback. Otherwise keep the work in the lead or
report the limitation.

When an assignment is ineligible for an explicitly requested OpenCode policy,
stop and report the mismatch. Use Sol only after the user or active mission
authorizes that fallback; do not silently override the provider request.

## Preserve The Role Model

Use only `lead`, `scout`, `worker`, and `validator` as software-work roles.
Treat implementation, testing, review, and integration as activities owned by
these roles.

Keep requirements, contracts, decomposition, architecture, assignment, cost
control, integration, durable state, and final completion judgment with the
lead. Keep delegation one layer deep and return every subagent result to the
lead.

Include an explicit no-delegation boundary in every assignment: remain within
the assigned role and do not create agents or delegate work.

When a goal or mission workflow is active, let it decide whether delegation is
justified and let it own concurrency, session budgets, validation cadence, and
completion criteria. Pass compact assignments rather than the full goal
template, mission history, adapter, or lane reference.

## Route Deliberately

Use a scout for substantial, objectively checkable retrieval that would
pollute the lead context or produce reusable evidence. Explore directly when
the relevant files are known, the task is small, or interpretation cannot be
separated from architectural judgment.

Route ordinary repository mapping and implementation reconnaissance through
the selected lane. Route investigation that reconciles contradictory evidence,
diagnoses an unknown cause across unfamiliar subsystems, shapes several
feature contracts, or requires consequential judgment about architecture,
security boundaries, production-data semantics, destructive migrations,
concurrency, or externally consumed contracts through native Codex Sol at high
effort.

Use a worker for one bounded implementation lane after the lead resolves the
contract and material design decisions. Route difficult or high-risk work
affecting security, migrations, concurrency, data integrity, schemas, or
public interfaces through native Codex Sol at high effort.

When Codex Efficient is selected, classify each scout and worker assignment as
`easy` or `hard` using its reference. Treat difficulty as a routing attribute,
not another role. Keep the existing native Codex, Grok, and Ollama mappings
unchanged when those policies are selected directly.

Default to one active writable worker in a workspace. Use parallel workers
only for independent write scopes permitted by the active goal workflow. Use
one implementation owner per feature or PR rather than competing solutions.

## Assign The Scout

State the questions blocking the next contract or implementation decision.
Give the scout the exact scope, primary sources, read-only and no-delegation
boundaries, required evidence, and stop condition.

Require observed facts with file, symbol, line, command, log, or source
references; relevant patterns and validation commands; inferences separated
from observations; contradictions and missing evidence; and a recommended
change surface labeled as a recommendation.

Treat the result as an evidence index. Have the lead verify claims that
materially determine scope, architecture, ownership, security, migrations, or
public behavior. Pass workers curated contracts and primary-source pointers,
not raw scout transcripts.

## Assign The Worker

Give the worker the bounded goal and repository scope, allowed change surface,
acceptance assertions, verified evidence, constraints and non-goals, applicable
repository instructions, required proof, delivery boundary, stop conditions,
and return shape.

Let the worker own implementation and tightly coupled tests. Require it to
stop before changing the contract, architecture, public API, schema, migration
behavior, or authorized scope. Require files changed, assertions addressed,
commands actually run, observed results, unrun checks, deviations, and risks.
Require it to keep the work in its own session and create no agents.

Keep test intent and independent verification with the lead. Use a separate
test-scoped worker only for high-risk behavior, a difficult regression
reproducer, or an explicit requirement of the active goal workflow; keep it
within the same worker budget.

## Validate At Coherent Boundaries

Use native Codex Sol at high effort for every formal validator. Treat OpenCode
self-checks as worker evidence, not independent review.

Spawn each formal validator with `fork_turns: "none"`, or the native equivalent
that excludes implementation history. Pass only its compact validation packet,
including the no-delegation boundary. If fresh context cannot be established,
report that independent validation is unavailable rather than claiming it.

Have the lead inspect every handoff, complete diff, repository state, focused
tests, and exact proof output. Follow the active goal workflow's validator
requirements and cadence. Without one, use one fresh validator after a
coherent non-trivial PR or milestone passes focused gates.

Have validators return findings without implementing fixes. Have the lead
verify and disposition findings, assign accepted fixes to a worker, and reuse
the same validator only for delta revalidation in the current review cycle.

## Invoke And Continue The Lane

Follow the selected reference for model verification, invocation, continuation,
and cleanup. Include the canonical role and selected lane in every assignment.
Record the native task identifier or OpenCode session ID needed to steer,
resume, wait for, or stop the assignment.

Use focused follow-ups with the same scout or worker while its scope and
evidence remain current. Start validation in a fresh native Codex session. If
two focused follow-up rounds fail to converge, stop delegating and finish or
re-scope the work in the lead.

For Codex Efficient, apply its evidence-based promotion before this generic
cutoff. Treat the handoff from an easy Grok assignment to Sol-high as a lane
escalation rather than a follow-up round, then apply the cutoff to the active
Sol-high assignment.

## Clean Up Interrupted Runs

Follow the selected reference's cleanup procedure only when a run hangs or is
interrupted. Stop only the session or process created for the assignment and
preserve its last useful evidence before replacing or closing it.
