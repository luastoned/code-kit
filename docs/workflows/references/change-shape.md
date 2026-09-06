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
