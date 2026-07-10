---
name: codex-native-subagents
description: Route bounded scout, worker, and validator assignments from a Codex lead through pinned Codex-native GPT-5.6 Sol model and reasoning profiles. Use when the user invokes $codex-native-subagents, requests Codex-only subagent model routing, or asks to combine native Codex delegation with the goal prompt template. Do not use for OpenCode or non-Codex delegation.
---

# Codex Native Subagents

Use this skill only from the user-facing, goal-owning Codex session. Keep that
session as the `lead`. If a scout, worker, or validator encounters this skill,
have it remain within its assignment and return to the lead without delegating.

Use the native profiles installed under `~/.codex/agents/`. If a required
profile or model is unavailable, keep the work in the lead or report the
limitation. Do not silently substitute the default agent or another model.

## Preserve The Role Model

Use only `lead`, `scout`, `worker`, and `validator` as software-work roles.
Treat `scout-high` and `worker-high` as model profiles for the `scout` and
`worker` roles, not additional roles.

Keep requirements, contracts, decomposition, architecture, assignment,
integration, cost control, and final completion judgment with the lead. Do not
spawn a lead profile.

When a goal or mission workflow is active, let it decide whether delegation is
justified and let it own assignment packets, concurrency, agent-session
budgets, validation cadence, and completion criteria. This skill only selects
the native execution profile for an already-justified assignment.

## Select The Profile

Use these defaults:

- `scout`: GPT-5.6 Sol at medium effort for bounded read-only exploration;
- `scout-high`: GPT-5.6 Sol at high effort for architecturally consequential
  investigation;
- `worker`: GPT-5.6 Sol at medium effort for normal bounded implementation;
- `worker-high`: GPT-5.6 Sol at high effort for difficult or high-risk bounded
  implementation;
- `validator`: GPT-5.6 Sol at high effort for fresh independent validation.

Retain the current lead model and effort. Prefer GPT-5.6 Sol at xhigh effort
for a long-horizon mission lead, but do not change the parent session silently.

Use `scout-high` when the evidence must reconcile contradictory sources,
diagnose an unknown cause across unfamiliar subsystems, shape several feature
contracts, or inform architecture, security, schema, migration, concurrency,
or public-interface decisions. The assignment remains read-only evidence
gathering; the lead makes every decision.

Use `worker-high` only after the lead has resolved the contract and material
design decisions. Select it when the bounded implementation still requires
complex cross-cutting reasoning or affects security, migrations, concurrency,
data integrity, schemas, or public interfaces. Keep unresolved decisions in
the lead instead of delegating ambiguity.

Do not push a lower-capability profile to extreme reasoning. Escalate from the
medium Sol profile to its high Sol counterpart when measured task difficulty
justifies it. Do not use max or xhigh for delegated roles by default.

## Build The Assignment

Use the active goal workflow's complete assignment packet when available.
Otherwise include:

- canonical role and one-sentence objective;
- bounded deliverable, scope, and non-scope;
- active Git reference and issue or PR when relevant;
- authoritative project sources and repository instructions;
- relevant contract assertions, decisions, and ownership constraints;
- allowed mutations, tools, external actions, and workspace boundary;
- required checks, evidence, output format, stop condition, and escalation
  triggers.

Pass the applicable rules and primary-source pointers, not the entire mission
history or raw scout transcript. Identify the canonical role explicitly even
when using a high profile.

## Route And Integrate Deliberately

Skip a scout when the lead knows the relevant surface or a bounded worker can
inspect it without polluting the lead context. Use one scout profile for the
active investigation; do not run medium and high scouts in parallel.

Give each worker one bounded feature or PR and its tightly coupled tests. Do
not run competing implementations. Never run concurrent mutating workers in
the same workspace.

Have scouts return observed facts with file, symbol, line, command, log, or
source references; separate inferences; identify contradictions; and label any
recommended change surface as a recommendation. Have the lead verify claims
that materially determine scope or design before assigning implementation.

Have workers return changed files, assertions addressed, commands actually
run, observed results, unrun checks, contract deviations, and remaining risks.
Require them to stop before changing the contract, architecture, public API,
schema, migration behavior, or authorized scope.

Use one fresh validator after a coherent non-trivial PR or milestone passes
focused gates. Do not validate every WIP revision. Keep validators read-only
and independent; have the lead disposition findings and assign accepted fixes.
Reuse the same validator only for delta revalidation in the current cycle.

If a medium-profile assignment fails because its reasoning was insufficient,
first correct any packet or evidence defect, then retry the unresolved scope
once with the corresponding high profile. Do not add parallel agents to mask
an unclear contract.
