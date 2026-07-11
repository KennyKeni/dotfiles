# Mission Setup

Read this file after selecting mission execution and before decomposition.

## Contents

- Establish current state
- Maintain durable state
- Adopt approved issue decomposition
- Define correctness before decomposition
- Shape features and PRs
- Handle gaps and scope changes

## Establish Current State

Derive state from user-approved scope, repository instructions, active issues
and PRs, project plans, current Git state, tests, CI, deployments, logs, runtime
behavior, and existing progress or decision artifacts.

Use project-defined stages when they exist. Do not invent stages solely to fit
the template.

When a mission has no project-defined stages or milestones, use its validation
contract as the completion denominator and define stable milestones from
coherent feature or PR integration boundaries. Record those boundaries during
setup and change them only when approved scope or evidence changes.

Treat governing instructions and approved decisions as normative intent,
current Git, test, CI, and runtime evidence as observed state, and progress or
handoff documents as refreshable snapshots. Never let a stale snapshot override
current evidence. Resolve normative conflicts by instruction priority and then
the latest specific approved decision. Ask the user or designated owner when a
coequal conflict would change scope, acceptance, ownership, or material risk.

## Maintain Durable State

Select one canonical authorized writable durable state artifact. Reuse an
active issue only when ongoing issue updates are already authorized; technical
write access alone is insufficient. Treat other external sources as read-only
and reference them from the writable state artifact.

When no authorized writable project location exists, use a concise local,
uncommitted state file in a repository-approved ignored location. Do not add
permanent documentation merely to support the run.

When tracker-native relationships define mission membership or dependencies,
treat that topology as authoritative and keep the local artifact as a
refreshable execution snapshot. When no authorized tracker topology exists,
the local artifact may own the graph; record that authority explicitly. Do not
merge a cached tracker graph with a separate local canonical graph.

For a local graph, keep membership hierarchy distinct from prerequisite edges,
record the nodes and edges in the canonical local artifact, detect dependency
cycles, and derive readiness from current node and blocker evidence rather than
persisting it as durable truth. Refresh a selected node and its blockers
immediately before dispatch.

Immediately before starting implementation of a tracker issue, refresh its
labels. An unlocked issue may be selected normally. If
`implementation-locked` is present, continue only when the active mission
already owns that implementation; otherwise do not start it. When issue-label
mutations are already authorized, claim an unlocked issue by applying
`implementation-locked` and reading it back before dispatch. Remove and read
back an owned lock when implementation is complete or deliberately relinquished.
Never remove another owner's active lock. The label is issue-local; do not
propagate it through tracker relationships.

Keep a current-state snapshot rather than an activity diary. Record:

- goal and non-goals;
- active stage, feature, issue, PR, and Git reference;
- active validation profile;
- validation contract or links to it;
- constraining decisions;
- completed work with accepted evidence;
- agent ownership and integration boundaries;
- owned implementation locks;
- blockers, risks, unresolved questions, and exact next action.

Update it after contract approval, a material decision, feature or PR
completion, validation, stage transition, handoff, or proof supersession. Do
not update it after every turn.

## Adopt Approved Issue Decomposition

When `.local/agents/issue-tracker.md` and `.local/agents/issue-contract.md`
exist, read them before interpreting tracker state. Use their configured
relationship authority and canonical issue contract.

When an approved tracking umbrella and executable leaves already exist, adopt
that graph as the baseline decomposition. Treat the umbrella as
non-dispatchable. Map complete leaf contracts and acceptance criteria to the
mission validation assertions instead of independently reslicing the work.
Reshape the graph only for evidenced gaps and only within the authorized issue
and relationship mutation boundary.

Issue labels, contracts, relationships, and assignment establish no execution
or delivery authority. Record the independently approved boundary for local
edits, branches or worktrees, commits, pushes, pull or merge requests, merges,
deployments, issue updates, and relationship mutations.

## Define Correctness Before Decomposition

Define a finite validation contract for the active mission or stage. Include:

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

Record `quality-first` as the validation profile unless the invocation
explicitly selects `balanced`. Do not downgrade the profile automatically to
save time, cost, or agent capacity.

Give assertions stable identifiers when several features or validators must
refer to them.

Define correctness independently of implementation. Do not weaken the contract
to match code that has already been written.

## Shape Features and PRs

When no approved decomposition exists, decompose work into coherent vertical
features that produce independently verifiable progress. When one exists,
shape only the evidenced gaps permitted above.

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

At mission setup, record in durable state the authorized issue tracker,
umbrella issue when one exists, whether tracker relationships define mission
topology, and which issue and relationship mutations the lead may perform.

For each evidenced gap, have the lead check for duplicates and choose a
disposition. Subagents may propose new issues; only the lead publishes them.

When authorized, create a tracker-native sub-issue when the work directly
contributes to the umbrella goal, completion denominator, or delivery boundary.
Create an independent issue when it is out of scope, cross-cutting, reusable,
or has a different owner or lifecycle. Link related independent issues without
adding them to the umbrella denominator.

When publication is unauthorized, report a ready-to-file proposal. Include
evidence, scope and non-scope, acceptance criteria, ownership, dependencies,
and blocker-or-follow-up status.

When implementation fails an assertion, mark the implementation and affected
stage failed. When evidence shows that an assertion itself is invalid or
outdated, propose a contract amendment with rationale; require approval from
the user or designated project owner before changing the assertion or
denominator.

When a discovery is new scope outside the original contract, record it
separately without silently changing the original denominator.

Do not force every observation into a new issue. Use duplicate links,
non-actionable notes, or explicit non-gap dispositions when appropriate.
