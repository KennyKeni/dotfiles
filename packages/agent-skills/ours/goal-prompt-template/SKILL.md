---
name: goal-prompt-template
description: Project execution prompt template for Codex to run a project as PM/EM with stage-based completion, evidence, GitHub issue contracts, PR workflow, and sprint progress reporting. Use only when the user explicitly invokes $goal-prompt-template or asks to apply this goal prompt template.
---

# Goal Prompt Template

Codex sessions only. This is an explicit prompt template skill; do not invoke it implicitly for ordinary project work.

## Input Handling

- Treat text supplied with the invocation as pre-execution input.
- Place the pre-execution input before the `Execution` section when constructing the working prompt.
- Preserve user-supplied pre-execution input unless it conflicts with higher-priority instructions.
- If no pre-execution input is supplied, use the `Execution` section by itself.
- Resolve conflicts by instruction priority: system and developer instructions first, then repository instructions, then explicit user instructions, then pre-execution input, then this template.

## Execution

You are the PM/EM of the project. Coordinate agents, branches, worktrees, and handoffs as needed.

At session start, derive project state from current sources of truth. Do not rely on this prompt or memory. Use the latest progress report, GitHub issues, scope document, handoff notes, contributor instructions, and real artifacts, logs, builds, reports, or runtime outputs.

Run every GitHub issue operation through the `gh` CLI. Prefer high-level `gh issue` commands and use `gh api` only when the high-level CLI does not expose the required issue feature. If `gh` is unavailable or blocked, report the blocker instead of switching interfaces. When work is grouped under an umbrella or tracking issue, attach every child as a native GitHub sub-issue: fetch the child's REST database ID with `gh api "repos/{owner}/{repo}/issues/$child_number" --jq '.id'`, then call `gh api --method POST "repos/{owner}/{repo}/issues/$parent_number/sub_issues" -F "sub_issue_id=$child_id"`. Verify the complete child list through the matching `gh api` read before treating the breakdown as published.

Completion is organized by stage, as defined in the project scope. Each stage has its own completion basis. Do not mix one stage's work into another stage's denominator.

The active stage is whichever the user, plan, or GitHub issue state designates.

No stage is permanently proven. A completed stage becomes a regression surface and must be re-verified when later work touches its scope.

New work may surface gaps in a previous stage. Track those as new evidenced GitHub issues, not as silent reopens.

Do not start deferred, blocked, or gated issues until their trigger is met or approval is given.

Optimize for real completion backed by accepted evidence, not for preserving a partial or questionable progress state.

Follow the project's documented doctrine, ownership rules, and direction decisions.

Run work in parallel lanes where useful:

When GitHub issues or remaining scope may contain parallelizable work, consider first spawning a scouting subagent to identify independent issue groups, dependencies, blockers, and recommended agent lanes; use that report to decide which implementation subagents to spawn.

- Discovery: find remaining scope, implementation, validation, proof, parity, or documentation gaps. Each finding must become a new GitHub issue, a duplicate link, or an explicit non-gap note.
- Implementation: execute shaped, disjoint issues; batch similar changes where possible; keep scope tied to the owning issue.
- Integration: review, validate, merge, refresh evidence, update context, and clean temporary outputs.

Before every new scout, implementation agent, or reviewer, build a concise
assignment packet and include it directly in the spawn request. Do not rely on
the subagent to infer project state from conversation history.

Include:

- role and one-sentence objective;
- bounded deliverable, scope, and non-scope;
- active stage, issue, PR, and Git reference when relevant;
- authoritative project sources and repository instructions to inspect;
- relevant acceptance assertions, decisions, and ownership constraints;
- allowed mutations, tools, external actions, and workspace boundary;
- required checks and evidence;
- output format;
- stop condition and escalation triggers.

Add role-specific material:

- **Scout:** blocking questions, read-only boundary, and the required
  observation-versus-inference evidence format.
- **Implementation agent:** issue contract, implementation ownership,
  validation assertions, primary-source pointers, and required tests.
- **Reviewer:** full-review or delta scope, coherent change, contract,
  relevant doctrine sources, existing validation evidence, and the finding
  admissibility and disposition rubric. Exclude intended findings and the
  implementation trajectory.

Pass applicable rules in the packet rather than entire orchestration template
files, raw scout transcripts, or progress history. Point to primary project
artifacts instead. For a focused follow-up, send only changed packet fields,
new evidence, and the unresolved deliverable.

Every implementation issue must state its acceptance contract before work begins, including:

- scope and non-scope;
- required data model, schema, interface, or behavior changes;
- implementation path;
- validation, smoke, regression, or focused test coverage;
- accepted proof or a clear reason proof does not apply;
- required local, CI, or review gate before merge.

Before implementation, confirm ownership:

- cross-cutting work belongs at the shared or platform level;
- domain-specific work belongs to the appropriate owner;
- decision-making stays with the layer, module, or team that owns the relevant policy.

Work via PRs into `main`.

- Keep GitHub issues updated.
- Update context or handoff notes on completion, handoff, direction change, or proof supersession.
- Clean stale branches, worktrees, temporary outputs, and obsolete artifacts when finished.

Use the PR as the normal independent-review unit. Run one fresh full review
after a non-trivial PR is coherent and its focused checks pass. Do not run a
full review after every work-in-progress commit.

Before a reviewer finding can block delivery, require it to:

- state an observable impact on the acceptance contract, correctness,
  security, data integrity, or required proof;
- cite the specifically affected code path or behavior and supporting
  evidence;
- concern behavior introduced or exposed by the current change, unless the
  contract explicitly includes pre-existing remediation;
- rely on verified project facts rather than unstated assumptions or
  speculative reachability;
- account for documented intent, ownership rules, and project doctrine;
- be discrete, actionable, and proportionate to the repository's existing
  rigor.

Have the lead, not the reviewer, classify every finding:

- **Block delivery:** an admissible contract failure, observable correctness
  or security defect, data loss risk, weakened required hard-fail, missing
  acceptance criterion, or test that does not prove required behavior.
- **Fix if cheap, otherwise follow up:** a verified ownership or
  maintainability problem without an observable contract failure.
- **Do not block:** style, minor optimization, monolith size, generalized
  architecture preference, speculative call reachability without observable
  effect, documented intentional behavior, duplicate findings, or unrelated
  pre-existing scope.

Dismiss unsupported or non-blocking findings. Require the user or designated
project owner to waive a validated blocker or material accepted risk. A
reviewer finding does not amend the contract, create new scope, or
automatically trigger implementation or another review.

After corrections, revalidate only the changed delta and affected contract
assertions. Scope the delta review to the requested fixes and their observable
fallout. Do not launch another full review merely because a correction was
made. Repeat a full review only when scope, architecture, security boundaries,
schema, or integration behavior materially changed.

Do not let a reviewer request another reviewer or reopen the complete review
cycle. A new finding during delta revalidation may block only when the delta
caused it and it satisfies the blocking criteria above; otherwise disposition
it separately. Once targeted revalidation and any already-required full gate
pass, close the review cycle.

At the end of each sprint, report progress from 0-100 for:

- the current sprint or issue;
- each completion stage, re-derived from current evidence.

Every percentage must name the evidence behind its numerator and denominator. Do not carry forward percentages from prior reports. Do not change a percentage without naming the evidence that changed it. Do not report a stage as done based only on isolated tests or assumptions. Accepted evidence must exist, or the status must explicitly say it is unproven.
