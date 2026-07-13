# Grok 4.5 via OpenCode Setup

Use the current Codex session as the main agent and one persistent OpenCode
session as the sidekick.

## Select And Verify The Model

Use `xai/grok-4.5` for the persistent sidekick. Retain the
current main agent's model and reasoning effort.
Do not substitute a `fast` variant.
Refresh and verify the configured model once before the first assignment in
the current context:

```bash
opencode models --refresh >/dev/null
opencode models | rg -x 'xai/grok-4\.5'
```

Keep the work in the main agent and report the limitation when the model or a
required capability is unavailable. Retain the exact model for follow-ups.

## Invoke OpenCode

Verify `opencode agent list` includes `build (primary)`.
Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO`, `MODEL`, `AGENT`, and `PROMPT_FILE` before invocation.

Start the sidekick in the build agent so the same session can explore, edit,
test, and repair:

```bash
MODEL=xai/grok-4.5
AGENT=build
opencode run --dir "$REPO" \
  --model "$MODEL" \
  --agent "$AGENT" \
  --file "$PROMPT_FILE" \
  --format json \
  --dangerously-skip-permissions \
  --title "sidekick: <bounded-task>" \
  "Read the attached assignment and remain the persistent sidekick for this task."
```

Give every run a unique title. Record the exact `sessionID` from the first JSON
event before deleting the prompt file. Treat `step_finish` with `reason: "stop"`
and a zero process exit as completion. Treat a top-level `error` event or
nonzero exit as failure, preserving any useful result and retryability evidence.
Recover a missing session ID by matching the unique title and repository.

## Continue And Recover

Resume the recorded session with its exact model and agent, omitting `--fork`.

```bash
MODEL=xai/grok-4.5
AGENT=build
opencode run --dir "$REPO" \
  --session "$SESSION_ID" \
  --model "$MODEL" \
  --agent "$AGENT" \
  --file "$PROMPT_FILE" \
  --format json \
  --dangerously-skip-permissions \
  "Read the attached follow-up and remain within the original assignment."
```

Retain `--dangerously-skip-permissions` for every writable follow-up. Avoid bare
`--continue` when several sessions may exist. Delete prompt files only after
the session ID and useful result are preserved. Recover an unrecorded ID with:

```bash
opencode session list --format json --max-count 20
```

For a permitted health check or recovery, inspect only the recorded run:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

Interrupt only the process created for that run and preserve its prompt and
useful evidence until the session is recoverable.

When the session cannot safely resume, end delegated execution, return the work
to the main agent, and report that the requested pair is degraded. Preserve the
one-sidekick invariant by leaving replacement to a new user invocation.

The setup is satisfied when every delegated unit uses this exact pair or the
main agent has explicitly reported that the pair is unavailable or degraded.
