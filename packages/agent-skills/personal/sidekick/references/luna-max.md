# Luna Max Setup

Use the current Codex session as the main agent and one persistent native Codex
subagent as the sidekick.

## Configure The Pair

- Main model: inherit the current session's model.
- Main reasoning effort: inherit the current session's reasoning effort.
- Sidekick model: `gpt-5.6-luna`.
- Sidekick reasoning effort: `max`.
- Sidekick agent type: `worker`.
- Sidekick task name: `sidekick`.
- Context fork: `none`.

Choose these values explicitly when spawning. If the model or effort is
unavailable, keep the work in the main agent and report that the requested
setup could not be established.

## Keep The Sidekick Persistent

Use the native subagent controls. Spawn only one sidekick for the task and
record its task identifier. Use mailbox waiting to observe it, focused messages
to answer an active question, and follow-up tasks to reactivate it with the
next bounded unit after a return.

Retain the same task, model, and effort for exploration, implementation,
testing, and correction phases. Route responsibility back to the main agent at
the judgment boundaries in the main skill, then return executable work to this
same sidekick when appropriate.

Interrupt only this sidekick when it crosses an assignment boundary or its
context is no longer trustworthy. Preserve its useful evidence, end delegated
execution, and return the remaining work to the main agent. Report that the
requested pair is degraded rather than creating a replacement session.

The setup is satisfied when every delegated unit uses this exact pair or the
main agent has explicitly reported that the pair is unavailable or degraded.
