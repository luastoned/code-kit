# ChangeShape

> An agent-native method for classifying and coordinating software changes.
>
> Version 1.0.0

ChangeShape is a lightweight workflow for a product owner/developer working with AI agents. It classifies work by the shape of the change rather than estimated human effort.

Its purpose is to make product decisions, review, integration, and verification explicit without creating a second implementation history in documentation.

## Why Change Shape

Agent-assisted implementation can be much faster than traditional human-only development. Duration, story points, lines changed, and file count therefore describe work poorly.

The constraints that remain scarce are:

- product attention
- ambiguity and decision load
- blast radius
- irreversibility
- coordination across boundaries or sessions
- verification difficulty
- human review capacity

ChangeShape uses those constraints to decide how work should be executed and whether persistent coordination is justified.

## Principles

1. **Classify before planning.** Determine the change shape before choosing artifacts or process.
2. **One active Shaped outcome, one integration owner.** A single product owner/developer should not carry competing integration streams; parallel assistance does not create parallel product authority.
3. **Prefer bounded execution.** Use the smallest coherent, independently valuable change.
4. **Persist only what must survive.** Conversation handles disposable planning; documents preserve durable truth and necessary cross-session decisions.
5. **Separate direction from execution.** An Initiative is not an agent task.
6. **Verify according to risk.** Generated-code speed never reduces the evidence required for acceptance.
7. **Keep history in its native systems.** Version control records implementation; CI records automated checks when present; canonical docs record current truth.
8. **Respect local ownership.** Adopt the behaviors inside a repository's existing structure instead of imposing filenames.

## Change Dimensions

Evaluate work across five dimensions:

| Dimension       | Low end                               | High end                                                  |
| --------------- | ------------------------------------- | --------------------------------------------------------- |
| Ambiguity       | One conventional interpretation       | Material product or technical choices remain              |
| Blast radius    | Local implementation detail           | Several owners, runtimes, consumers, or user journeys     |
| Irreversibility | Easy to revert without lasting effect | Data, API, security, identity, or dependency consequences |
| Coordination    | One coherent edit and review boundary | Several slices, sessions, contributors, or agents         |
| Verification    | Fast deterministic local check        | Multiple environments, migrations, devices, or humans     |

Classification is qualitative. Do not total scores or translate dimensions into estimated time.

## Executable Shapes

### Direct

Use Direct when ambiguity, blast radius, irreversibility, coordination, and verification difficulty are all low. The outcome is clear, the implementation is conventional and local, and there is no material product or architecture choice.

Typical examples:

- a known bug with an identified cause
- a copy or focused styling correction
- a targeted test
- confirmed dead-code removal
- a small configuration correction

Execution:

`inspect -> implement -> verify -> integrate`

Verification:

- perform the smallest relevant check during the current interaction
- report the command as run and its result
- when a command is not applicable, directly inspect or exercise the observable result and report that evidence

Coordination:

- no persistent work entry
- no specification
- update canonical documentation only when current truth changes

### Scoped

Use Scoped when ambiguity and irreversibility remain low, but blast radius or verification crosses several connected parts. The work remains inside one ownership area, has one clear approach, and can be reviewed as one coherent outcome.

Typical examples:

- a page with an agreed design
- a refactor inside one feature or store
- a field carried through UI, state, persistence, and tests
- a mechanical repository-wide migration
- repair of one complete game or request flow

Execution:

`inspect -> brief disposable plan -> implement -> verify -> integrate`

Verification:

- exercise the integrated outcome through the actual application flow, request path, CLI path, build artifact, repository-wide check, or nearest faithful environment
- run relevant automated checks and report the commands as run and their results
- do not treat an isolated unit suite as sufficient evidence when the outcome crosses connected parts

Coordination:

- keep the plan in the active conversation
- no persistent specification by default
- do not promote work merely because it touches many files

### Shaped

Use Shaped when ambiguity, blast radius, irreversibility, coordination, or verification difficulty is materially high. The work contains a consequential decision, crosses a durable boundary, changes high-consequence state, or needs several independently reviewable slices.

Any of these normally triggers Shaped work when the change alters semantics, ownership, contracts, persisted state, or risk. Merely touching code in one of these areas does not:

- multiple reasonable product interpretations
- a new domain or state model
- persisted-data migration
- frontend/backend or other runtime contract
- authentication, authorization, privacy, location, or security semantics or controls
- public API, plugin, or contributor contract semantics
- an irreversible or costly dependency decision
- coordination that must survive sessions
- several slices that must preserve shared invariants
- verification across multiple environments or physical devices
- failure that could corrupt data or invalidate compatibility

