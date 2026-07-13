# Grok 4.5 via Cursor Setup

Use the current Codex session as the main agent and one persistent Cursor chat
as the sidekick.

## Select And Verify The Model

Use `cursor-grok-4.5-high` for the persistent sidekick. Retain the
current main agent's model and reasoning effort.
Do not substitute a `fast` variant. Verify the installed CLI, authentication,
and model once before the first Cursor assignment in the current context:

```bash
cursor-agent status
cursor-agent models | rg -x 'cursor-grok-4\.5-high - Cursor Grok 4\.5'
```

Keep the work in the main agent and report the limitation when Cursor is
unavailable, the account is not authenticated, or the model is absent. Retain
the exact model for focused follow-ups.

## Invoke Cursor

Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO` and `PROMPT_FILE` to absolute paths. Use event-stream JSON
for writable or long-running work so the lead can supervise meaningful progress.
Regular `stream-json` emits completed messages, tool activity, errors, and a
final result; omit partial-output mode, which duplicates the completed response.

Start the sidekick:

```bash
MODEL=cursor-grok-4.5-high
cursor-agent --print \
  --workspace "$REPO" \
  --model "$MODEL" \
  --output-format stream-json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Use full Agent mode throughout the persistent chat. Enforce exploration-only,
writable scope, judgment boundaries, and no-delegation requirements through
each assignment packet.

Capture `session_id` from the initial `system/init` event immediately. Observe
completed assistant messages, tool-call start and completion events, errors,
and the terminal `result`. Treat the terminal event's error state, subtype,
process exit, and useful result as completion evidence.
Record the exact invoked model as `MODEL`. Keep thinking deltas out of the
returned answer.

## Continue And Recover

Resume a focused follow-up with the recorded chat ID, the same workspace, exact
model, full permissions, and a focused prompt file:

```bash
MODEL=cursor-grok-4.5-high
cursor-agent --print \
  --resume "$CHAT_ID" \
  --workspace "$REPO" \
  --model "$MODEL" \
  --output-format stream-json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Record the chat ID before deleting the prompt file. Recover a missing ID with
`cursor-agent ls` by matching the repository and assignment context. Keep
`stream-json` for long follow-ups; `json` is suitable for short follow-ups.
Resume the same chat after a capacity error or interruption while its context
remains trustworthy.

For a permitted health check or recovery, inspect only the recorded run:

```bash
ps -axo pid,ppid,command | rg '[c]ursor-agent' || true
```

Interrupt only the process created for that run and preserve the prompt and
useful evidence until the chat is recoverable.

When the chat cannot safely resume, end delegated execution, return the work to
the main agent, and report that the requested pair is degraded. Preserve the
one-sidekick invariant by leaving replacement to a new user invocation.

The setup is satisfied when every delegated unit uses this exact pair or the
main agent has explicitly reported that the pair is unavailable or degraded.
