# ChangeShape

> An agent-native method for classifying and coordinating software changes.
>
> Version 1.2.0

ChangeShape governs execution after a request or outcome exists. It is designed for one person acting as product owner and developer with a primary agent and optional specialist agents. It works independently or under [OutcomeFlow](./outcome-flow.md).

## Operating Contract

### Scope and Authority

Infer the authorized endpoint from the request and session: advice, verified local changes, a pull request, integration, or release. A workflow stage does not grant permission for the next endpoint.

The human owner retains product authority, consequential risk acceptance, and any decisions not delegated. Honor choices and conditional approval already given. Continue through implementation, relevant verification, and fixes within scope; do not stop at a first draft or request the same acceptance again.

Escalate before an undelegated product choice, material scope expansion, new external side effect, or consequential risk acceptance. Continue independent authorized work while the choice is pending.

### Classification

Classify by ambiguity, blast radius, recovery risk, coordination, and verification difficulty. Recovery risk includes detection, containment, rollback, data repair, compatibility recovery, and lasting consequences. Do not score dimensions or substitute duration, story points, file count, or generated-code volume.

| Shape  | Use when                                                                                                                            | Execution and evidence                                                                                                                                              | Coordination                                                                        |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Direct | The outcome is clear; effects, recovery risk, and verification are local.                                                           | Inspect, implement, and perform the smallest relevant check or direct inspection.                                                                                   | No persistent plan or work entry.                                                   |
| Scoped | One clear approach crosses connected parts inside one ownership area; ambiguity and recovery risk remain low.                       | Use a brief plan if helpful, implement, and exercise the integrated flow or nearest faithful environment. Isolated unit tests alone may miss the affected boundary. | Keep planning in the interaction by default.                                        |
| Shaped | A consequential decision, durable boundary, high recovery risk, or coordination across sessions or slices needs explicit treatment. | Resolve necessary decisions, preserve essential boundaries, implement coherent slices, and verify the acceptance conditions.                                        | Persist only decisions and boundaries that cannot safely remain in the interaction. |

Changes to persisted state, public contracts, security semantics, runtime ownership, or several verification environments usually need Shaped treatment when the consequences are material. Merely touching these areas does not determine the shape.

An Initiative is strategic direction containing independently valuable outcomes, not an executable change. Select the next outcome and classify it on its own merits. Split unrelated outcomes. When choosing the lighter shape, confirm that a failed assumption is inexpensive to reverse and reliably detectable.

Announce classification when it explains a meaningful scope, coordination, or verification choice. Routine Direct work does not need a label. Reclassify when evidence changes the risk or boundaries; continue within existing authority if the new treatment fits the request. Pause only the work that requires a new decision or permission.

Before lowering a classification, explain which safety, coordination, or verification protections would be dropped and why the remaining treatment is sufficient. A lighter label does not waive required acceptance conditions or authorize residual risk.

Use [EvidenceProbe](./evidence-probe.md) when bounded evidence could resolve consequential uncertainty. A conventional reversible choice or a preference the owner can answer directly does not require a probe.

### Verification and Acceptance

Define observable acceptance conditions and relevant environments before committing to consequential implementation. Verification must cover affected behavior, integrated boundaries, and material recovery risks.

Report material evidence as:

- `verified`: the check ran or the behavior was exercised and supports acceptance.
- `failed`: observed behavior does not satisfy acceptance.
- `unverified`: a required check could not run; name the reason and remaining risk.

Fix failures caused by the change and rerun affected checks within the authorized scope. Preserve valid evidence; broaden or repeat checks only when changes, failures, or unresolved concerns justify it. Optional checks that do not affect acceptance do not create an integration gate.

A failed or unverified acceptance condition blocks integration unless the human owner accepts the named risk. Existing explicit acceptance of that same condition is sufficient; it does not relabel the evidence as verified. Unrelated baseline failures must be distinguished from regressions.

Acceptance can be established by satisfying criteria the owner already approved. Seek another decision for unresolved product meaning, experience choices reserved for human review, or residual risk outside that approval. Integrate only when integration itself is authorized.

### Coordination and Documentation

For the solo-owner model, default to one active Shaped outcome per repository. OutcomeFlow also applies this default across the integration owner's current ownership domain. Adjust concurrency only when the owner delegates independent integration responsibility and review, verification, and environment capacity support it.

Direct or Scoped work may interrupt an active Shaped outcome only when the interruption is inexpensive and does not create a competing integration stream or displace the owner's review and integration attention.

Use additional agents only when delegation is available and authorized and independent work can be reviewed and integrated. Each subtask needs an outcome, scope, relevant constraints, acceptance, and mutation authority. Avoid overlapping edits without an integration plan; the primary agent owns review of the combined result and relevant verification.

Use one existing work index, issue tracker, or equivalent system when state must survive the interaction. Retain only active work, immediate candidates, boundaries, and the next decision. Two or three candidates are a useful attention default, not a completeness target.

Create a temporary specification only when that system cannot preserve the necessary decisions, risks, and acceptance. Use at most one shared handoff for an active outcome; do not create per-agent state files or parallel ledgers.

Update canonical documentation when durable product, architecture, runtime, or contributor truth changes. Keep implementation and verification history in version control and native check systems. Retain consequential rationale using the local decision-record convention.

At completion, remove temporary artifacts created for the task when safe and authorized, and close completed coordination entries within scope. Preserve user-authored history unless its removal is authorized. File count, a passing check, or the end of a session alone does not justify new documentation.

## Reference Material

Read [examples and coordination artifacts](./references/change-shape.md) when classification examples, a specification outline, or decision-record guidance would help. These examples are not required reading for ordinary execution.

ChangeShape acceptance concerns implementation readiness. Delayed product or operational effects belong to OutcomeFlow observation when that method is adopted.
