# Cursor Grok Lane

Use this subscription-backed lane only for eligible `scout` and `worker`
assignments. Use native Codex Sol for every formal validator. When the main
skill classifies requested work as architecturally consequential or high-risk,
return the ineligible assignment to the lead; use Sol only when the user or
active mission authorizes that fallback.

## Select And Verify The Model

Use `grok-4.5-xhigh` for every session in this lane. Never substitute
`grok-4.5-fast-xhigh` or another `fast` variant. Verify the installed CLI,
authentication, and model once before the first Cursor assignment in the
current context:

```bash
cursor-agent status
cursor-agent models | rg -x 'grok-4\.5-xhigh - Cursor Grok 4\.5'
```

Keep the work in Codex or report the limitation when Cursor is unavailable,
the account is not authenticated, or the model is absent. Retain the exact
model for focused follow-ups.

## Invoke Cursor

Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO` and `PROMPT_FILE` to absolute paths. Use single-result
JSON for short probes and scouts. Use event-stream JSON for long workers so the
lead can supervise meaningful progress without polling the process. Never add
`--stream-partial-output`; regular `stream-json` already emits thinking
progress, completed assistant messages, tool activity, errors, and a final
result, while partial output adds token-sized assistant fragments and duplicates
the completed response.

Worker invocation:

```bash
cursor-agent --print \
  --workspace "$REPO" \
  --model grok-4.5-xhigh \
  --output-format stream-json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Scout invocation:

```bash
cursor-agent --print \
  --workspace "$REPO" \
  --model grok-4.5-xhigh \
  --output-format json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Run scouts in full Agent mode with `--force` so repository, shell, web, and
other available tools are not permission-constrained. Enforce the scout's
evidence-only and no-edit boundaries in its assignment rather than through
Cursor mode permissions. Give workers the main skill's bounded change surface
and no-delegation boundary.

For `stream-json`, capture `session_id` from the initial `system/init` event
immediately; do not wait for the final result. Observe completed assistant
messages, `tool_call` start/completion, errors, and the terminal `result` event.
Treat the terminal event's `is_error`, subtype, process exit, and useful result
as the completion evidence. Do not reconstruct the answer from thinking deltas.

Supervise the live event stream rather than interrogating the workspace. Report
meaningful milestones or blockers, and send a brief user update after roughly
one minute without a milestone. Do not run repeated `git status` or process
checks merely to prove activity. Check process liveness only after several
minutes without events or when the runner reports an interruption.

## Continue And Clean Up

Resume a focused follow-up with the recorded chat ID, the same workspace and
model, full permissions, and a focused prompt file:

```bash
cursor-agent --print \
  --resume "$CHAT_ID" \
  --workspace "$REPO" \
  --model grok-4.5-xhigh \
  --output-format stream-json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Use `--force` for both scouts and workers. Avoid bare `--continue` when several
chats may exist. Delete each prompt file after the invocation completes and its
chat ID and useful result are preserved. If the chat ID was not recorded before
an interruption, use `cursor-agent ls` interactively and match the repository
and assignment context; Cursor does not provide a reliable headless chat-list
interface.

Keep `stream-json` for a follow-up to a long worker; `json` remains suitable for
a short follow-up. Resume the same chat after a capacity error or interruption
when its context remains trustworthy.

Check for a live process only after several minutes without events or when a
run is interrupted:

```bash
ps -axo pid,ppid,command | rg '[c]ursor-agent' || true
```

Interrupt only the leftover process created by the delegated run. Preserve the
prompt file until the interrupted run's chat ID and useful evidence are
recovered. Then resume that exact chat with the full follow-up invocation above.
Replace the chat only when it cannot resume or its context is no longer
trustworthy.
