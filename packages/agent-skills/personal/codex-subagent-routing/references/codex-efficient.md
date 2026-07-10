# Codex Efficient Policy

Use this mixed policy to spend Grok 4.5 on routine work while reserving native
Codex Sol at high effort for consequential work. This policy selects an
execution lane; it does not introduce new roles.

Before the first assignment through each selected execution lane, read the
main skill's directly linked `opencode-grok.md` or `codex-sol.md` reference.
Reuse loaded references for later assignments in the current context.

## Classify The Scout

Record an easy scout when it has one explicit, bounded question, a clear stop
condition, and an answer that direct file, line, command, log, or
authoritative-source evidence can settle. The search may span a large
repository or source set when the question and stop condition remain bounded.

Record a hard scout when it must reconcile contradictory evidence, diagnose an
unknown cause across coupled subsystems, trace cross-repository dependencies or
security and data flows, or gather evidence that determines architecture or
another high-impact implementation approach.

A scout may remain easy when its purpose is to discover the applicable pattern;
an existing pattern is not a prerequisite for bounded retrieval.

## Classify The Worker

Record an easy worker when all four gates pass and no hard trigger below
applies:

- the behavior, contract, and acceptance assertions are explicit;
- the change has bounded ownership and scope, with no unresolved material
  design decision;
- failure has contained impact and the change is reasonably recoverable; and
- correctness has reliable, task-local proof through automated tests,
  deterministic commands, or clear visual or manual verification.

Treat an established pattern, mechanical repetition, backward compatibility,
and direct automated tests as strong confidence signals, not prerequisites.

Record a hard worker when any condition is true:

- requirements involve ambiguity, product judgment, architecture, or a choice
  among materially different approaches;
- work requires coordinated changes across behaviorally coupled subsystems,
  contracts, or consumers;
- failure has broad blast radius or rollback is difficult;
- concrete coupling requires coordinated state, ordering, cross-service calls,
  shared contract consumers, or concurrency-sensitive behavior;
- implementation changes a trust boundary or security-relevant behavior,
  including authentication, authorization, session or token lifecycle,
  credential or secret handling, permissions, tenant isolation, cryptography,
  or validation at an exposed boundary;
- the assignment materially affects externally consumed contracts,
  production-data semantics, destructive or irreversible migrations, or
  rollout-sensitive infrastructure;
- correctness depends on production-only state, consequential concurrency or
  performance behavior, or evidence that cannot be reproduced reliably within
  the assignment; or
- the acceptance assertions do not have clear, checkable proof.

Small net-new features, routine integration work, visual changes, and changes
across multiple independent files may remain easy. Documentation, copy,
fixtures, and mechanical refactors around security surfaces may remain easy
when they leave security behavior unchanged. Test fixtures, local seed data,
additive patterned APIs, backward-compatible migrations, and routine
automation are not hard by category; classify their ambiguity, coupling,
impact, recoverability, and proof.

Default uncertainty to `hard`. Size alone does not determine difficulty.

## Route The Tier

Use these mappings:

- easy `scout`: OpenCode `explore` with `xai/grok-4.5`;
- hard `scout`: native Codex Sol at high effort;
- easy `worker`: OpenCode `build` with `xai/grok-4.5`;
- hard `worker`: native Codex Sol at high effort;
- every `validator`: fresh native Codex Sol at high effort.

Skip the scout when the main skill's delegation criteria do not justify one.
Keep `scout`, `worker`, and `validator` as the canonical roles and include the
difficulty and selected execution lane in the assignment packet.

## Escalate On Evidence

Promote an easy assignment to hard before spawning when any hard trigger is
known. Promote an easy scout when it cannot settle the explicit question within
its bounded search budget or encounters material contradictions. Promote an
easy worker after two materially different unsuccessful approaches, concrete
coupling evidence, failure to produce acceptance-aligned proof, or discovery
of a high-consequence implication.

Stop the easy assignment at that boundary and return its verified evidence.
Give a fresh Sol-high scout or worker a compact handoff containing the contract,
observations, attempted proof, changed files when applicable, and unresolved
questions. Treat Grok self-checks as worker evidence; retain independent
Sol-high validation.
