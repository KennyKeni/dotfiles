# OpenCode Ollama Lane

Use this lower-cost lane only for eligible `scout` and `worker` assignments.
Use native Codex Sol for every formal validator. When the main skill classifies
requested work as architecturally consequential or high-risk, return the
ineligible assignment to the lead; use Sol only when the user or active mission
authorizes that fallback.

## Select And Verify The Model

Choose one model before starting a session:

- `ollama-cloud/glm-5.2` for text and code retrieval, implementation, and the
  largest text-only contexts;
- `ollama-cloud/kimi-k2.7-code` when the assignment requires image input;
- `ollama-cloud/minimax-m3` when the assignment requires video input or
  image-plus-text context beyond Kimi's capacity.

Retain the selected exact model for focused follow-ups. Refresh and verify it:

```bash
MODEL=ollama-cloud/glm-5.2 # Set the selected exact model ID.
opencode models --refresh >/dev/null
opencode models | rg -Fx "$MODEL"
```

Choose another listed model only when its routing criteria apply.

Keep the work in the main agent and report the limitation when the model or a
required capability is unavailable. Retain the exact model for follow-ups.

## Invoke OpenCode

Verify `opencode agent list` includes `build (primary)` and `explore (primary)`.
Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO`, `MODEL`, `AGENT`, and `PROMPT_FILE` before invocation.

Worker invocation:

```bash
opencode run --dir "$REPO" \
  --model "$MODEL" \
  --agent build \
  --file "$PROMPT_FILE" \
  --format json \
  --dangerously-skip-permissions \
  --title "ollama worker: <bounded-task>" \
  "Read the attached assignment and complete only that worker scope."
```

Scout invocation:

```bash
opencode run --dir "$REPO" \
  --model "$MODEL" \
  --agent explore \
  --file "$PROMPT_FILE" \
  --format json \
  --title "ollama scout: <bounded-question>" \
  "Read the attached assignment and return evidence only. Do not edit files."
```

Give every run a unique title. Record the exact `sessionID` from the first JSON
event before deleting the prompt file. Treat `step_finish` with `reason: "stop"`
and a zero process exit as completion. Treat a top-level `error` event or
nonzero exit as failure, preserving any useful result and retryability evidence.
Recover a missing session ID by matching the unique title and repository.

## Continue And Recover

Resume the recorded session with its exact model and agent, omitting `--fork`.
For a read-only scout follow-up:

```bash
MODEL="<exact-model-used>"
AGENT=explore
opencode run --dir "$REPO" \
  --session "$SESSION_ID" \
  --model "$MODEL" \
  --agent "$AGENT" \
  --file "$PROMPT_FILE" \
  --format json \
  "Read the attached follow-up and remain within the original assignment."
```

For a writable worker follow-up:

```bash
MODEL="<exact-model-used>"
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

Delete or replace the session only when it cannot resume or its context is no
longer trustworthy.
