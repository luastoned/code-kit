# ChangeShape

> An agent-native method for classifying and coordinating software changes.
>
> Version 1.3.0

ChangeShape governs execution after a request or outcome exists. It is designed for one person acting as product owner and developer with a primary agent and optional specialist agents. It works independently or under [OutcomeFlow](./outcome-flow.md).

## Operating Contract

### Scope and Authority

Infer the authorized endpoint from the request and session: advice, verified local changes, a pull request, integration, or release. A workflow stage does not grant permission for the next endpoint.

The human owner retains product authority, consequential risk acceptance, and any decisions not delegated. Honor choices and conditional approval already given. Continue through implementation, relevant verification, and fixes within scope; do not stop at a first draft or request the same acceptance again.

Escalate before an undelegated product choice, material scope expansion, new external side effect, or consequential risk acceptance. Continue independent authorized work while the choice is pending.

### Flow

Apply each step in proportion to the shape; Direct work can complete them in one pass.

1. Inspect enough context to classify the change before implementation.
2. Resolve the decisions the shape requires and define acceptance conditions and verification environments.
3. Implement coherent slices, reclassifying when evidence changes risk or boundaries.
4. Verify, fix failures caused by the change, and report evidence states.
5. Establish acceptance, then integrate when integration is authorized.
6. Update changed durable truth, remove temporary coordination, and return the result. Without OutcomeFlow, review remaining candidates in light of what was learned.

### Classification

Assess ambiguity, blast radius, recovery risk, coordination, and verification difficulty, then choose the lightest shape that covers them. Move beyond Direct when effects cross connected parts or need integrated verification. Use Shaped when a consequential decision is unresolved, a durable boundary or high recovery risk is involved, or work must coordinate across sessions or slices. A lighter shape fits only when a failed assumption would be inexpensive to reverse and reliably detected before it has lasting consequences; if either is uncertain, use the heavier shape.

Recovery risk includes detection, containment, rollback, data repair, compatibility recovery, and lasting consequences. Do not score dimensions or substitute duration, story points, file count, or generated-code volume.

| Shape  | Use when                                                                                                                            | Execution and evidence                                                                                                                                          | Coordination                                                                        |
| ------ | ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Direct | The outcome is clear; effects, recovery risk, and verification are local.                                                           | Inspect, implement, and perform the smallest relevant check or direct inspection.                                                                               | No persistent plan or work entry.                                                   |
| Scoped | One clear approach crosses connected parts inside one ownership area; ambiguity and recovery risk remain low.                       | Use a brief plan if helpful, implement, and exercise the integrated flow or nearest faithful environment. Isolated unit tests alone do not verify the boundary. | Keep planning in the interaction by default.                                        |
| Shaped | A consequential decision, durable boundary, high recovery risk, or coordination across sessions or slices needs explicit treatment. | Resolve necessary decisions, preserve essential boundaries, implement coherent slices, and verify each acceptance condition in every required environment.      | Persist only decisions and boundaries that cannot safely remain in the interaction. |

Material changes to domain or state models, persisted data, contracts between runtimes or with external consumers, authentication, authorization, privacy, identity, or other security semantics, runtime ownership, or verification across several environments or devices usually need Shaped treatment. Merely touching these areas does not determine the shape.

An Initiative is strategic direction containing independently valuable outcomes, not an executable change. Do not decompose it into a task tree in advance: select the next outcome, classify it on its own merits, and reshape later outcomes from what it teaches. Split unrelated outcomes even when they share a repository, release, or available agent.

Announce classification when it explains a meaningful scope, coordination, or verification choice. Routine Direct work does not need a label. Reclassify when evidence changes the risk or boundaries; continue within existing authority if the new treatment fits the request. Pause only the work that requires a new decision or permission.

Before lowering a classification, explain which safety, coordination, or verification protections would be dropped and why the remaining treatment is sufficient. A lighter label does not waive required acceptance conditions or authorize residual risk.

