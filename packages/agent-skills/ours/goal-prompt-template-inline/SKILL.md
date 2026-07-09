---
name: goal-prompt-template-inline
description: Run explicitly invoked long-horizon software projects through a validation-first, compaction-resilient workflow with durable state, bounded scout, worker, and validator delegation, issue and PR boundaries, and evidence-based completion. Use only when the user explicitly invokes $goal-prompt-template-inline or asks to apply the inline goal prompt template.
---

# Goal Prompt Template Inline

Apply this workflow only when explicitly invoked. Treat invocation text as the
project goal, scope, constraints, and initial context.

Own delivery of the outcome. Optimize for accepted code quality per unit of
coordination, not agent activity, branch count, issue count, or apparent
progress.

Follow repository instructions, project decisions, ownership boundaries, and
the authorized issue and Git workflow.

## Choose the Execution Mode

Use direct execution for one bounded change with a known implementation
surface. Keep the lead responsible for implementation and validation, and do
not create agents whose handoff cost exceeds their value.

For direct execution, inspect the authoritative artifacts needed for the
change, define a compact acceptance contract, implement, run focused
validation, and apply the direct-change completion rule below.

Use mission execution for work spanning multiple substantial features, PRs,
completion stages, or broad discovery surfaces.

Start directly when uncertain. Escalate only after concrete independent work
emerges.

## Establish Current State

Derive current state from authoritative project artifacts:

- user instructions and approved scope;
- repository and contributor instructions;
- active issues, PRs, and project plans;
- current Git state and relevant diffs;
- tests, CI, builds, deployments, logs, and runtime behavior;
- existing progress, decision, or handoff documents.

Use project-defined stages when they exist. Do not invent stages solely to fit
this template.

If authoritative sources disagree in a way that changes the next action,
surface the conflict and resolve it before implementation. Otherwise, make the
smallest safe assumption and record it.

Do not start a blocked, deferred, gated, or unapproved work item. Continue
independent authorized work when safe.

## Maintain Durable State

Select one canonical writable durable state artifact for mission execution.
Reuse an existing writable project progress document, active issue, or handoff
artifact when possible. If an authoritative source is read-only, reference it
from the writable state artifact rather than treating it as the update target.

When no project location exists, use a concise local, uncommitted state file in
a repository-approved ignored location. Do not add permanent project
documentation merely to support the agent run.

Keep the artifact as a current-state snapshot, not an activity diary. Record:

- goal and non-goals;
- active stage, feature, issue, PR, and Git reference;
- validation contract or links to it;
- decisions that constrain later work;
- completed work with accepted evidence;
- current agent ownership and integration boundaries;
- current and remaining agent-session budget;
- blockers, risks, and unresolved questions;
- exact next action.

Update durable state after validation-contract approval, a material decision,
feature or PR completion, validation, a stage transition, handoff, or proof
supersession. Do not update it after every turn.

## Define Correctness Before Decomposition

Before shaping mission implementation, define a finite validation contract for
the active mission or stage. For direct execution, use a compact acceptance
contract.

Include:

- intended observable outcome;
- scope and non-scope;
- compatibility and ownership constraints;
- required interface, schema, data model, or behavioral properties;
- testable assertions defining completion;
- required evidence for each assertion;
- required local, CI, review, deployment, or human gates;
- the authorized delivery boundary, such as local edits, commits, push, PR,
  merge, or issue updates.

Give assertions stable identifiers when several features or validators must
refer to them.

Define correctness independently of the eventual implementation. Do not weaken
the contract to match code that has already been written.

## Shape Features and PRs

Decompose mission work into coherent vertical features that produce
independently verifiable progress.

For each feature, state:

- owning stage, issue, and validation assertions;
- intended outcome and non-scope;
- verified source context;
- expected files, interfaces, schemas, or behavior;
- dependency and integration boundaries;
- required tests and evidence;
- PR and review requirements;
- known risks and escalation conditions.

Prefer one implementation owner per feature or PR.

Serialize work when features share evolving architecture, overlapping files,
mutable external state, or sequential reasoning. Parallelize only when
ownership and integration boundaries are genuinely disjoint.

Confirm that cross-cutting work belongs at the shared or platform layer and
domain-specific work remains with the appropriate owner.

## Separate Agent Roles

Treat the current agent as the lead and never delegate the lead role.

