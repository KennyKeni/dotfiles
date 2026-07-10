# Native Codex Sol Lane

Use this lane for default Codex delegation and for every architecturally
consequential scout, difficult or high-risk worker, and formal validator.

## Select Model And Effort

Use GPT-5.6 Sol with these defaults:

- `scout`, medium effort: bounded read-only repository exploration;
- `scout`, high effort: consequential synthesis, unfamiliar cross-subsystem
  diagnosis, or evidence affecting architecture, security, schemas,
  migrations, concurrency, or public interfaces;
- `worker`, medium effort: normal bounded implementation;
- `worker`, high effort: difficult cross-cutting or high-risk implementation;
- `validator`, high effort: fresh independent validation.

Retain the current lead model and effort. Prefer GPT-5.6 Sol at xhigh effort
for a long-horizon mission lead, while leaving parent-session selection to the
user.

Choose model and effort before spawning and state both in the assignment.
Keep medium and high as execution settings rather than role names. If the
requested setting is unavailable, keep the work in the lead or report the
limitation.

## Invoke Native Codex

Use the current native subagent controls. Keep model and effort selection in
the spawn assignment rather than persistent custom-agent configuration.

Pass a compact assignment and the minimum useful context. Where the native
controls support context selection, prefer fresh or narrowly forked context
over the complete lead history. Record the task name or identifier used to
steer, wait for, or stop the subagent.

## Continue And Clean Up

Send focused follow-ups to an existing scout or worker when its context remains
relevant. Start every validator with fresh context.

When a native session hangs or is interrupted, inspect the active agent list
and stop only that session. Preserve its last useful evidence in the lead
before replacing or closing it.
