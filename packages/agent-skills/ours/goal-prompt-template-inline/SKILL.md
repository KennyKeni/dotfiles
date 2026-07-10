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

When a mission has no project-defined stages or milestones, use its validation
contract as the completion denominator and define stable milestones from
coherent feature or PR integration boundaries. Record those boundaries during
setup and do not move them merely to reset budgets.

Treat governing instructions and approved decisions as normative intent,
current Git, test, CI, and runtime evidence as observed state, and progress or
handoff documents as refreshable snapshots. Never let a stale snapshot override
current evidence. Resolve normative conflicts by instruction priority and then
the latest specific approved decision. Ask the user or designated owner when a
coequal conflict would change scope, acceptance, ownership, or material risk.

Do not start a blocked, deferred, gated, or unapproved work item. Continue
independent authorized work when safe.

## Maintain Durable State

Select one canonical authorized writable durable state artifact for mission
execution. Reuse an active issue only when ongoing issue updates are already
authorized; technical write access alone is insufficient. Treat other external
sources as read-only and reference them from the writable state artifact.

When no authorized writable project location exists, use a concise local,
uncommitted state file in a repository-approved ignored location. Do not add
permanent project documentation merely to support the agent run.

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
- local acceptance assertions and evidence required for local completion;
- external delivery gates such as CI, review, deployment, or human approval;
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

## Build Assignment Packets

Before every new scout, worker, or validator, build a concise assignment packet
and include it directly in the spawn request. Do not rely on the subagent to
infer mission state from conversation history or discover its assignment from
the durable state artifact.

Include:

- role and one-sentence objective;
- bounded deliverable, scope, and non-scope;
- active stage, feature, issue, PR, and Git reference when relevant;
- authoritative project sources and repository instructions to inspect;
- relevant contract assertions, decisions, and ownership constraints;
- allowed mutations, tools, external actions, and workspace boundary;
- required checks and evidence;
- output format;
- stop condition and escalation triggers.

Add role-specific material:

- **Scout:** blocking questions, read-only boundary, and the required
  observation-versus-inference evidence format.
- **Worker:** feature contract, implementation ownership, validation
  assertions, primary-source pointers, and required tests.
- **Validator:** full-review or delta scope, coherent change, contract,
  relevant doctrine sources, existing validation evidence, and the finding
  admissibility and disposition rubric. Exclude intended findings and the
  implementation trajectory.

Pass applicable rules in the packet rather than entire orchestration template
references, raw scout transcripts, or durable-state history. Point to primary
project artifacts instead. For a focused follow-up, send only changed packet
fields, new evidence, and the unresolved deliverable.

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
- assign at most one implementation owner per feature or PR;
- use one validator for a normal non-trivial PR or milestone;
- use a second validator only for high-risk work;
- require user approval before exceeding these limits.

Never run concurrent mutating workers in the same workspace. Require isolated
worktrees or workspaces for them; otherwise serialize their assignments.

Do not spawn an agent merely to decide whether to spawn agents.

Do not run competing implementations or pass-at-k sampling unless the decision
is unusually consequential and the additional cost is authorized.

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

Use a lead-owned intermediate decision checkpoint, not a completed-change code
validator, only before:

- a hard-to-reverse architecture, API, schema, security, or migration decision;
- repeating the first vertical slice across a broad surface;
- continuing through concrete implementation uncertainty;
- integrating work whose assumptions materially changed.

Record the proposed decision, alternatives, contract and ownership constraints,
supporting evidence, reversibility or rollback, affected assertions, and any
required approver. Pass the checkpoint when the lead confirms consistency with
the contract and project doctrine and every required owner approves it. Use a
scout only to gather missing evidence; keep the decision with the lead.

Treat authentication and authorization, security boundaries, data migrations,
public API or schema compatibility, concurrency, irreversible operations, and
large cross-cutting diffs as high-risk.

For every high-risk change, including direct execution, run a fresh validator
after implementation and focused gates pass. When the agent-session budget
permits it, separate implementation scrutiny from black-box or integration
validation.

Require validators to distinguish contract failures, probable defects, risks
requiring investigation, optional improvements, and unsupported preferences.

Before a finding can block delivery, require it to satisfy all of these
conditions:

- state an observable impact on the validation contract, correctness,
  security, data integrity, or required proof;
- cite the specifically affected code path or behavior and supporting
  evidence;
- concern behavior introduced or exposed by the current change, unless the
  contract explicitly includes pre-existing remediation;
- rely on verified project facts rather than unstated assumptions or
  speculative reachability;
- account for documented intent, ownership rules, and accepted project
  doctrine;
- be discrete, actionable, and proportionate to the repository's existing
  rigor.

Have the lead, not the validator, classify each finding:

- **Block delivery:** an admissible contract failure, observable correctness
  or security defect, data loss risk, weakened required hard-fail, missing
  acceptance criterion, or test that does not prove required behavior.
- **Fix if cheap, otherwise follow up:** a verified ownership or
  maintainability problem without an observable contract failure.
- **Do not block:** style, minor optimization, monolith size, generalized
  architecture preference, speculative call reachability without observable
  effect, documented intentional behavior that does not violate the active
  contract or correctness and security requirements, duplicate findings, or
  unrelated pre-existing scope.

Allow the lead to dismiss unsupported or non-blocking findings. Require the
user or designated project owner to waive a validated blocker or material
accepted risk. A validator finding does not amend the contract, create new
scope, or automatically trigger implementation or another review.

For completion purposes, a recorded follow-up disposition resolves a verified
non-blocking finding. Create an external issue only when authorized.

Assign material fixes to an implementation owner while keeping validators
independent from the fixes they requested.

After fixes, revalidate only the changed delta and affected assertions. Scope
the delta validator to the requested fixes and their observable fallout. Do
not launch another full review merely because a correction was made. Repeat a
full review only when scope, architecture, security boundaries, schema, or
integration behavior materially changed.

Do not let a validator request another validator or reopen the complete review
cycle. A new finding during delta revalidation may block when it satisfies the
criteria above and concerns behavior introduced or exposed by the original
reviewed change or its fix delta. Reopen only affected assertions; disposition
unrelated findings separately. Once targeted revalidation passes, admissible
blockers are resolved or accepted, and any already-required full gate passes,
close the review cycle.

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

1. For mission execution, read the canonical durable state artifact. For direct
   execution, rederive the compact acceptance contract from the user request
   and authoritative project artifacts, then inspect the current diff and
   latest validation evidence.
2. Verify the active Git reference and, when applicable, issue, PR, and CI state.
3. Inspect only the primary artifacts required for the next action.
4. Reuse still-valid scout evidence and feature contracts.
5. Refresh stale facts before acting.

If direct execution is likely to cross another continuation boundary, create a
lightweight local checkpoint or escalate it to mission execution.

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

Mark a direct change locally complete when its local acceptance assertions pass,
focused validation passes, and material findings are resolved or accepted by
the user or designated project owner.

Mark a feature locally complete only when its local acceptance assertions pass,
required evidence exists, and material findings are resolved or accepted by the
user or designated project owner.

Mark a stage locally complete only when all local validation assertions in its
denominator pass, integration and regression evidence exists, every evidenced
gap has a disposition, and no required work is silently omitted.

Mark a mission locally complete only when every required local stage or feature
assertion passes, cross-feature integration and regression evidence exists, and
every evidenced gap has a disposition. When no stages exist, use the mission
contract itself as the denominator.

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
