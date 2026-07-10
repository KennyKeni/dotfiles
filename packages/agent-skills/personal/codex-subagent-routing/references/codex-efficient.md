# Codex Efficient Policy

Use this mixed policy to spend Grok 4.5 on routine work while reserving native
Codex Sol at high effort for consequential work. This policy selects an
execution lane; it does not introduce new roles.

Before the first assignment through each selected execution lane, read the
main skill's directly linked `opencode-grok.md` or `codex-sol.md` reference.
Reuse loaded references for later assignments in the current context.

## Classify The Scout

Record an easy scout only when it has one explicit question, a bounded search
surface, a clear stop condition, and an answer that direct file, line, command,
log, or authoritative-source evidence can settle.

Record a hard scout when it must reconcile contradictory evidence, diagnose an
unknown cause across coupled subsystems, trace cross-repository dependencies or
security and data flows, or gather evidence that determines architecture or
another high-impact implementation approach.

A scout may remain easy when its purpose is to discover the applicable pattern;
an existing pattern is not a prerequisite for bounded retrieval.

## Classify The Worker

Record an easy worker only when every condition is true:

- the goal, expected behavior, and acceptance assertions are unambiguous;
- the change is one bounded, independently deliverable slice following an
  established pattern, or a mechanical repetition of one proven pattern;
- dependencies are understood and minimally coupled;
- impact is incremental and backward-compatible, with straightforward rollback;
- every acceptance assertion has direct automated proof. Treat build, lint,
  and typecheck as sufficient alone only when they are the requested outcome;
- the change avoids authentication, authorization, and security boundaries;
- the change avoids breaking or otherwise consequential externally consumed
  contracts, production-data semantics, destructive or irreversible migrations,
  rollout-sensitive infrastructure or deployment behavior, behaviorally
  coupled systems, and concurrency-sensitive behavior.

Record a hard worker when any condition is true:

- requirements involve ambiguity, product judgment, architecture, or a choice
  among materially different approaches;
- work is a net-new multi-surface feature, a large coordinated refactor, or
  spans several behaviorally coupled subsystems or contracts;
- failure has broad blast radius or rollback is difficult;
- concrete coupling requires coordinated state, ordering, cross-service calls,
  shared contract consumers, or multi-surface proof;
- the assignment touches a high-consequence surface excluded above;
- correctness depends on integration behavior, production-like state, user
  testing, concurrency, performance, or evidence across several surfaces;
- no established pattern or acceptance-aligned deterministic proof exists.

Multiple independent files or components following one proven mechanical
pattern may remain easy. Test fixtures, local seed data, additive patterned
APIs, backward-compatible migrations, and routine automation are not hard by
category; classify their coupling, reversibility, and proof.

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
