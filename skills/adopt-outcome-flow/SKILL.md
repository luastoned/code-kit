---
name: adopt-outcome-flow
description: Audit or adapt OutcomeFlow to a project's delivery practices. Use only when explicitly requested as $adopt-outcome-flow.
---

# Adopt OutcomeFlow

Adapt delivery decisions and information ownership to the target. Audit or advice requests are read-only; adoption, application, and synchronization requests authorize relevant workflow edits. Reuse the mode and authority established in the conversation.

## Sources and Scope

Resolve symlinks to this skill and read `docs/workflows/outcome-flow.md` from the code-kit root two directories above it, or use the user's source path. If missing, check the known source location before requesting its path.

The document is the canonical operating contract. Read ChangeShape when assessing or adding execution behavior; an established local execution method must have a concrete mapping covering the contract's required execution behavior, not just a compatibility claim. Load examples only for an unresolved adoption question.

Stay within the repositories placed in scope. Read applicable agent instructions and inspect the delivery decisions, ownership, checks, release boundaries, and active coordination relevant to adoption. Do not recursively read every linked product, architecture, or operational document.

## Audit or Adoption

Compare actual behavior with the contract, including its adoption requirements: durable direction, outcome selection, decision authority, the handoff to and from execution, attention limits, delayed observation, reconsideration, and information lifecycle. Local terminology is acceptable; obligations cannot be omitted as generic advice. Check standard homes when ProjectCompass is adopted without imposing them on standalone adoption.

In audit mode, report `compatible`, `partially compatible`, or `adoption recommended`. Identify only material gaps and the smallest useful adoption. Include the recorded and current versions; changelog entries not yet adopted are gaps. A missing metric, Initiative, tracker, or probe is not a gap when the project does not need it. Stop without editing.

In adoption mode:

- Preserve local systems, commands, security, ownership, release rules, and existing user decisions.
- Put missing durable rules in existing project or agent guidance. Create a compact document only when the necessary truth has no appropriate home.
- Identify authoritative direction and coordination homes and route agents from the owning `AGENTS.md`. Reconcile selected work, candidates, and live triggers; state when nothing is selected. Define who updates selection, delivery, and reconsideration state and when. Record explicit owner-approved departures and their reasons.
- Reuse compatible execution and bounded-decision methods. If execution rules are missing, adapt the ChangeShape contract without requiring a separate skill invocation.
- Ordinary implementation choices and owner preferences do not require an experiment.
- Preserve delegated selection and acceptance. A selected request need not be selected again, and verification should continue through repairs to the authorized endpoint.
- Keep release and deployment subject to their own authorization.
- Apply the solo-owner attention defaults unless the owner has delegated independent integration capacity.
- Keep delayed evidence triggers separate from active delivery, and review live triggers before selecting the next outcome. Do not invent direction, work, metrics, automations, or dependency inventories.
- Reuse one coordination system. Create or consolidate artifacts only when active boundaries or live triggers justify them and the requested scope permits it. Preserve material history unless removal is authorized.

## Version

When retiring an existing EvidenceProbe section or active probe, fold applicable local rules into the investigation route, preserve active investigations and decisions in their existing coordination home without resetting or relabeling evidence, and remove the separate method name and obsolete skill links. Any separately authorized coordination migration must preserve that state and repair its references.

Keep the adopted rules together in one section of the target guidance and start that section with the source version on its own line: `Version: x.y.z`. Under ProjectCompass, that section lives in the linked project-wide workflow document, not `AGENTS.md`. The line lets later runs see whether an update exists; add no other provenance.

- No recorded version: compare with the full contract, then record the current version.
- Lower recorded version: read the entries after it in the `Changelog` section of `docs/workflows/references/outcome-flow.md`, adapt only those changes while preserving local adaptations, then update the line.
- Same version: no version upgrade; still audit and repair drift within the authorized scope.
- Higher recorded version: the code-kit checkout is stale. Report it and leave the section unchanged.

When adoption adapts ChangeShape, keep it in its own section with its own version line. Upgrade an existing code-kit ChangeShape section the same way using `docs/workflows/references/change-shape.md`. An equivalent local execution method records no ChangeShape version.

## Completion

Verify the required operational rules, execution mapping, document routing, and current-work reconciliation. Record a new version only after its required changes are established. Report unresolved mandatory decisions or conflicts as incomplete adoption; a version line or planned future compliance is insufficient.

Check affected Markdown, links, local validation, and the final diff for contradictions or duplicate authorities. Run `git diff --check` when applicable and repair issues introduced by the changes.

Report the changed files, where delivery and execution rules live, the recorded versions, important adaptations, validation, and unresolved decisions. Do not start a product outcome merely to demonstrate adoption.
