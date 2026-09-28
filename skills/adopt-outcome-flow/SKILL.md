---
name: adopt-outcome-flow
description: Audit or adapt OutcomeFlow to a project's delivery practices. Use only when explicitly requested as $adopt-outcome-flow.
---

# Adopt OutcomeFlow

Adapt delivery decisions and information ownership to the target. Audit or advice requests are read-only; adoption, application, and synchronization requests authorize relevant workflow edits. Reuse the mode and authority established in the conversation.

## Sources and Scope

Resolve symlinks to this skill and read `docs/workflows/outcome-flow.md` from the code-kit root two directories above it, or use the user's source path. If missing, check the known source location before requesting its path.

The document is the canonical operating contract. Read ChangeShape when assessing or adding execution behavior; an established compatible execution method does not require rereading its reference. Read EvidenceProbe when a consequential decision route needs detailed treatment. Load examples only for an unresolved adoption question.

Stay within the repositories placed in scope. Read applicable agent instructions and inspect the delivery decisions, ownership, checks, release boundaries, and active coordination relevant to adoption. Do not recursively read every linked product, architecture, or operational document.

## Audit or Adoption

Compare actual behavior with the contract: durable direction, outcome selection, decision authority, the handoff to and from execution, attention limits, delayed observation, reconsideration, and information lifecycle. Equivalent local terminology and methods are acceptable.

In audit mode, report `compatible`, `partially compatible`, or `adoption recommended`. Identify only material gaps and the smallest useful adoption. Include the recorded and current versions; changelog entries not yet adopted are gaps. A missing metric, Initiative, tracker, or probe is not a gap when the project does not need it. Stop without editing.

In adoption mode:

- Preserve local systems, commands, security, ownership, release rules, and existing user decisions.
- Put missing durable rules in existing project or agent guidance. Create a compact document only when the necessary truth has no appropriate home.
- Reuse compatible execution and bounded-decision methods. If execution rules are missing, adapt the ChangeShape contract without requiring a separate skill invocation.
- Keep EvidenceProbe optional; ordinary implementation choices and owner preferences do not require an experiment.
- Preserve delegated selection and acceptance. A selected request need not be selected again, and verification should continue through repairs to the authorized endpoint.
- Keep release and deployment subject to their own authorization.
- Apply the solo-owner attention defaults unless the owner has delegated independent integration capacity.
- Keep delayed evidence triggers separate from active delivery, and review live triggers before selecting the next outcome. Do not invent direction, work, metrics, automations, or dependency inventories.
- Reuse one coordination system. Create or consolidate artifacts only when active boundaries or live triggers justify them and the requested scope permits it. Preserve material history unless removal is authorized.

## Version

Keep the adopted rules together in one section of the target guidance and start that section with the source version on its own line: `Version: x.y.z`. The line lets later runs see whether an update exists; add no other provenance.

- No recorded version: compare with the full contract, then record the current version.
- Lower recorded version: read the entries after it in the `Changelog` section of `docs/workflows/references/outcome-flow.md`, adapt only those changes while preserving local adaptations, then update the line.
- Same version: nothing to upgrade.
- Higher recorded version: the code-kit checkout is stale. Report it and leave the section unchanged.

When adoption adapts ChangeShape, keep it in its own section with its own version line. Upgrade an existing code-kit ChangeShape section the same way using `docs/workflows/references/change-shape.md`. An equivalent local execution method records no ChangeShape version.

## Completion

Check affected Markdown, links, local validation, and the final diff for contradictions or duplicate authorities. Run `git diff --check` when applicable and repair issues introduced by the changes.

Report the changed files, where delivery and execution rules live, the recorded versions, important adaptations, validation, and unresolved decisions. Do not start a product outcome merely to demonstrate adoption.