Execution:

`investigate -> decide boundaries -> record essential shape -> implement and assemble slices -> verify -> integrate -> accept`

Verification:

- satisfy the recorded verification conditions item by item before acceptance
- exercise affected boundaries in every required environment or faithful substitute
- report the evidence actually observed and identify every failed or unverified condition

Coordination:

- list active Shaped work in the work index or equivalent coordination surface when one is needed
- create one temporary work spec only when the index cannot safely preserve the decisions, boundaries, risks, and acceptance
- merge durable outcomes into canonical documentation
- remove the completed work entry and temporary spec; retain history in version control when present

## Strategic Direction

### Initiative

Use Initiative for strategic direction containing multiple independently valuable outcomes.

Typical examples:

- online multiplayer
- account and cloud identity
- a party-session platform
- a plugin ecosystem
- a complete visual redesign

An Initiative is not executable. Select one end-to-end Shaped slice, learn from it, and reshape subsequent work.

Coordination:

- keep the direction in a product or project guide
- avoid detailed task trees for distant work
- do not hand an entire Initiative to an agent

## Classification Decision

The questions below operationalize the five change dimensions. Use them in this order:

1. **Coordination:** Does the request contain more than one independently valuable outcome?
   - Yes, and they share one coherent strategic direction: classify the direction as an Initiative and select one independently valuable Shaped slice.
   - Yes, but they are unrelated: split them and classify each outcome separately.
2. **Ambiguity, blast radius, and irreversibility:** Does it alter product meaning, durable contracts, persisted data, security, privacy, identity, or runtime ownership?
   - Yes: classify it as Shaped.
3. **Verification and irreversibility:** Does acceptance or recovery require migrations, multiple environments or devices, substantial manual judgment, or a difficult rollback?
   - Yes: classify it as Shaped.
4. **Coordination:** Must decisions or invariants survive several sessions, slices, or independent contributors?
   - Yes: classify it as Shaped.
5. **Ambiguity, blast radius, and verification:** Is there one clear approach inside one ownership area?
   - Yes, local and obvious: Direct.
   - Yes, with several connected parts: Scoped.
   - No: Shaped.

When uncertain between two shapes, choose the lighter shape only if a failed assumption is cheap to reverse and easy to detect.

## Interaction Protocol

1. Inspect enough context to classify the outcome before implementation.
2. Announce the classification and reason in one concise line, for example: `Scoped: one ownership area; the integrated request path must be exercised.`
3. Omit the announcement only for a typo-level, single-file edit with no behavior change.
4. Let the human owner raise the classification directly. Before accepting a lower classification, state which safety, coordination, or verification consequence the downgrade would discard.
5. Treat classification as provisional. When implementation or verification reveals a different change shape, pause before expanding scope or integrating, announce the new classification and reason, and adopt its verification and coordination requirements.
6. Report verification with one of these states:
   - `verified`: the command was run or the behavior was directly exercised, and the observed result supports acceptance
   - `failed`: verification was performed and did not satisfy acceptance
   - `unverified`: verification could not be performed; state why and name the remaining risk
7. Treat `failed` and `unverified` as blocking integration by default. Proceed only when the human owner explicitly accepts the named failure or residual risk. Acceptance permits integration but does not change the verification state to `verified`.
8. Keep classifications, commands, results, and overrides observable during the active interaction and disposable after integration. Preserve them only when they change canonical truth or a consequential decision must remain understandable.

## Coordination Artifacts

| Artifact                | Purpose                                            | Lifecycle                                       |
| ----------------------- | -------------------------------------------------- | ----------------------------------------------- |
| Canonical guide         | Current product, architecture, or runtime truth    | Update only when truth changes                  |
| Work index              | Active Shaped work and a few deliberate candidates | Keep small; remove completed entries            |
| Temporary work spec     | Decisions the index cannot safely retain           | Create on demand; remove after integration      |
| Decision record         | Consequential decision and ramifications           | Use only when future readers need the rationale |
| Version-control history | Implemented change history                         | Permanent                                       |
| CI/check output         | Automated verification evidence                    | Keep in the owning system                       |
| Conversation            | Direct/Scoped plans and transient reasoning        | Disposable                                      |

Do not create progress journals, continuity ledgers, daily summaries, completed-task indexes, or verification transcripts as routine project documentation.

