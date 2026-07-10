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

Retain the selected exact model for focused follow-ups. Refresh and verify it
once before the first assignment in the current context:

```bash
MODEL=ollama-cloud/glm-5.2 # Set the selected exact model ID.
opencode models --refresh >/dev/null
opencode models | rg -Fx "$MODEL"
```

Choose another listed model only when its routing criteria apply. Otherwise
keep the work in Codex or report the limitation.

## Invoke OpenCode

Verify `opencode agent list` shows `explore (primary)`. Use `--agent explore`
for scouts and `--agent build` for workers.

Create a compact prompt file using the environment's approved file-writing
mechanism. Set `REPO`, `MODEL`, and `PROMPT_FILE` before invocation.

Worker invocation:

```bash
opencode run --dir "$REPO" \
  --model "$MODEL" \
  --agent build \
  --file "$PROMPT_FILE" \
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
  --title "ollama scout: <bounded-question>" \
  "Read the attached assignment and return evidence only. Do not edit files."
```

Give every run a unique title and record its exact session ID.

## Continue And Clean Up

Resume with `--session <session-id>` and a focused follow-up file. Use the same
model and agent, and omit `--fork` so the existing session continues. Avoid
bare `--continue` when several sessions may exist.

If the session ID was not recorded before interruption, recover it by matching
the run's unique title and repository in:

```bash
opencode session list --format json --max-count 20
```

Check for a live process only when a run hangs or is interrupted:

```bash
ps -axo pid,ppid,command | rg '[o]pencode|[b]un.*opencode' || true
```

Interrupt only the leftover process created by the delegated run. Then resume
that exact session with `opencode run --session "$SESSION_ID"`, the same model
and agent, and a focused follow-up. Delete or replace the session only when it
cannot resume or its context is no longer trustworthy.