Have the lead own requirements, validation contracts, decomposition,
architecture, assignment, cost control, integration, durable state, and final
completion judgment. Allow the lead to implement changes directly when
delegation would add more cost than value.

Have a scout perform bounded, read-only retrieval. Do not let a scout modify
files, create external state, choose architecture, approve scope, or create
agents.

Give each worker one bounded feature or PR. Have the worker implement, test,
self-review, and return evidence. Do not let a worker declare the mission or
stage complete or create agents.

Give each validator fresh context and a completed, coherent change to
evaluate. Have validators report findings without implementing fixes or
creating agents.

Keep delegation centralized through the lead. Do not use peer-to-peer agent
coordination.

## Delegate Exploration Deliberately

Before exploration, state the specific questions blocking implementation.

Use a scout when exploration spans unfamiliar subsystems, requires substantial
retrieval, would pollute the lead context, produces checkable evidence, or will
be reused.

Explore directly when the relevant files are known, the task is small, or
interpretation cannot be separated from architectural judgment.

When model routing is available, use the least expensive model that can
reliably follow the evidence format. Do not use a cheap model as the sole
source of architectural, security, migration, concurrency, or public-interface
decisions.

Use one scout for the active milestone and send focused follow-ups instead of
spawning repeated scouts. Replace it only when its context is stale or its
assigned surface materially changes.

Require the scout to return:

- observed facts with file, symbol, line, command, log, or source references;
- relevant patterns and validation commands;
- dependency and integration paths;
- inferences separated from observations;
- contradictions and unresolved questions;
- a recommended change surface labeled as a recommendation.

Treat scout output as an evidence index, not authoritative truth. Verify every
claim that materially determines scope, architecture, ownership, security,
migrations, or public behavior.

Convert verified findings into a compact feature contract. Pass the contract
and primary-source pointers to the worker, not the raw scout transcript.

## Control Delegation and Cost

Use these defaults unless the invocation supplies a different budget:

- allow at most two implementation workers concurrently;
- allow at most one active scout for the current milestone;
- prohibit nested delegation;
- prohibit peer-to-peer worker coordination;
- assign at most one implementation owner per feature or PR;
- use one validator for a normal non-trivial PR or milestone;
- use a second validator only for high-risk work;
- require user approval before exceeding these limits.

Do not spawn an agent merely to decide whether to spawn agents.

Do not run competing implementations or pass-at-k sampling unless the decision
is unusually consequential and the additional cost is authorized.

Before spawning an agent, define its deliverable, scope, allowed mutations,
evidence requirements, output format, and stop condition.

At mission setup, record an agent-session budget. Unless the invocation sets
another budget, allow at most four new agent sessions per milestone and twelve
per mission. Count every scout, worker, validator, and replacement against both
limits. Do not count focused follow-ups to an existing agent as new sessions.
Require user approval before exceeding either limit.

Reuse an existing scout or worker with a focused follow-up when its context
remains relevant. Use a new validator for each new PR or milestone. Reuse that
validator only for delta revalidation of the same review cycle.

Define fresh validator context as context independent of implementation,
containing the coherent change, contract, relevant primary sources, and
validation evidence but not the implementation trajectory.

Count scouts and validators as part of the execution budget.

## Execute Features

Give a worker the feature contract, relevant validation assertions, verified
evidence, primary-source pointers, relevant repository instructions, required
workspace boundary, and return format.

Require the worker to inspect referenced primary artifacts before editing.

Use a fresh branch or worktree only when the project workflow supports it and
the work is sufficiently independent to justify isolation. Follow the
repository's target branch and naming conventions rather than assuming main.

Require focused validation during implementation. Use test-first development
when behavior can be specified independently and repository practices support
it. Do not impose test-first sequencing mechanically on every edit.

Have the worker return:

- implemented changes or commit reference;
- tests and validation commands run;
- observed results;
- deviations from the feature contract;
- unresolved risks or assumptions;
- integration notes.

Have the lead integrate worker output. Do not create a separate integration
agent by default.

## Review and Validate at Coherent Boundaries

Use the PR as the normal code-review unit.

Before independent validation, require the implementation owner to inspect the
complete diff, compare it with the feature contract, run focused checks,
resolve known failures, and report remaining uncertainty.

Run one fresh validator after a non-trivial PR or milestone is coherent and its
focused gates pass. Do not run a full review after every WIP commit.

Use an intermediate validation checkpoint only before:

