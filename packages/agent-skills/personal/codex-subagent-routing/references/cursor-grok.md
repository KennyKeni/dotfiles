# Cursor Grok Lane

Use this subscription-backed lane only for eligible `scout` and `worker`
assignments. Use native Codex Sol for every formal validator. When the main
skill classifies requested work as architecturally consequential or high-risk,
return the ineligible assignment to the lead; use Sol only when the user or
active mission authorizes that fallback.

## Select And Verify The Model

Use `grok-4.5-xhigh` for every session in this lane. Never substitute
`grok-4.5-fast-xhigh` or another `fast` variant. Verify authentication and the
model once before the first Cursor assignment in the current context:

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
structured output and record the `session_id` from the completed JSON object as
the Cursor chat ID. Do not use `stream-json`; keep intermediate reasoning and
tool events out of the lead context.

Worker invocation:

```bash
cursor-agent --print \
  --workspace "$REPO" \
  --model grok-4.5-xhigh \
  --output-format json \
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

## Continue And Clean Up

Resume a focused follow-up with the recorded chat ID, the same workspace and
model, full permissions, and a focused prompt file:

```bash
cursor-agent --print \
  --resume "$CHAT_ID" \
  --workspace "$REPO" \
  --model grok-4.5-xhigh \
  --output-format json \
  --trust \
  --force \
  < "$PROMPT_FILE"
```

Use `--force` for both scouts and workers. Avoid bare `--continue` when several
chats may exist. If the chat ID was not recorded before an interruption, use
`cursor-agent ls` interactively and match the repository and assignment context;
Cursor does not provide a reliable headless chat-list interface.

Check for a live process only when a run hangs or is interrupted:

```bash
ps -axo pid,ppid,command | rg '[c]ursor-agent' || true
```

Interrupt only the leftover process created by the delegated run. Then resume
that exact chat with `--resume "$CHAT_ID"` and a focused follow-up. Replace the
chat only when it cannot resume or its context is no longer trustworthy.
