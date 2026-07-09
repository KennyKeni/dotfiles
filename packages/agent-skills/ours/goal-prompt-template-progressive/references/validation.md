# Validation and Completion

Read this file when a PR or milestone is coherent and before declaring
completion.

## Review Coherent Boundaries

Use the PR as the normal code-review unit.

Before independent validation, require the implementation owner to inspect the
complete diff, compare it with the feature contract, run focused checks,
resolve known failures, and report uncertainty.

Run one fresh validator after a non-trivial PR or milestone is coherent and its
focused gates pass. Do not run a full review after every WIP commit.

Use an intermediate checkpoint only before:

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
independent from their requested fixes.

After fixes, revalidate the changed delta and affected assertions. Repeat a
full review only when scope, architecture, or integration behavior materially
changed.

Do not continue review loops for unsupported findings, stylistic disagreement,
or accepted behavior.

At stage completion, run integration and regression validation across the
stage's PRs. Do not line-by-line re-review every accepted PR.

## Determine Completion

Mark a direct change locally complete when its compact acceptance contract is
satisfied, focused validation passes, and material findings are resolved or
accepted by the user or designated project owner.

Mark a feature locally complete only when its contract is satisfied, required
evidence exists, and material findings are resolved or accepted by the user or
designated project owner.

Mark a stage complete only when all assertions in its denominator pass,
integration and regression evidence exists, every evidenced gap has a
disposition, and no required work is silently omitted.

Revalidate only assertions materially affected by later changes. Do not
re-prove unrelated completed work.

Do not report completion from isolated tests, implementation claims, or
assumptions. Do not expand accepted work after its contract is satisfied
unless new evidence or user direction changes scope.

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

Prefer assertion counts and explicit states such as not started, in progress,
proven, blocked, or unproven.

Report a percentage only when a stable numerator and denominator exist and the
user or project requires it. Name both and identify the evidence that changed
them. Do not carry an old percentage forward without re-deriving it.