- a hard-to-reverse architecture, API, schema, security, or migration decision;
- repeating the first vertical slice across a broad surface;
- continuing through concrete implementation uncertainty;
- integrating work whose assumptions materially changed.

Treat authentication and authorization, security boundaries, data migrations,
public API or schema compatibility, concurrency, irreversible operations, and
large cross-cutting diffs as high-risk.

For high-risk work, separate implementation scrutiny from black-box or
integration validation when the agent-session budget permits it.

Require validators to distinguish contract failures, probable defects, risks
requiring investigation, optional improvements, and unsupported preferences.

Have the lead triage findings against the contract and project doctrine. Allow
the lead to dismiss unsupported, duplicate, stylistic, or out-of-scope
findings. Require the user or designated project owner to waive a validated
contract failure or material accepted risk.

Assign material fixes to an implementation owner while keeping validators
independent from the fixes they requested.

After fixes, revalidate the changed delta and affected assertions. Repeat a
full review only when scope, architecture, or integration behavior materially
changed.

Do not continue review loops for unsupported findings, stylistic disagreement,
or accepted behavior.

At stage completion, run integration and regression validation across the
stage's PRs. Do not line-by-line re-review every accepted PR.

## Handle Gaps and Scope Changes

Record newly discovered gaps with evidence and disposition.

Create or update GitHub issues only when the user or established project
workflow authorizes that external action. Otherwise, report the proposed issue.

When implementation fails an assertion, mark the implementation and affected
stage failed. When evidence shows that an assertion itself is invalid or
outdated, propose a contract amendment with rationale; require approval from
the user or designated project owner before changing the assertion or
denominator.

When a discovery is new scope outside the original contract, record it
separately without silently changing the original denominator.

Do not force every observation into a new issue. Use duplicate links,
non-actionable notes, or explicit non-gap dispositions when appropriate.

## Preserve Continuity Across Compaction

After compaction or resumption:

1. Read the canonical durable state artifact.
2. Verify the active Git reference, issue or PR state, and relevant CI state.
3. Inspect only the primary artifacts required for the recorded next action.
4. Reuse still-valid scout evidence and feature contracts.
5. Refresh stale facts before acting.

Do not re-explore the entire repository merely because compaction occurred.
Do not delegate solely to avoid compaction.

If repeated continuation cycles reconstruct context without producing a
verified artifact, checkpoint state and split the run at the next semantic
stage or PR boundary.

## Manage Git and External State Safely

Follow the repository's branch, worktree, commit, PR, merge, and issue
workflow. Keep authorized issues, PR descriptions, validation evidence, and
handoff notes current.

Record the authorized delivery boundary in the contract. Treat commit, push,
PR creation, merge, and issue mutations as separate actions requiring explicit
user authorization or an already-authorized project workflow. Do not infer
them from a general instruction to deliver.

Do not delete or clean pre-existing branches, worktrees, files, or artifacts
without confirmation. Clean only temporary resources created by this
execution after verifying they are no longer needed.

Do not merge until required CI, review, deployment, ownership, and human gates
have passed.

## Determine Completion

Mark a direct change locally complete when its compact acceptance contract is
satisfied, focused validation passes, and material findings are resolved or
accepted by the user or designated project owner.

Mark a feature locally complete only when its contract is satisfied, required
evidence exists, and material findings are resolved or accepted by the user or
designated project owner.

Mark a stage complete only when all validation assertions in its denominator
pass, integration and regression evidence exists, every evidenced gap has a
disposition, and no required work is silently omitted.

Revalidate only assertions materially affected by later changes. Do not
re-prove unrelated completed work.

Do not report completion from isolated tests, implementation claims, or
assumptions. Do not keep expanding accepted work after its contract is
satisfied unless new evidence or user direction changes scope.

Distinguish locally complete, ready for an external gate, and delivered. Do not
block local completion merely because an unauthorized or unavailable external
gate remains. Mark work delivered only when its authorized delivery boundary
is reached.

## Report Progress

At meaningful checkpoints, report the active stage, issue, feature, and PR;
completed work with evidence; remaining assertions; active ownership;
blockers, risks, decisions, and the next action.

Report whether the current result is locally complete, ready for an external
gate, or delivered.

Prefer assertion counts and explicit stage states such as not started, in
progress, proven, blocked, or unproven.

Report a percentage only when a stable numerator and denominator exist and the
user or project requires it. Name both and identify the evidence that changed
them. Do not carry an old percentage forward without re-deriving it.