Use [EvidenceProbe](./evidence-probe.md) when bounded evidence could resolve consequential uncertainty. A conventional reversible choice or a preference the owner can answer directly does not require a probe.

### Verification and Acceptance

Define observable acceptance conditions and relevant environments before committing to consequential implementation. Verification must cover affected behavior, integrated boundaries, and material recovery risks, in each required environment or a faithful substitute whose limits are stated.

Report material evidence as:

- `verified`: the check ran or the behavior was exercised and supports acceptance.
- `failed`: observed behavior does not satisfy acceptance.
- `unverified`: a required check could not run; name the reason and remaining risk.

Report checks as run and observations actually obtained, and name every failed or unverified acceptance condition. Fix failures caused by the change and rerun affected checks within the authorized scope. Preserve valid evidence; broaden or repeat checks only when changes, failures, or unresolved concerns justify it. Optional checks that do not affect acceptance do not create an integration gate.

A failed or unverified acceptance condition blocks integration unless the human owner accepts the named risk. Existing explicit acceptance of that same condition is sufficient; it does not relabel the evidence as verified. Unrelated baseline failures must be distinguished from regressions.

Acceptance can be established by satisfying criteria the owner already approved. Seek another decision for unresolved product meaning, experience choices reserved for human review, or residual risk outside that approval. Integrate only when integration itself is authorized.

### Coordination and Documentation

For the solo-owner model, default to one active Shaped outcome per repository. Adjust concurrency only when the owner delegates independent integration responsibility and review, verification, and environment capacity support it.

Direct or Scoped work may interrupt an active Shaped outcome only when the interruption is inexpensive and does not create a competing integration stream or displace the owner's review and integration attention.

Use additional agents only when delegation is available and authorized and independent work can be reviewed and integrated. Each subtask needs an outcome, scope, exclusions, relevant constraints, acceptance, verification, and mutation authority. Subagents stop and report product ambiguity, overlapping ownership, costly-to-reverse decisions, or necessary scope expansion instead of resolving them. Avoid overlapping edits without an integration plan; the primary agent owns review of the combined result and relevant verification.

When state must survive the interaction, keep it in one existing work index, issue tracker, or equivalent system. If none exists, create the smallest artifact that carries it: a temporary specification for a single active outcome, or a work index when several entries must persist. Retain only active work, immediate candidates, boundaries, and the next decision. Two or three candidates are a useful attention default, not a completeness target.

Alongside an existing system, create a temporary specification only when that system cannot preserve the necessary decisions, risks, and acceptance. Use at most one shared handoff for an active outcome; do not create per-agent state files or parallel ledgers.

Update canonical documentation when durable product, architecture, runtime, or contributor truth changes, or when the user requests a durable document. A plan, a passing check, completed work, many changed files, the end of a session, or a mentioned future idea does not by itself justify documentation; do not create progress journals, implementation diaries, or verification transcripts. Keep implementation and verification history in version control and native check systems. Retain consequential rationale using the local decision-record convention.

At completion, remove temporary artifacts created for the task when safe and authorized, and close completed coordination entries within scope. Preserve user-authored history unless its removal is authorized.

### Working Under OutcomeFlow

The selected outcome supplies what should become true, why it matters now, constraints and non-goals, decision authority, and its intended observable effect. Derive acceptance conditions from the effects implementation can demonstrate; effects that only delayed use can show belong to OutcomeFlow observation, not acceptance.

Return the classification, evidence states, accepted or unresolved risks, and what was integrated or still awaits authorization. ChangeShape acceptance concerns implementation readiness, not the delivered effect. Apply OutcomeFlow's one-Shaped-outcome default across the owner's ownership domain in addition to the per-repository default.

## Reference Material

Read [examples and coordination artifacts](./references/change-shape.md) when classification examples, a specification outline, or decision-record guidance would help. These examples are not required reading for ordinary execution. Read its [changelog](./references/change-shape.md#changelog) when upgrading an adopted version.
