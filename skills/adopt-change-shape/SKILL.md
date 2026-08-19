---
name: adopt-change-shape
description: Audit or adopt the ChangeShape workflow in a project or repository, classifying work by ambiguity, blast radius, recovery risk, coordination, and verification instead of time estimates while minimizing persistent planning documentation. Use only when the user explicitly invokes `$adopt-change-shape` or names the `adopt-change-shape` skill.
---

# Adopt ChangeShape

## Overview

Adapt ChangeShape to a target repository without imposing a generic document tree. Preserve useful local conventions and add only the coordination mechanisms justified by active work. Remove or consolidate existing workflow artifacts only with clear authorization.

## Mode Selection

- Use **audit mode** when the user asks whether a repository follows ChangeShape, how its workflow differs, or whether adoption would help. Audit mode is read-only.
- Use **adopt mode** when the user asks to introduce, apply, migrate to, or synchronize ChangeShape.
- If the request names the skill but does not make the mode clear, inspect read-only and ask before changing project workflow files.

## Workflow

1. Resolve the canonical ChangeShape reference:
   - Use a source path supplied by the user.
   - Otherwise resolve symlinks to find this skill's directory, then use `docs/workflows/change-shape.md` from the code-kit root two directories above it.
   - Confirm the file exists and read it completely. Ask for its path if it does not.
   - When the canonical ChangeShape document links to `docs/workflows/evidence-probe.md`, read that document completely as the optional bounded-decision method. Do not require EvidenceProbe for standalone adoption.
2. Resolve the target scope from the request or current working directory. In a monorepo, inspect the repository root for parent guidance but use the narrowest ownership boundary that governs the requested work. Do not turn project-level adoption into a repository-wide change without clear authorization.
3. Read all applicable `AGENTS.md` files and the workflow, planning, product, architecture, decision, and contribution documents they reference.
4. Inspect manifests, source boundaries, validation commands, available version-control status, and enough recent work structure to understand local conventions. Preserve unrelated changes.
5. Inventory persistent coordination artifacts such as roadmaps, backlogs, work indexes, phase plans, progress logs, continuity files, specifications, ADRs, and changelogs.
6. Compare the target with the canonical ChangeShape rules by meaning rather than filenames or wording.
7. Classify only the active outcome and at most two or three deliberately queued candidates relevant to adoption as Direct, Scoped, Shaped, or Initiative. Do not reclassify an entire backlog or manufacture work merely to demonstrate every class.
8. Select the smallest adoption shape:
   - Do not copy the entire canonical ChangeShape document into the target. Adapt only the durable rules the repository needs into its existing structure and vocabulary.
   - Put durable classification and documentation rules in an existing repository workflow or agent-guidance document when one exists.
   - Create a compact workflow document only when no appropriate durable home exists.
   - Reuse an existing work index, issue tracker, or project board when it preserves the active outcome, boundaries, and next decision.
   - Create a repository work index only when active Shaped work needs cross-session coordination that no existing system provides, or when the user explicitly requests one.
   - Do not pre-create work specs, spec directories, templates, decision records, progress files, or changelogs for hypothetical future work.
   - Keep strategic Initiatives in an existing product or project-direction document when available.
9. In audit mode, report the current fit, material conflicts, excess documentation, missing boundaries, and the minimal adoption changes. Stop without editing.
10. In adopt mode:
    - Preserve repository-specific ownership, commands, safety, release, and commit rules.
    - Add or adapt a compact operational core containing the ChangeShape classifier, announcement and reclassification protocol, verification contracts and states, tracking thresholds, artifact lifecycle, and agent-coordination rules.
    - Route consequential uncertainty through EvidenceProbe or an equivalent bounded decision method only when evidence can change the action. Keep the human owner responsible for the choice and resume ChangeShape for production implementation.
    - Consolidate duplicated guidance instead of adding parallel authorities.
    - Do not delete material tracking or history documents without explicit authorization when the request does not clearly include migration.
    - Convert only work relevant to near-term decisions. Leave completed history in version control when present rather than migrating it into a new ledger.
