# ProjectCompass

> Establish project direction and standard documentation homes, then select and deliver outcomes.
>
> Version 1.0.0
>
> Status: Released

Use ProjectCompass when starting a project or aligning an existing project's planning and documentation. It establishes the foundation for [OutcomeFlow](./outcome-flow.md) selection and [ChangeShape](./change-shape.md) execution; it does not introduce another classifier or delivery process.

## Operating Contract

### Direction and Authority

Establish who the project serves, the problem it solves, its overall promise, observable success, decision principles, constraints, and non-goals. Distinguish long-term direction from the first useful outcome. Derive existing direction from project evidence and owner decisions; resolve consequential contradictions with the owner instead of inventing a vision or silently choosing between conflicting goals.

Clarify only unknowns that affect direction or the next outcome. Honor prior decisions and delegated choices. Do not choose a stack, invent metrics, or expand a vision into an exhaustive feature backlog merely to fill a plan. Investigate only when consequential uncertainty blocks action and bounded evidence can change it; ordinary reversible choices and preferences need no experiment.

Adoption authorizes documentation and guidance restructuring within the requested project, not product implementation, priority changes, dependency installation, branch integration, publication, or deployment. Preserve local security, review, release, and publication boundaries. If standard placement conflicts with an explicit boundary, obtain a decision about the location or an exception before moving affected material; continue independent authorized work.

### Documentation Homes

Establish these standard entrypoints, with substantive project-specific content rather than empty templates:

| Home                     | Owns                                                                                                                                                                                         |
| ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docs/README.md`         | Vision, audience, goals, success, constraints, non-goals, and documentation navigation.                                                                                                      |
| `docs/roadmap.md`        | Selected outcome or explicit absence of one, immediate candidates, broad later direction and sequencing rationale, unresolved selection decisions, and live observation triggers.            |
| `docs/architecture.md`   | System responsibilities, boundaries, accepted design decisions and rationale, and links to detailed contracts. Distinguish implemented behavior from accepted but unimplemented design.      |
| `docs/workflow.md`       | ProjectCompass, OutcomeFlow, and ChangeShape operating sections, reached through compact agent-guidance routing. Existing placement may be retained as described below.                      |
| `docs/work/<outcome>.md` | One selected Shaped outcome's scope, decisions, authority, risks, implementation slices, acceptance, and verification. Create on selection as Shaped, not for every candidate or minor edit. |

The root README remains the public purpose/setup entrypoint and links to `docs/README.md`. The workflow document owns the full operating rules; agent guidance owns compact conditional routing and immediate execution boundaries, not product plans. Larger projects may retain supporting product, architecture, runtime, design, or app-local documents. Standard entrypoints summarize and link to those authoritative details rather than reproducing them. Do not create empty subdirectories. If architecture is not yet decided, state the known constraints and unresolved decisions without presenting a proposed stack as fact.

The roadmap is the authoritative selection and observation index. An issue tracker may own detailed execution records linked from it, but must not become a competing priority list. Migrate an existing work index into the roadmap. Keep later direction provisional and outcome-based, not a speculative implementation tree. Record only dependencies that affect selection or sequencing.

### Selection and Execution

Keep ProjectCompass, OutcomeFlow, and ChangeShape as separate versioned sections in `docs/workflow.md` by default. Reuse an appropriate existing project-wide workflow document; `docs/process/workflow.md` may remain when its folder already groups related process documents. Do not create a process subfolder solely for this file. Move full operating sections out of `AGENTS.md`; preserve their obligations and repair links rather than duplicating them. Keep only compact routing and immediate execution boundaries in agent guidance.

That routing must require classification before implementation, proportionate verification, and respect for existing authority. Read OutcomeFlow when selecting, delivering, or reconsidering outcomes; read ChangeShape before non-Direct or uncertain work and for acceptance, integration, or risk decisions; read ProjectCompass when changing direction, documentation ownership, or the specification lifecycle. Routine Direct edits need no full workflow reread or documentation tour. Conditional loading does not make applicable obligations optional.

OutcomeFlow selects and revisits outcomes against project direction. The responsible implementation agent updates the roadmap when authorized selection, delivery state, or observation changes; the owner retains undelegated priorities and product decisions. Keep no more active Shaped work than the adopted ownership limits permit. A clear request already selects its outcome; do not ask for selection again.

ChangeShape classifies before implementation and owns acceptance and verification. Under ProjectCompass, every selected Shaped outcome has a specification at `docs/work/<outcome>.md` before consequential implementation; reconcile already-active Shaped work during adoption. Include the intended effect and why it matters, scope/non-goals, decisions and unresolved owners, authorized endpoint, material risks, coherent slices when needed, observable acceptance, and verification environments. Keep required detail in the spec or explicitly linked authoritative documents, without duplicate checklists. Direct and Scoped work do not require specifications by default.

Implementation checks and delayed product effects remain distinct. Return execution evidence, risks, and remaining authorization to OutcomeFlow. Update the roadmap at delivery or reconsideration; use an observation trigger only when delayed evidence can change a future decision. Planning does not grant permission to implement the selected outcome.

### Migration and Lifecycle

For existing projects, map the current information to these homes, then move or consolidate it and repair inbound links and agent routing. Preserve decisions, constraints, acceptance conditions, unresolved verification, and material rationale. Reconcile stale claims against evidence; do not label a feature verified merely because a specification or commit says it is implemented. Ask about conflicting product decisions, uncertain removals, or inaccessible authoritative records rather than silently discarding them.

An accepted design may enter architecture before implementation, clearly labeled as such. After authorized delivery and closure, promote durable requirements, design, and consequential rationale from `docs/work/<outcome>.md` into their canonical homes and retain live observation triggers in the roadmap. By default, then remove the completed work specification and repair its links when deletion is safe and authorized. Do not remove a spec while it still owns unresolved acceptance, decisions, or evidence needed for ongoing work. If removal is not authorized, retain it and identify the pending cleanup rather than treating it as active work.

Preserve user-authored history and explicit retention policies; when local policy keeps completed specs, mark them historical and link current contracts instead of maintaining two authorities. Do not create an archive by default. Keep implementation narration and check transcripts in Git and native systems, not in the roadmap or architecture.

Structural exceptions require an explicit owner decision and a recorded reason and alternative home in the local workflow rules. Existing filenames alone are not an exception. A partial migration or unresolved mandatory decision must be reported as incomplete, not as successful adoption.

### Completion

Adoption is complete when direction is coherent enough to guide selection, standard documentation homes are populated and linked, current work and live triggers are reconciled, selected Shaped work has its required specification, and agent instructions enforce the delivery routing. Explicitly record no selected work when that is true; do not invent an outcome to demonstrate adoption. Report unresolved decisions and evidence limits. A version line or a description of the methods alone does not establish adoption.

## Supporting Material

Read [examples and migration guidance](./references/project-compass.md) for document sizing, existing-project migration, or publication-boundary questions. Read its changelog when upgrading. Use `$adopt-project-compass` to audit or establish this structure without starting product implementation.
