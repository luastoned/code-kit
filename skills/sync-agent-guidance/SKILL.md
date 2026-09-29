---
name: sync-agent-guidance
description: Audit or adapt code-kit guidance to a target project. Use only when explicitly requested as $sync-agent-guidance.
---

# Sync Agent Guidance

Adapt source guidance to the target while preserving intentional conventions and their strength. Consider every section of each selected guide, but size the result to what the target maintains; reproducing every heading or section is not required. Audit requests are read-only; sync, create, update, and resynchronize requests authorize the relevant guidance changes.

## Discovery

Resolve symlinks to this skill, then locate `guidance/` in the code-kit root two directories above it, or use the user's source path. Confirm the source entrypoint and repository guide exist; check known source locations before asking for a missing path.

Read source `AGENTS.md` for guide routing and applicability conventions. Read `Repositories.md` when choosing root versus nested placement or resolving ownership and commit rules. Load language and specialty guides whose `Applies when` blocks match maintained areas or explicitly planned setup in the target.

Inspect applicable target instructions, manifests, hidden tool configs, ownership boundaries, local commands, and relevant developer docs. Use `rg --files --hidden` with generated, dependency, and Git internals excluded. Ignore incidental examples, vendor code, and one-off files unless their maintenance is in scope.

Private guidance is opt-in. When requested, read `guidance/private/AGENTS.md` first if present, then only the guides it maps or the user names. Do not copy private material into public files without explicit publication authorization.

## Guidance Placement

Apply the Guidance Shape section of source `guidance/Repositories.md`: one `AGENTS.md` at the owning project root within the requested scope, with ownership determined from build entrypoints, manifest relationships, and actual commands. Create nested guidance only for an explicitly requested placement or materially different subtree rules, and state the concrete reason before creating it. Reuse existing nested guidance; the one-root default does not authorize deleting or flattening it.

Merge the selected guidance into that root `AGENTS.md` by default. Keep separate guide files only when the target already uses them or when several maintained languages each carry enough guidance that one file would obscure routing; link them from the root.

## Adaptation Criteria

Consider each selected source section for retention, merging, adaptation, or omission using its `Applies when` block and individual rule conditions. No section or shared rule set is included unconditionally. Determine applicability from the target's code, manifests, tooling, docs, existing instructions, and stated plans, not merely the current edit. Retain rules for maintained work and explicitly planned setup; omit unrelated operating areas. Preserve conditional defaults whose trigger is introducing a capability relevant to that work, so they apply before it exists. Do not invent future capabilities to justify retaining a section. Keep applicable primary-language guidance recognizable, with repository rules as compact supporting constraints.

Preserve each applicable contract's trigger, required behavior, intentional defaults, exceptions, and completion condition. Shorten explanations and duplication, not meaning or strength. Omit material only when its trigger is outside the target's maintained or planned work, equivalently covered by retained guidance or actual tooling enforcement, or explicitly superseded by local policy. Sections adopted from code-kit workflows count as retained guidance; do not duplicate their rules elsewhere. Keep related rules together without mechanically copying headings or applicability blocks; preserve the conditions in the adapted wording. If unsure whether to merge, adapt, or omit a section without losing intent, ask the user before deciding; continue independent work.

Select rules from source `guidance/AGENTS.md` by the same applicability test as language and operational guidance. Lack of a mapped language guide, installed tooling, or a current example does not alone make a trigger inapplicable. A missing test suite does not make Test Work inapplicable: its boundaries govern verification and proposed test infrastructure before tests exist. Tooling may cover mechanical requirements; retain applicable human-judgment rules and rules for files it does not cover. Formatter, linter, or test-policy silence is not enforcement. Keep one compact canonical copy of retained rules in the target and retarget guide links to it. Standalone exports include applicable rule text instead of unavailable links. When explicit target policy conflicts, follow it and report the conflict instead of silently discarding either rule.

Follow local scope, architecture, security, deployment, commands, and ownership rules. Tool configuration governs the behavior it owns; shared language preferences fill gaps. A shared dependency or style preference is not permission to migrate tooling.

For a new project, use the known language and stated setup to select useful constraints without inventing a runtime, framework, package manager, or commands. When establishing commit policy, apply the source default unless explicit local policy differs; Git need not already be initialized for that trigger to apply.

For a single project, keep shared boundaries and project-specific implementation constraints together in root guidance. For genuinely distinct subprojects, keep shared rules at the root and scoped differences at their owning boundary without duplicating inherited rules. Preserve explicit user choices and existing authorization; define meaningful completion and escalation conditions rather than repeated approval gates.

## Audit

Compare meaning and likely behavior. Report `current` when no material decision-relevant drift exists, or `resync recommended` for missing constraints, obsolete instructions, conflicting authorities, newly relevant behavior, or substantial guidance for areas the target does not maintain.

Give locations, consequences, and minimal revisions. Report important intentional overrides. Text differences, heading order, missing generic sections, timestamps, absent provenance metadata, and rules carried by adopted workflow sections do not establish drift. Do not edit or format in audit mode.

## Sync and Completion

Merge into existing guidance and referenced guides. Keep each retained subject coherent, but change headings or combine sections when that improves routing. Remove obsolete or duplicate instructions within scope; preserve unrelated user content.

Do not add version stamps, provenance comments, locks, or tracking files. Leave sections adopted from code-kit workflows, including their `Version:` lines, to the workflow adoption skills. Do not copy shared documentation wholesale or create parallel authorities.

Compare the result with the considered source sections for lost obligations, weakened defaults, conflicting rules, broken paths, needless mandatory reading, and accidental permission changes. Check that retained rules have evidence-backed triggers and omitted rules do not lose relevant setup-time defaults; preserve existing local constraints and ask about uncertain removals. Remove redundant explanations. Check that every new nested `AGENTS.md` has a concrete scoping need rather than merely mirroring a folder. Run relevant local checks and fix introduced issues. Report changed files, placement rationale, guides used, material applicability decisions or local adaptations, and unresolved conflicts or validation limits.

Check retained permissions as well as restrictions, including disposable-test allowances and limits on temporary harnesses. Do not turn a required setup action into an optional action that applies only if someone chooses to introduce it. Preserve useful target-specific commands and workflows. For detailed policies enforced by local tooling, reference existing target policy documentation instead of an incomplete paraphrase; retain semantic judgment and coverage for unlinted files.
