# ChangeShape Examples and Coordination

These examples support the [operating contract](../change-shape.md). Use them to resolve a classification or artifact-design question, not as a required preflight.

## Classification Examples

- A known local bug with an identified cause is usually Direct.
- A field carried through UI, state, persistence, and tests may be Scoped when its meaning and recovery are clear.
- A mechanical migration across many files can be Scoped; breadth alone does not make it Shaped.
- A five-line change to identity or persisted-data semantics may be Shaped because consequences matter more than size.
- Online multiplayer or an identity platform is an Initiative. Select one independently valuable outcome before deciding its execution shape.

## Reclassification and Interruptions

A change initially thought to migrate persisted data turns out to update only an internal adapter without changing stored values or contracts. A downgrade to Scoped can be justified by that evidence: migration-specific coordination is no longer needed, but the integrated read/write path still needs verification. A shorter diff alone would not justify dropping migration or recovery checks.

A documentation typo may fit alongside an active Shaped migration without competing for integration attention. An unrelated feature needing review in the same staging environment may not, even if its implementation is Scoped. Queue it or let the owner explicitly reprioritize; do not treat the label as permission to start a second integration stream.

## Coordination Artifacts

| Artifact                       | Purpose                                          | Lifecycle                                                 |
| ------------------------------ | ------------------------------------------------ | --------------------------------------------------------- |
| Canonical guide                | Current product, architecture, or runtime truth  | Update when truth changes.                                |
| Work index or existing tracker | Active boundaries and next decisions             | Close completed entries.                                  |
| Temporary specification        | Decisions too detailed for existing coordination | Create on demand; remove after authorized completion.     |
| Decision record                | Consequential choice and rationale               | Preserve history; link superseding decisions.             |
| Shared handoff                 | Continuation across sessions                     | Reuse active coordination; discard when no longer needed. |

A minimal specification can state the outcome, motivating problem, decisions, boundaries, risks, observable acceptance, and required verification. Omit fields that add no information; use the project's existing format.

For a durable decision record, capture context, choice, ramifications, and a reconsideration condition. Follow local ADR conventions and supersede accepted records instead of rewriting history.

## Background

ChangeShape focuses on ambiguity, recovery, coordination, and verification because code-production speed does not remove those constraints. It draws on small-batch delivery, outcome-based planning, lightweight decision records, and Shape Up's attention to boundaries. It does not require sprints, story points, a branching model, or an issue tracker.

## Changelog

Each entry lists behavior an adopted copy may need to change. Upgrade by applying every entry after the recorded version.

### 1.3.0

- Classification chooses the lightest shape that covers the change, names the triggers for Scoped and Shaped, and uses the heavier shape when reversal cost or detectability is uncertain.
- When state must survive the interaction and no coordination system exists, create a temporary specification for one active outcome or a work index for several entries.
- An explicit flow classifies before implementation and ends by returning the result; standalone use then reviews remaining candidates.
- Under OutcomeFlow, the selected outcome supplies the intended observable effect. Acceptance covers what implementation can demonstrate, delayed effects go to observation, and execution returns classification, evidence states, risks, and integration status.
- Restored from 1.1.0:
  - Named Shaped areas: domain or state models, contracts between runtimes, and authentication, authorization, privacy, and identity semantics.
  - Isolated unit tests do not verify a Scoped boundary.
  - Shaped work verifies each acceptance condition in every required environment.
  - For every shape, verification uses each required environment or a faithful substitute whose limits are stated. Reports give checks as run and observations actually obtained, and name every failed or unverified acceptance condition.
  - Initiatives are not decomposed into task trees in advance.
  - Unrelated outcomes stay split even when they share a repository, release, or agent.
  - Each subtask specifies exclusions and verification in addition to its outcome, scope, constraints, acceptance, and mutation authority.
  - Subagents stop and report product ambiguity, overlapping ownership, costly-to-reverse decisions, or scope expansion.
  - Documentation is also created when the user requests a durable document. Plans, completed work, and mentioned future ideas do not justify documentation, and progress journals, diaries, and verification transcripts are excluded.

### 1.2.0

- Condensed into an operating contract; examples and artifact guidance moved to this reference.
- Infer the authorized endpoint and continue through verification and repairs. Prior approval and previously approved acceptance criteria carry forward.
- Announce classification only when it explains a meaningful scope, coordination, or verification choice.
- On reclassification, continue within existing authority; pause only work that needs a new decision or permission.

### 1.1.0

- Recovery risk replaces irreversibility and covers detection, containment, rollback, data repair, compatibility recovery, and lasting consequences.
- Route consequential uncertainty to the owner or EvidenceProbe.
- Acceptance precedes integration; accepting a failed or unverified condition does not relabel the evidence.
- Under OutcomeFlow, also apply its one-Shaped-outcome default across the owner's ownership domain.

### 1.0.0

- Initial release.
