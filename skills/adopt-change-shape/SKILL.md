---
name: adopt-change-shape
description: Audit or adopt the ChangeShape workflow in a project or repository, classifying work by ambiguity, blast radius, irreversibility, coordination, and verification instead of time estimates while minimizing persistent planning documentation. Use only when the user explicitly invokes `$adopt-change-shape` or names the `adopt-change-shape` skill.
---

# Adopt ChangeShape

## Overview

Adapt ChangeShape to a target repository without imposing a generic document tree. Preserve useful local conventions, add only the coordination surfaces justified by current work, and remove or consolidate existing workflow artifacts only with clear authorization.

Read `references/change-shape.md` completely before auditing or editing a target.

## Mode Selection

- Use **audit mode** when the user asks whether a repository follows ChangeShape, how its workflow differs, or whether adoption would help. Audit mode is read-only.
- Use **adopt mode** when the user asks to introduce, apply, migrate to, or synchronize ChangeShape.
- If the request names the skill but does not make the mode clear, inspect read-only and ask before changing project workflow files.

## Workflow

1. Resolve the target scope from the request or current working directory. In a monorepo, inspect the repository root for parent guidance but use the narrowest ownership boundary that governs the requested work. Do not turn project-level adoption into a repository-wide change without clear authorization.
2. Read all applicable `AGENTS.md` files and the workflow, planning, product, architecture, decision, and contribution documents they reference.
3. Inspect manifests, source boundaries, validation commands, available version-control status, and enough recent work structure to understand local conventions. Preserve unrelated changes.
4. Inventory persistent coordination artifacts such as roadmaps, backlogs, work indexes, phase plans, progress logs, continuity files, specifications, ADRs, and changelogs.
5. Compare the target with the canonical ChangeShape rules by meaning rather than filenames or wording.
6. Classify only the active outcome and at most two or three deliberately queued candidates relevant to adoption as Direct, Scoped, Shaped, or Initiative. Do not reclassify an entire backlog or manufacture work merely to demonstrate every class.
7. Select the smallest adoption shape:
   - Put durable classification and documentation rules in an existing repository workflow or agent-guidance document when one exists.
   - Create a compact workflow document only when no appropriate durable home exists.
   - Reuse an existing work index, issue tracker, or project board when it preserves the active outcome, boundaries, and next decision. Create a repository work index only when active Shaped work needs cross-session coordination that no existing surface can provide, or when the user explicitly requests one.
   - Do not pre-create work specs, spec directories, templates, decision records, progress files, or changelogs for hypothetical future work.
   - Keep strategic Initiatives in an existing product or project-direction document when available.
8. In audit mode, report the current fit, material conflicts, excess documentation, missing boundaries, and the minimal adoption changes. Stop without editing.
9. In adopt mode:
   - Preserve repository-specific ownership, commands, safety, release, and commit rules.
   - Add or adapt the ChangeShape classifier, tracking thresholds, artifact lifecycle, and agent-coordination rules.
   - Consolidate duplicated guidance instead of adding parallel sources of truth.
   - Do not delete material tracking or history documents without explicit authorization when the request does not clearly include migration.
   - Convert only currently relevant work. Leave completed history in version control when present rather than migrating it into a new ledger.
10. Validate affected Markdown or configuration with available project tools, check changed links and references, and review the final diff for duplicated or contradictory workflow rules. Run `git diff --check` when the target uses Git.

## Adoption Requirements

An adopted repository must express these behaviors, although headings and file locations may vary:

- Work is classified by change shape rather than duration, story points, file count, or generated-code volume.
- Direct and Scoped work remain untracked by default.
- Shaped work receives a persistent specification only when the work index or equivalent coordination surface cannot safely preserve its decisions and boundaries.
- Initiatives are direction, not executable tasks, and are delivered through independently valuable Shaped slices.
- Canonical documents describe current truth; version control and CI preserve implementation and verification history when present.
- One integration owner controls an active outcome. Parallel agents receive independent, bounded subtasks.
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