11. Validate affected Markdown or configuration with available project tools, check changed links and references, and review the final diff for duplicated or contradictory workflow rules. Run `git diff --check` when the target uses Git.

## Adoption Requirements

An adopted repository must express these behaviors, although headings and file locations may vary:

- Work is classified by change shape rather than duration, story points, file count, or generated-code volume.
- Recovery risk covers failure detection, containment, rollback, repairability, compatibility recovery, and lasting consequences.
- Direct, Scoped, and Shaped are executable shapes. Initiative is strategic direction delivered through independently valuable Shaped slices, not an executable class.
- Each executable shape co-locates dimension-based criteria, its execution path, its verification contract, and its coordination requirements.
- Direct and Scoped work remain untracked by default.
- Shaped work receives a persistent specification only when the work index or equivalent coordination system cannot safely preserve its decisions and boundaries.
- Multiple unrelated outcomes are split and classified separately. Initiatives contain one coherent strategic direction.
- Announce the classification and reason before implementation, except for a typo-level, single-file edit with no behavior change.
- Treat classification as provisional. Pause and reclassify before expanding scope or integrating when implementation or verification reveals a different shape.
- When material uncertainty blocks a consequential decision, resolve it directly with the human owner or use EvidenceProbe or an equivalent bounded method when discriminating evidence can change the action. Do not hide the choice inside implementation or make a Probe mandatory for every Shaped change.
- Verify Direct work with the smallest relevant check. Exercise Scoped work through its actual integrated flow or nearest faithful environment, not only isolated unit tests. Satisfy Shaped verification item by item before acceptance.
- Report commands as run and results actually observed. Mark evidence as `verified`, `failed`, or `unverified`, with a reason and remaining risk for `unverified`.
- Block integration on `failed` or `unverified` by default. Proceed only after the human owner explicitly accepts the named failure or residual risk, without relabeling it as `verified`.
- Treat acceptance as evidence that the implementation is sufficiently verified for integration, not evidence that the integrated change produced a delayed product or operational effect.
- Canonical documents describe current truth; version control and CI preserve implementation and verification history when present.
- The person acting as product owner and developer retains priority, product meaning, costly-to-reverse decisions, and final acceptance. One primary agent integrates within the authority granted to it.
- Keep at most one active Shaped outcome per repository. When OutcomeFlow also applies, enforce its broader limit across the integration owner's current ownership domain. Allow inexpensive Direct or Scoped interruptions only when they do not create a competing integration stream.
- Parallel agents receive independent, bounded subtasks only when review and integration capacity exists. They stop and report product ambiguity, ownership overlap, costly-to-reverse decisions, or necessary scope expansion.
- Cross-session coordination uses at most one shared, short-lived handoff for the active outcome, never separate state or handoff documents for each agent.
- Keep classifications, verification evidence, and overrides observable during the active interaction but disposable after integration unless they change durable truth.
- Documentation is created or updated only when durable truth or necessary coordination changes.

## Output Expectations

In audit mode, lead with one verdict:

- `compatible`: the adoption requirements are represented by equivalent local behavior without material conflict
- `partially compatible`: the repository follows part of the workflow but has specific gaps that can be corrected incrementally
- `adoption recommended`: the repository has no coherent equivalent or materially conflicts with ChangeShape classification, coordination, or documentation behavior

Follow the verdict with only material findings and the smallest recommended changes.

In adopt mode, report:

- files created, changed, consolidated, or deliberately retained
- where the classifier and active-work rules now live
- current work classifications, when applicable
- validation performed
- unresolved conflicts or decisions

Do not describe ChangeShape as estimating development effort. Do not claim that adopting it requires a specific tool, hosting platform, issue tracker, branching model, or document filename.
