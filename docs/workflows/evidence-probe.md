# EvidenceProbe

> An agent-native method for resolving consequential uncertainty with bounded evidence.
>
> Version 1.2.0
>
> Status: Released

EvidenceProbe gathers the smallest trustworthy evidence needed for a consequential product, technical, or operational decision. It can operate independently or support [OutcomeFlow](./outcome-flow.md) and [ChangeShape](./change-shape.md).

## Operating Contract

### Entry and Boundary

Identify one Decision Question, its owner, and the action blocked by uncertainty. Use a probe only when evidence can distinguish plausible actions. A directly answerable preference, a conventional reversible implementation choice, or research without a blocked action does not require this method.

When a live service needs immediate containment or restoration, follow the authorized incident-response path; do not make EvidenceProbe a prerequisite. Use a bounded probe for remaining consequential uncertainty once urgent response permits it.

The owner retains undelegated product choices and consequential risk acceptance. Reuse decisions and conditional authorization already provided. A probe-only request ends with evidence and a recommendation only when supported; an authorized probe-then-implement request can continue once its decision condition is met.

Define only the boundary needed to constrain the investigation: plausible options, relevant constraints and exclusions, consequences of a wrong choice, acceptable uncertainty, and stop or reframe conditions.

### Evidence and Execution

Inspect existing evidence before constructing an experiment. Choose the smallest discriminating action: repository inspection, a faithful reproduction, measurement, primary documentation, disposable prototype, or focused owner input.

Prefer direct measurements over proxy metrics, faithful target environments over unrealistic substitutes, primary sources over summaries, and reproducible observations over unexplained conclusions. Choose by relevance to the decision, not a mandatory evidence hierarchy; state material limits of substitutes.

State which possible result would support, contradict, or leave the material claim unresolved. Use external sources when the request requires them or local evidence cannot resolve the decision. Cite sources near the claims and distinguish source claims from inference.

Report commands as run, relevant environment details, and observations actually obtained. Do not treat an expected result or an inaccessible source as evidence. Avoid source-count quotas, unsupported confidence percentages, and score totals.

Keep experiments isolated from production paths. Local disposable experiments within the authorized investigation may proceed without repeated confirmation. Changes to tracked implementation, external systems, production data, or costly state require authorization covering that action and its recovery implications.

Apply these test-work rules within that boundary; they do not authorize implementation changes for a probe-only request.

<!-- code-kit shared block: guidance/AGENTS.md#test-work -->

- Run existing tests and checks when relevant and safe; use snapshot-update or baseline-regeneration modes only on request.
- Focused throwaway tests that use existing tooling and verify or investigate the requested work are fine. Keep them out of maintained files and remove them when done.
- Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked. When verification needs them, report the gap instead.
- Fix regressions in the implementation; do not weaken assertions or expected results to make checks pass.

<!-- /code-kit shared block -->

Do not silently promote prototype code into production. If implementation is authorized, transition explicitly to the project's execution method and apply production verification requirements.

### Result and Completion

Mark decision-relevant claims:

- `supported`: observations support the claim for this decision.
- `contradicted`: observations conflict with the claim.
- `unresolved`: evidence cannot support a responsible conclusion.

End the probe as:

- `decision-ready`: enough evidence exists to choose while understanding residual uncertainty.
- `inconclusive`: no useful probe remains within the boundary or necessary evidence is unavailable.

Stop gathering evidence when another probe cannot reasonably change the action. Name residual uncertainty and its consequence. Recommend an option when justified.

An inconclusive result blocks a costly-to-reverse commitment unless the owner explicitly accepts the named uncertainty and consequence. Existing acceptance of that same risk is sufficient. Acceptance does not relabel the evidence.

If the owner already specified a decision rule or delegated a reversible choice and the evidence satisfies that authority, report the decision and continue the authorized next step. Otherwise return the material choice to the owner. Use the project's normal execution method for production work; adopting another named workflow is not required.

### Coordination and Artifacts

Default to one active decision per owner when sharing the same attention or evidence budget. Independent questions may be separated when the owner delegates them and results can be evaluated independently.

Use additional agents only when available, authorized, and useful for independent evidence sources or non-overlapping experiments. Define their decision question, scope, permitted side effects, and stopping condition.

Keep transient evidence in the interaction. When coordination must survive it, reuse the established location for the question, boundary, next probe or trigger, and unresolved findings. Do not create source dumps, research journals, prototype diaries, or permanent option matrices by default.

Persist a decision record only when consequential rationale must survive or the user requests it. Preserve measurements and history in their native systems. Remove only disposable artifacts whose deletion is safe and authorized; do not delete user-owned evidence by assumption.

## Reference Material

Read [probe examples and decision records](./references/evidence-probe.md) when designing an unfamiliar probe or preserving consequential rationale. Use `$run-evidence-probe` to apply the method to a particular decision.
