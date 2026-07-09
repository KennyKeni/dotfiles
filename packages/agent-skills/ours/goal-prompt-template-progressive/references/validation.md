# Validation and Completion

Read this file when a PR or milestone is coherent and before declaring
completion.

## Contents

- Review coherent boundaries
- Determine completion
- Report progress

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
  effect, documented intentional behavior, duplicate findings, or unrelated
  pre-existing scope.

Allow the lead to dismiss unsupported or non-blocking findings. Require the
user or designated project owner to waive a validated blocker or material
accepted risk. A validator finding does not amend the contract, create new
scope, or automatically trigger implementation or another review.

Assign material fixes to an implementation owner while keeping validators
independent from their requested fixes.

After fixes, revalidate only the changed delta and affected assertions. Scope
the delta validator to the requested fixes and their observable fallout. Do
not launch another full review merely because a correction was made. Repeat a
full review only when scope, architecture, security boundaries, schema, or
integration behavior materially changed.

Do not let a validator request another validator or reopen the complete review
cycle. A new finding during delta revalidation may block only when the delta
caused it and it satisfies the blocking criteria above; otherwise disposition
it separately. Once targeted revalidation passes and any already-required full
gate passes, close the review cycle.

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
