---
name: sidekick
description: Pair the current Codex lead with one persistent sidekick for coding work while the lead retains judgment and final review.
---

# Sidekick

Run one persistent two-agent pair. Keep the current user-facing session as the
main agent and final judge. Delegate by default up to the judgment boundary.

## Select The Setup

Use an explicitly requested setup when the skill lists it. Otherwise use Luna
Max. Before spawning the sidekick, read the selected setup completely:

- Luna Max: read [luna-max.md](references/luna-max.md).

Treat the setup reference as the single source of truth for model, reasoning
effort, agent type, native control mechanics, and setup failure recovery. Keep
the generic delegation lifecycle in this file. Report an unknown or unavailable
requested setup rather than substituting another configuration.

## Work At The Judgment Boundary

Keep planning, interpretation of ambiguity, architecture, product intent,
material design decisions, ownership changes, final review, and completion
judgment with the main agent.

Give the sidekick the largest immediately safe unit of execution. Favor code
exploration, evidence gathering, implementation with a resolved contract,
mechanical changes, tests, slow verification, lint repair, and focused fixes.
Difficulty alone does not determine ownership: hard mechanical work belongs
with the sidekick, while work whose deliverable is judgment belongs with the
main agent.

The main agent may implement directly when judgment is concentrated in the
code or direct action is the smallest coherent move. Keep useful independent
execution with the sidekick, such as gathering evidence or running verification.

## Start One Persistent Sidekick

Spawn the selected setup once near the start of the task. Give it a compact
assignment containing:

- the user's outcome and the repository scope;
- applicable repository instructions and verified facts;
- the current contract, constraints, and non-goals;
- the largest safe first assignment;
- explicit file or module ownership for every writable assignment;
- required proof and the expected return shape; and
- boundaries that return decisions to the main agent.

Reconstruct the minimum task context in the assignment. Require the sidekick to
remain one layer deep and create no agents. Tell it that other work may already
exist in the shared workspace, to preserve changes it does not own, and to
accommodate concurrent edits rather than revert them. Repeat these ownership
safeguards in every writable follow-up.
Choose the first assignment by current need: assign exploration when the main
agent needs evidence, and assign implementation immediately when intent and the
contract are already clear.

This step is complete when the configured sidekick is active with a bounded,
useful assignment and the main agent knows which decisions remain its own.

## Route Responsibility During The Task

Treat ownership as dynamic while retaining the same sidekick session. The main
agent should take minimal actions, read only what it needs for decisions, and
delegate and monitor by default.

Classify sidekick events before acting:

- For a focused question within the active contract, answer through a message
  and continue observing the unfinished assignment.
- For an intermediate status or evidence update, record what matters and
  continue observing without issuing new work.
- For evidence that invalidates the contract, scope, or judgment boundary,
  stop the active assignment according to the selected setup and reclaim the
  decision in the main agent.

Only after a final return:

1. Check whether its evidence preserves the contract and user intent.
2. Resolve questions that cross the judgment boundary.
3. Send the next bounded execution unit to the same sidekick session.
4. Reclaim work when preserving intent or proving correctness now requires
   main-agent judgment.

Let the sidekick continue within the current contract when it merely needs a
focused answer. Have it stop and return evidence when the contract, authorized
scope, or material design changes; when an ambiguity affects user-visible
behavior; or when it cannot produce acceptance-aligned proof. The main agent
then decides, reshapes, implements, or returns a focused assignment to the same
sidekick.

Keep one writable owner for overlapping files at a time. Continue main-agent
work only when it is independent of the sidekick's active write scope.

This step is complete when every remaining task unit has an explicit owner and
all material judgment has returned to the main agent.

## Review And Converge

Require each implementation handoff to identify files changed, assertions
addressed, commands run, observed results, unrun checks, deviations, and risks.

Have the main agent inspect the complete diff, repository state, and proof. Run
only the additional checks needed to judge acceptance. Return bounded
corrections to the same sidekick while its context remains current; handle a
judgment-heavy correction in the main agent and use the sidekick for associated
mechanical work or verification.

Treat one correction handoff followed by main-agent review as one correction
round. After two rounds, have the main agent reclaim or reshape the remaining
work. A further round requires an explicit main-agent decision naming the
unresolved blocker and why the retained sidekick context is still the best way
to resolve it.

Before final inspection, confirm the recorded sidekick has returned and has no
active write assignment. Then inspect the final repository state and proof.
Complete the task only when the main agent accepts the implementation against
the user outcome, no unresolved blocker remains, and the final response reports
the actual verification performed.