## Work Index

Use a work index only when coordination needs to survive the current interaction.

Treat the work index as a role, not a required repository file. An existing issue tracker or project board can satisfy it when it preserves the active outcome, boundaries, and next decision without creating a parallel source of truth.

Keep:

- at most one active Shaped outcome per repository
- at most two or three deliberately queued candidates
- an outcome and next decision or trigger for each item
- a link to a temporary spec only when one exists

Direct or Scoped work may interrupt the active outcome only when it is inexpensive and does not create a competing integration stream or displace the owner's integration attention.

Do not use it as:

- a comprehensive backlog
- an implementation checklist
- a completed-work archive
- a fixed multi-month promise
- a mirror of an issue tracker

Strategic direction belongs in the canonical product guide, not as deeply specified future work.

## Decision Records

Use a decision record only when a consequential choice and its rationale must remain understandable after the active work is complete. Typical candidates include data ownership, identity, transport, security, persistence, public contracts, and major framework boundaries.

Keep the record brief: capture the context, decision, significant ramifications, and any condition that should trigger reconsideration. Preserve accepted records as history and link to a superseding decision instead of rewriting them when the choice changes.

Use the repository's Architecture Decision Record (ADR) convention when one exists; do not impose a location or naming scheme.

## Minimal Shaped Spec

Use only the sections that carry necessary information:

```markdown
# Outcome

## Problem

The concrete behavior or constraint motivating the change.

## Decisions

Choices already made and why they matter.

## Boundaries

What is in scope and explicitly out of scope.

## Risks

Unknowns, migrations, compatibility, security, or recovery concerns.

## Acceptance

Observable behavior that must hold.

## Verification

Checks and environments required before acceptance.
```

Do not add progress percentages, session notes, implementation diaries, completed-task history, or speculative task breakdowns.

## Agent Coordination

- Keep priority, product meaning, irreversible decisions, and final acceptance with the human product owner/developer.
- Assign one primary agent as integration owner. It coordinates implementation, integration, and verification within the authority the human owner granted.
- Use additional agents only for independent research, review, verification, or non-overlapping implementation when the primary agent and human owner have capacity to review and integrate the results. Unused agent capacity is not a reason to parallelize.
- Give every agent an outcome, scope, exclusions, acceptance, verification, and mutation authority.
- Do not let independent agents modify the same ownership area concurrently without an explicit integration plan.
- Require subagents to stop and report when they encounter product ambiguity, overlapping ownership, an irreversible decision, or a necessary scope expansion.
- Treat agent plans and reports as disposable unless they change durable truth.
- Require the integration owner to inspect the combined diff and run risk-proportionate verification.
- When an active Shaped outcome must cross sessions, allow at most one shared, short-lived handoff in its existing work index or temporary spec.
- Do not create separate planning, progress, state, or handoff documents for individual agents.

## Documentation Rules

Create or change documentation only when:

- durable product, architecture, runtime, or contributor truth changed
- a Shaped decision must survive the current interaction
- a current work boundary or unresolved risk must be coordinated later
- the user explicitly requests a durable document

Do not trigger documentation solely because:

- many files changed
- an agent produced a plan
- a check passed
- a session ended
- work was completed
- a future idea was mentioned

Mechanical breadth does not imply Shaped work. A formatter migration across one hundred files may be Scoped; a five-line identity or persistence change may be Shaped.

## Lifecycle

1. Capture the request without expanding it into a backlog.
2. Inspect enough context to classify its change shape.
3. Announce the classification and resolve material ambiguity before implementation.
4. Select the lightest justified execution, verification, and coordination path.
5. Implement one coherent outcome through small integrated slices, reclassifying when evidence changes its shape.
6. Verify according to the shape's contract, blast radius, irreversibility, and environment.
7. Resolve failed or unverified conditions before integration unless the human owner explicitly accepts the named risk.
8. Obtain human acceptance for product meaning and experience.
9. Merge durable truth into canonical docs.
10. Remove temporary coordination artifacts and completed work entries.
11. Reconsider the next candidate using what was learned.

## Influences

ChangeShape is compatible with outcome-based roadmapping, small-batch delivery, trunk-based integration, lightweight decision records, and Shape Up's emphasis on boundaries and risk. It deliberately replaces time appetite and effort sizing with change-shape classification for agent-assisted work.

It does not require Scrum, story points, sprints, a specific issue tracker, a particular branching strategy, or fixed repository filenames.
