# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

## Before exploring, read these

- **`.local/context/CONTEXT.md`** for single-context repos, or
- **`.local/context/CONTEXT-MAP.md`** if it exists — it points at one local context file per context. Read each one relevant to the topic.
- **`.local/context/UBIQUITOUS_LANGUAGE.md`** if it exists — use it as a supporting domain glossary.
- **`.local/adr/`** — read ADRs that touch the area you're about to work in. For context-specific decisions, prefer ADR filenames and titles that name the context.

If any of these files don't exist, **proceed silently**. Don't flag their absence; don't suggest creating them upfront. The producer skill (`/grill-with-docs`) creates them lazily when terms or decisions actually get resolved.

## File structure

Single-context repo (most repos):

```
/
├── .local/
│   ├── context/
│   │   └── CONTEXT.md
│   └── adr/
│       ├── 0001-event-sourced-orders.md
│       └── 0002-postgres-for-write-model.md
└── src/
```

Multi-context repo (presence of `.local/context/CONTEXT-MAP.md`):

```
/
├── .local/
│   ├── context/
│   │   ├── CONTEXT-MAP.md
│   │   ├── ordering/CONTEXT.md
│   │   └── billing/CONTEXT.md
│   └── adr/                           ← system-wide and context-specific decisions
└── src/
```

## Use the glossary's vocabulary

When your output names a domain concept (in an issue title, a refactor proposal, a hypothesis, a test name), use the term as defined in the local context docs. Don't drift to synonyms the glossary explicitly avoids.

If the concept you need isn't in the glossary yet, that's a signal — either you're inventing language the project doesn't use (reconsider) or there's a real gap (note it for `/grill-with-docs`).

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding:

> _Contradicts ADR-0007 (event-sourced orders) — but worth reopening because…_
