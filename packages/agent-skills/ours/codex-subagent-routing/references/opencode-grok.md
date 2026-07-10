# OpenCode Grok Lane

Use this lower-cost lane only for `scout` and `worker` assignments. Use native
Codex Sol for every formal validator and for work the main skill classifies as
architecturally consequential or high-risk.

## Select And Verify The Model

Use `xai/grok-4.5` for every session in this lane. Refresh and verify it once
before the first Grok assignment in the current context:

```bash
opencode models --refresh >/dev/null
opencode models | rg -x 'xai/grok-4\.5'
```

Keep the work in Codex or report the limitation when the model is unavailable
or lacks a required capability. Retain the exact model for focused follow-ups.

## Invoke OpenCode

Verify `opencode agent list` shows `explore (primary)`. Use `--agent explore`
for scouts and `--agent build` for workers.

Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO` and `PROMPT_FILE` to absolute paths.

Worker invocation:

```bash
opencode run --dir "$REPO" \
  --model xai/grok-4.5 \
  --agent build \
  --file "$PROMPT_FILE" \
  --dangerously-skip-permissions \
  --title "grok worker: <bounded-task>" \
  "Read the attached assignment and complete only that worker scope."
```

Scout invocation:

```bash
opencode run --dir "$REPO" \
  --model xai/grok-4.5 \
  --agent explore \
  --file "$PROMPT_FILE" \
  --title "grok scout: <bounded-question>" \
  "Read the attached assignment and return evidence only. Do not edit files."
```

Give every run a unique title and record its exact session ID.

## Continue And Clean Up

Resume with `--session <session-id>` and a focused follow-up file. Use the same
model and agent. Avoid bare `--continue` when several sessions may exist.

Check for a live process only when a run hangs or is interrupted:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

Stop only a leftover process created by the delegated run or report why it
remains.
