# Mission Setup

Read this file after selecting mission execution and before decomposition.

## Contents

- Establish current state
- Maintain durable state
- Define correctness before decomposition
- Shape features and PRs
- Handle gaps and scope changes

## Establish Current State

Derive state from user-approved scope, repository instructions, active issues
and PRs, project plans, current Git state, tests, CI, deployments, logs, runtime
behavior, and existing progress or decision artifacts.

Use project-defined stages when they exist. Do not invent stages solely to fit
the template.

If authoritative sources disagree in a way that changes the next action,
surface and resolve the conflict. Otherwise, make the smallest safe assumption
and record it.

## Maintain Durable State

Select one canonical writable durable state artifact. Reuse an existing
writable project progress document, active issue, or handoff artifact when
possible. If an authoritative source is read-only, reference it from the
writable artifact rather than treating it as the update target.

When no location exists, use a concise local, uncommitted state file in a
repository-approved ignored location. Do not add permanent documentation
merely to support the run.

Keep a current-state snapshot rather than an activity diary. Record:

- goal and non-goals;
- active stage, feature, issue, PR, and Git reference;
- validation contract or links to it;
- constraining decisions;
- completed work with accepted evidence;
- agent ownership and integration boundaries;
- current and remaining agent-session budget;
- blockers, risks, unresolved questions, and exact next action.

Update it after contract approval, a material decision, feature or PR
completion, validation, stage transition, handoff, or proof supersession. Do
not update it after every turn.

## Define Correctness Before Decomposition

Define a finite validation contract for the active mission or stage. Include:

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

Define correctness independently of implementation. Do not weaken the contract
to match code that has already been written.

## Shape Features and PRs

Decompose work into coherent vertical features that produce independently
verifiable progress.

For each feature, state:

- owning stage, issue, and validation assertions;
- intended outcome and non-scope;
- verified source context;
- expected files, interfaces, schemas, or behavior;
- dependency and integration boundaries;
- required tests, evidence, PR, and review gates;
- known risks and escalation conditions.

Prefer one implementation owner per feature or PR.

Serialize work with evolving shared architecture, overlapping files, mutable
external state, or sequential reasoning. Parallelize only disjoint ownership
and integration boundaries.

Confirm that cross-cutting work belongs at the shared or platform layer and
domain-specific work remains with the appropriate owner.

## Handle Gaps and Scope Changes

Record newly discovered gaps with evidence and disposition.

Create or update GitHub issues only when the user or established project
workflow authorizes it. Otherwise, report the proposed issue.

When implementation fails an assertion, mark the implementation and affected
stage failed. When evidence shows that an assertion itself is invalid or
outdated, propose a contract amendment with rationale; require approval from
the user or designated project owner before changing the assertion or
denominator.

When a discovery is new scope outside the original contract, record it
separately without silently changing the original denominator.

Do not force every observation into a new issue. Use duplicate links,
non-actionable notes, or explicit non-gap dispositions when appropriate.
