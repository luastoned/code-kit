---
name: adopt-change-shape
description: Audit or adapt ChangeShape in a target repository. Use only when explicitly requested as $adopt-change-shape.
---

# Adopt ChangeShape

Adapt the execution contract to the project's actual ownership, validation, and coordination needs. A request for an audit or recommendations is read-only; a request to adopt, apply, or synchronize authorizes the corresponding guidance edits. Infer mode from the conversation, including earlier authorization.

## Sources and Scope

Resolve symlinks to locate this skill in code-kit, then read `docs/workflows/change-shape.md` two directories above the skill directory, or use the source supplied by the user. It contains the canonical operating contract. If unavailable, check the known source location before requesting a path; do not invent a substitute contract.

Read its examples only for a classification or artifact-design question, and its changelog only when upgrading a recorded version. Following a link does not make every linked document required.

Identify the requested repository or project boundary. Read applicable `AGENTS.md` files and inspect relevant workflow rules, ownership, validation commands, active coordination, and version-control status. Follow additional document links only when they resolve an adoption question.

## Audit or Adoption

Compare behavior with the full operating contract, including its adoption requirements, not identical wording. Check the execution flow, classification, verification and risk acceptance, authorization and completion, coordination capacity, artifact lifecycle, and, when OutcomeFlow applies, the outcome handoff. Check mandatory paths when ProjectCompass is adopted; otherwise preserve local artifact placement.

In audit mode, report `compatible`, `partially compatible`, or `adoption recommended`, with material gaps and the smallest useful changes. Include the recorded and current versions; changelog entries not yet adopted are gaps. Missing examples, optional artifacts, or generic advice are not gaps. Stop without editing.

In adoption mode:

- Preserve local architecture, commands, security, release, ownership, and commit rules.
- Adapt the missing contract behaviors into existing workflow or agent guidance; do not copy the full reference or create a second classifier.
- Record the authorized endpoint and meaningful escalation conditions. Prior authorization and delegated decisions remain valid through verification and repairs.
- Treat solo-owner concurrency limits as defaults for that operating model; preserve explicitly delegated ownership.
- Reuse existing coordination. Outside ProjectCompass's required Shaped specifications, create a work index or temporary specification only for active work whose boundaries must survive and have no adequate home.
- Reconcile selected active work with classification, authority, acceptance, verification, and required coordination. Under ProjectCompass, ensure every selected Shaped outcome has its required specification. Do not manufacture candidates or reclassify an entire backlog.
- Make operating guidance reachable from the owning `AGENTS.md`. Preserve the trigger, behavior, defaults, exceptions, and completion of each obligation; record owner-approved departures with reasons rather than silently weakening them.
- Consolidate duplicate guidance within the requested scope. Remove material history only when its removal is authorized.

## Version

When retiring an existing EvidenceProbe section or active probe, fold applicable local rules into the investigation route, preserve active investigations and decisions in their existing coordination home without resetting or relabeling evidence, and remove the separate method name and obsolete skill links. Any separately authorized coordination migration must preserve that state and repair its references.

Keep the adopted rules together in one section of the target guidance and start that section with the source version on its own line: `Version: x.y.z`. Under ProjectCompass, that section lives in the linked project-wide workflow document, not `AGENTS.md`. The line lets later runs see whether an update exists; add no other provenance.

- No recorded version: compare with the full contract, then record the current version.
- Lower recorded version: read the entries after it in the `Changelog` section of `docs/workflows/references/change-shape.md`, adapt only those changes while preserving local adaptations, then update the line.
- Same version: no version upgrade; still audit and repair drift within the authorized scope.
- Higher recorded version: the code-kit checkout is stale. Report it and leave the section unchanged.

## Completion

Verify that required behavior and active-work reconciliation are established, not merely described as future work. Record a new version only after its required changes are in place. Report unresolved mandatory decisions or conflicting instructions as incomplete adoption; do not override them or claim success based on a version line.

Check changed links, Markdown, and the final diff for conflicting authorities or duplicated rules. Run relevant local checks and `git diff --check` when Git is available. Fix issues introduced by the change before handing back.

Report the files changed, where the operational rules live, the recorded version, material local adaptations, and verification or unresolved decisions. Adoption does not authorize implementing product work, publishing, or integrating unrelated changes.
