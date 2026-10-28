# ProjectCompass Examples and Migration

The [operating contract](../project-compass.md) owns requirements. These examples illustrate application, not extra required documents.

## Small New Project

A local scheduling tool can begin with three short planning documents plus the workflow document: the project guide names its users, promise and non-goals; the roadmap identifies one useful scheduling outcome; architecture records local storage and ownership decisions, or the decisions still open. No framework selection is needed merely to complete the documents. A Shaped persistence decision gets one work specification; a label correction does not.

Keep the versioned operating sections in `docs/workflow.md`, not in the agent entrypoint or a new single-file process subfolder. A compact `AGENTS.md` route can require classification and relevant verification, then point selection and observation to OutcomeFlow, non-Direct or uncertain execution to ChangeShape, and documentation ownership/lifecycle to ProjectCompass. This saves always-loaded context without weakening the rules or requiring every method for a typo fix.

## Existing Multi-App Project

An established `docs/process/workflow.md` can remain when the folder also groups related process documents. Reuse that authoritative file and route to it; do not create a competing `docs/workflow.md` merely to match the new-project default.

Keep detailed product goals and app-specific interface documents. Make `docs/README.md` the direction and navigation entrypoint and `docs/architecture.md` the overview of system ownership, linking to the details. Consolidate the old work index into `docs/roadmap.md`; move active Shaped specifications from a differently named folder to `docs/work/`, repairing links. Do not duplicate all product goals or architecture contracts in the new entrypoints.

If a tracker already holds execution detail, the roadmap links to it while owning selection and observation. A Shaped specification can link to authoritative acceptance details there, but must still make the outcome, boundaries, and verification route understandable. Do not maintain two copies of the same status checklist.

## Existing Roadmap and Archives

Keep a useful roadmap's outcome sequencing, not its accumulated implementation diary. Promote durable requirements into product or architecture documentation. Preserve an established archive if its retention is required; distinguish historical decisions from current contracts and repair references after moves. Ask before discarding material history. Old completed specs do not need to be rewritten into current work specs.

A roadmap calling compilation complete while architecture calls it future work is a conflict to reconcile, not a reason to copy either claim blindly. Inspect the relevant implementation and verification evidence; retain uncertainty where evidence is missing.

## Development-Only Planning

A firmware fork may prohibit internal design studies from upstream PRs. Do not introduce planning documents onto a production branch merely to satisfy standard paths. Ask which authorized development checkout should own `docs/`, or obtain a documented placement exception. Keep branch/revision context when it changes the meaning of a design or evidence. Build success is not proof of physical hardware timing; neither is moving a document into architecture.

## Work Specification

A selected Shaped outcome can use these headings: Outcome and motivation; Authority and scope; Decisions; Risks; Slices; Acceptance; Verification. Include only meaningful content under them. Keep unresolved decisions and their owners visible. Distinguish implementation acceptance from effects that require later use; the latter belong to roadmap observation triggers. No mandatory review pause is added when the owner has already approved criteria or delegated the relevant choice.

After delivery and closure, move lasting requirements and rationale into product or architecture documentation and live observation triggers into the roadmap. Then remove `docs/work/<outcome>.md` if safe and authorized and repair links. Do not remove it while it owns unresolved acceptance or ongoing decisions. An established archive policy or user-owned history takes precedence over default removal; retained completed records are historical, not current operating truth.

## Changelog

### 1.0.0

- Keep full versioned contracts in `docs/workflow.md` by default, with compact conditional routing and immediate execution boundaries in `AGENTS.md`. Reuse an appropriate existing workflow home, including an established process folder grouping related documents; do not create that folder solely for the workflow file.
- After authorized delivery and closure, promote durable content and live observation triggers, then remove completed work specifications only when safe and authorized. Preserve unresolved work, user history, and explicit retention policies; repair links and distinguish retained history from active work.
- Establish coherent direction and standard `docs/README.md`, `docs/roadmap.md`, and `docs/architecture.md` entrypoints.
- Make the roadmap own selection and observation; require `docs/work/<outcome>.md` for selected Shaped work, not Direct or Scoped work by default.
- Adopt and route to separate OutcomeFlow and ChangeShape contracts, preserving their authority, verification, and attention limits.
- Migrate existing information and links, preserve material history and publication boundaries, and require explicit decisions for structural exceptions.
- Complete adoption only after documentation, active work, triggers, and agent routing are reconciled; do not start implementation or invent work to demonstrate completion.
