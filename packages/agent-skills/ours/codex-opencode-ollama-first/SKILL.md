---
name: codex-opencode-ollama-first
description: Route selected Codex work to OpenCode through Ollama Cloud models, with Codex orchestrating and verifying. Use when the user asks to delegate to OpenCode/Ollama, wants a second implementation agent, or needs GLM/Kimi/Minimax-backed UI, code, or multimodal help from outside Codex.
---

# Codex OpenCode Ollama First

Codex sessions only. Current harness is Codex; OpenCode is the subagent. Codex keeps the spec, judgment, final diff review, test verification, and user conversation.

## Default Stance
Default to `ollama-cloud/glm-5.2` for delegated text/code work, including text-only frontend and component implementation. It has the best fit for long-horizon engineering: large context, strong coding, tool use, and stable project-level implementation.

Use only three delegated model lanes unless the user explicitly asks to experiment:

- general repo engineering, frontend implementation, and text/code tasks: `ollama-cloud/glm-5.2`
- visual or multimodal UI tasks with screenshots, image/video references, or visual QA loops: `ollama-cloud/kimi-k2.7-code`
- very large multimodal/research context: `ollama-cloud/minimax-m3`

## Model Check
Names move. Refresh and inspect before delegating:

```bash
opencode models --refresh >/dev/null
opencode models | rg -i 'ollama-cloud/(glm|kimi|minimax)'
```

Current main IDs:
- `ollama-cloud/glm-5.2`: primary default for repo-scale implementation, migrations, debugging, tests, and long-context engineering.
- `ollama-cloud/kimi-k2.7-code`: visual UI work, code-driven design from references, multimodal inputs, visual polish, and design alternatives.
- `ollama-cloud/minimax-m3`: 1M-context multimodal/research-heavy tasks when GLM context or retrieval is not enough.

Ollama launch tags differ from OpenCode IDs:

```bash
ollama launch opencode --model glm-5.2:cloud
ollama launch opencode --model kimi-k2.7-code:cloud
ollama launch opencode --model minimax-m3:cloud
```

## Route
Delegate to OpenCode when the prompt is mostly execution:

- repo-scale reading, implementation, refactors, migrations, dependency bumps
- known-repro bug fixes, tests, coverage fills, script/tooling work
- frontend implementation, UI build-out, visual polish, responsive layout, motion, and design exploration
- a second-model implementation or review pass would materially reduce risk

Keep in Codex:

- ambiguous product/design/architecture decisions before the spec is frozen
- tiny obvious edits where delegation overhead loses
- authenticated MCP/app tools, secrets, releases, pushes, destructive ops
- final review of every OpenCode change: diff, tests, screenshots for UI, and closeout

Mixed task: Codex writes a precise work order first, then delegates. For text-only frontend, use GLM. For visual-reference UI work, Codex should state acceptance criteria and ask Kimi for concrete implementation, then verify visually.

## Invoke
Prompt via temp file and attach it; do not inline a large prompt.

```bash
P=$(mktemp); cat >"$P" <<'EOF'
Goal:
Repo:
Key paths:
Constraints:
Non-goals:
Proof expected:
Output: report files changed, commands run, test output, and remaining risks.
EOF
opencode run --dir <repo> \
  --model ollama-cloud/glm-5.2 \
  --agent build \
  --file "$P" \
  --dangerously-skip-permissions \
  --title "glm delegated task" \
  "Read the attached prompt and complete it exactly." \
  | tee /tmp/opencode-last.md
```

Use `--model ollama-cloud/kimi-k2.7-code` for visual UI, screenshot, or vision work. Use `--variant max` only for models/runs where the provider supports higher reasoning effort and the task justifies slower output.

Follow-up fixes:

```bash
opencode run --dir <repo> --continue \
  --file "$P2" \
  --dangerously-skip-permissions \
  "Read the attached follow-up and revise the existing session output."
```

## Prompt And Verify
OpenCode starts with little useful session context. Every prompt must include the goal, exact repo/path scope, constraints, non-goals, proof command, and output shape. For UI prompts include target viewport sizes, references/screenshots, states, and what "done" looks like.

Codex always verifies `git status -sb`, the full diff, focused tests, and exact proof output. For UI, run the app and inspect desktop and mobile screenshots for text fit, overlap, and generic output. Iterate with `--continue` when close; after two poor rounds, stop delegating and finish in Codex.
