# GitHub Mission Graph

Read this file when an authorized mission uses a GitHub umbrella issue and
native issue relationships. Keep GitHub-specific topology out of missions that
use another tracker or local-only state.

## Separate Hierarchy From Dependencies

Within the mission dependency model, treat native GitHub relationships as
authoritative for issue topology. Use parent and sub-issue relationships for
mission membership and decomposition. Use `blocked by` and `blocking`
relationships only for real prerequisite edges. Never infer a dependency from
hierarchy, sub-issue order, labels, milestones, or proximity. Allow a related
external blocker to remain outside the umbrella hierarchy.

Do not interpret this topology boundary as a restriction on issue content.
When issue updates are authorized, continue recording shared goals, scope,
validation contracts and profiles, decisions, progress, blockers, evidence,
dispositions, and collaborator-facing next steps on the relevant umbrella and
feature issues.

Keep validation contracts, completion evidence, runtime agent and workspace
ownership, authorization, PR and CI state, deployment gates, and the exact next
action in their designated authoritative sources, which may include GitHub
issues and PRs. Do not persist or mirror GitHub relationship edges in local
durable state. Treat transient query results and derived readiness as
disposable observations, not dispatch authority.

## Refresh And Derive Readiness

At setup and resumption, recursively refresh the umbrella descendants,
candidate issue states and state reasons, and reachable dependency edges.
Traverse every page and reconcile relationship totals when the source exposes
them. Detect cycles among open dependency edges without treating hierarchy as
a dependency edge. Derive the ready frontier from current evidence; do not
store `ready` as durable truth.

Immediately before dispatch, reread the selected issue and its blockers. Treat
it as dispatchable only when it is open, in authorized scope, executable rather
than an aggregate parent, contract-shaped, not already owned or active, and has
no open native blocker. Confirm that every closed blocker was completed in a
way compatible with the dependent contract. For a duplicate, follow its
canonical issue and verify that outcome; do not treat `not planned` or another
unresolved disposition as satisfied without an approved contract change. Also
require every approval, integration, workspace, PR, review, CI, deployment,
and human gate that applies before work may start.

## Mutate Relationships Safely

Record the authorized GitHub host and repository scope and separate
authorization for creating issues; adding, removing, or reparenting sub-issues;
adding or removing dependency edges; closing or reopening issues; and making
other issue updates. Technical permission never substitutes for workflow
authorization. After each authorized relationship mutation, read it back,
recheck affected dependency cycles, and rederive affected readiness.

Prefer the configured GitHub connector when it supports the required operation.
For CLI use, require GitHub CLI 2.94 or newer for direct hierarchy and
dependency flags and JSON fields; otherwise use supported REST or GraphQL
operations through `gh api`. Verify the active `mise`-managed version and
capability before assuming an interface is available.

Do not add a custom graph CLI or mandate a JSON schema until repeated traversal,
pagination, cycle, or reconciliation failures demonstrate the need. When an
existing GitHub topology is authoritative but relationship writes are
unauthorized, keep it read-only and propose changes instead of creating a
competing local graph. Use a local graph authority only when no tracker topology
has been designated authoritative.
