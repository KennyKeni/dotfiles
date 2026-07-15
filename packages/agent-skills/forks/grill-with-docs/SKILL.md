---
name: grill-with-docs
description: Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates local-only documentation (`.local/context/` and `.local/adr/`) inline as decisions crystallise. Use when user wants to stress-test a plan against their project's language and documented decisions.
disable-model-invocation: true
---

<what-to-do>

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

Ask the questions one at a time, waiting for feedback on each question before continuing.

If a question can be answered by exploring the codebase, explore the codebase instead.

</what-to-do>

<supporting-info>

## Domain awareness

During codebase exploration, also look for the local agent setup:

- Read `.local/agents/domain.md` first when it exists. It is the source of truth for context and ADR paths.
- Read `.local/context/CONTEXT.md` in single-context repos.
- If `.local/context/CONTEXT-MAP.md` exists, read it to find the relevant context files under `.local/context/`.
- Read `.local/context/UBIQUITOUS_LANGUAGE.md` if it exists as supporting glossary material.
- Read `.local/adr/` for decisions that touch the area you're discussing.

Create files lazily — only when you have something to write. If no local context file exists, create `.local/context/CONTEXT.md` when the first term is resolved. If no `.local/adr/` exists, create it when the first ADR is needed.

### File structure

Most repos have a single context:

```
/
├── .local/
│   ├── agents/domain.md
│   ├── context/
│   │   └── CONTEXT.md
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

If `.local/context/CONTEXT-MAP.md` exists, the repo has multiple contexts. The map points to where each local context file lives:

```
/
├── .local/
│   ├── context/
│   │   ├── CONTEXT-MAP.md
│   │   ├── ordering/CONTEXT.md
│   │   └── billing/CONTEXT.md
│   └── adr/                          ← system-wide and context-specific decisions
├── src/
│   ├── ordering/
│   └── billing/
```

## During the session

### Challenge against the glossary

When the user uses a term that conflicts with the existing language in the local context docs, call it out immediately. "Your glossary defines 'cancellation' as X, but you seem to mean Y — which is it?"

### Sharpen fuzzy language

When the user uses vague or overloaded terms, propose a precise canonical term. "You're saying 'account' — do you mean the Customer or the User? Those are different things."

### Discuss concrete scenarios

When domain relationships are being discussed, stress-test them with specific scenarios. Invent scenarios that probe edge cases and force the user to be precise about the boundaries between concepts.

### Cross-reference with code

When the user states how something works, check whether the code agrees. If you find a contradiction, surface it: "Your code cancels entire Orders, but you just said partial cancellation is possible — which is right?"

### Update local context inline

When a term is resolved, update the relevant local context file right there. Don't batch these up — capture them as they happen. Use the format in [CONTEXT-FORMAT.md](./CONTEXT-FORMAT.md).

Local context docs should be totally devoid of implementation details. Do not treat them as specs, scratch pads, or repositories for implementation decisions. They are glossaries and nothing else.

### Offer ADRs sparingly

Only offer to create an ADR when all three are true:

1. **Hard to reverse** — the cost of changing your mind later is meaningful
2. **Surprising without context** — a future reader will wonder "why did they do it this way?"
3. **The result of a real trade-off** — there were genuine alternatives and you picked one for specific reasons

If any of the three is missing, skip the ADR. Use the format in [ADR-FORMAT.md](./ADR-FORMAT.md).

</supporting-info>
