# Validation Profiles

Read this file before the first decision about whether a coherent change needs
independent validation. Use these profiles only to select validation cadence;
do not weaken the validation contract, deterministic checks, completion rules,
or finding standards.

## Apply The Common Gate

For every change, require the implementation owner to inspect the complete
diff against the contract, run focused deterministic checks, resolve known
failures, and report material uncertainty. Have the lead inspect the diff,
repository state, acceptance evidence, and unrun checks before deciding whether
the change is ready for independent validation or completion.

## Select The Profile

Default to `quality-first`. Select `balanced` only when the user or invocation
explicitly requests it. For mission execution, record the selected profile in
the canonical durable state. For direct execution, record only an override from
the default in the compact contract. Retain the selected profile through the
run unless the user changes it; do not downgrade it automatically for cost,
time, or agent-capacity reasons.

## Use Quality-First

Run a fresh validator after every substantive coherent change and every
meaningful integration milestone passes its focused gates.

Treat a change as substantive when it affects runtime behavior, non-mechanical
application logic, externally consumed interfaces, schemas, data semantics,
security boundaries, concurrency, migrations, or required acceptance proof.
Documentation, copy, formatting, generated output, and deterministic mechanical
transformations do not require a validator solely by category when focused
checks directly prove the intended result. Escalate any such change when its
actual risk or uncertainty is substantive.

## Use Balanced

Run a fresh validator after every meaningful integration milestone and for
every high-risk change. For other direct changes or PRs, also run a fresh
validator when any of these signals apply:

- requirements or observable behavior remain ambiguous;
- the change crosses behavioral ownership or coupled subsystem boundaries;
- tests are missing, flaky, indirect, or do not exercise the behavior that
  matters;
- implementation changed direction materially or required several distinct
  approaches;
- the diff is broad, difficult to reverse, or depends on production-only state;
- passing checks leave material uncertainty about the contract; or
- the lead cannot explain why the available proof is sufficient.

Skip a fresh validator only when the change has bounded ownership, explicit
acceptance assertions, contained and recoverable failure, direct deterministic
proof for every affected assertion, and no material lead uncertainty. A skipped
mission change remains subject to fresh milestone validation. A skipped direct
change may complete without independent agent review when all common completion
requirements pass.
