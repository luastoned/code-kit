---
name: adopt-outcome-flow
description: Audit or adopt the OutcomeFlow product delivery framework in one or more related repositories, aligning direction, outcome selection, optional EvidenceProbe decisions, ChangeShape execution, attention limits, observation, and information lifecycle with existing project conventions. Use only when the user explicitly invokes `$adopt-outcome-flow` or names the `adopt-outcome-flow` skill.
---

# Adopt OutcomeFlow

## Overview

Adapt OutcomeFlow without imposing a generic roadmap, document tree, or task hierarchy. Preserve useful local systems, establish only the missing delivery decisions, and keep product authority with the human owner.

## Mode Selection

- Use **audit mode** when the user asks whether a project follows OutcomeFlow, how its delivery model differs, or whether adoption would help. Keep audit mode read-only.
- Use **adopt mode** when the user asks to introduce, apply, migrate to, or synchronize OutcomeFlow.
- If the request names the skill but does not make the mode clear, inspect read-only and ask before changing project workflow files.

## Workflow

1. Resolve the canonical workflow references:
   - Use source paths supplied by the user.
   - Otherwise resolve symlinks to find this skill's directory. Use `docs/workflows/outcome-flow.md`, `docs/workflows/evidence-probe.md`, and `docs/workflows/change-shape.md` from the code-kit root two directories above it.
   - Confirm all three files exist and read them completely. Ask for their paths if any are unavailable.
2. Resolve the target scope from the request or current working directory:
   - Include multiple repositories only when the user placed them in scope or the selected outcome requires their combined behavior.
   - Read parent guidance for a nested target, but do not expand mutation authority beyond the requested ownership boundary.
3. Read all applicable `AGENTS.md` files and the product, project, architecture, workflow, planning, decision, contribution, release, and operational documents they reference.
4. Inspect enough manifests, source boundaries, version-control status, checks, deployment paths, and recent work structure to understand local ownership and delivery conventions. Preserve unrelated changes.
5. Inventory the current delivery model by meaning rather than filenames:
   - durable direction, constraints, and non-goals
   - optional Initiatives and at most two or three near-term Candidate Outcomes
   - outcome selection and human product authority
   - the Active Outcome, integration owner, and applicable repository boundaries
   - Outcomes awaiting evidence, their evidence sources, and live Decision Triggers
   - consequential decisions that block selection, shaping, or reconsideration and any active bounded Probe
   - attention, dependency, environment, and external constraints
   - change classification, verification, acceptance, integration, and applicable release or exposure
   - observation and reconsideration after integration
   - canonical, coordination, and operational state
6. Compare the target with OutcomeFlow, EvidenceProbe routing, and ChangeShape. Treat an equivalent local method as compatible even when its vocabulary and structure differ.
7. Check the supporting methods:
   - Reuse an existing bounded decision method when it keeps consequential choices with the human owner, gathers only discriminating evidence, and separates experiments from production implementation.
   - In audit mode, report a missing EvidenceProbe route only when selection or implementation could otherwise hide unresolved consequential uncertainty.
   - In adopt mode, add a compact optional routing rule when no compatible decision method exists. Do not make EvidenceProbe mandatory for routine decisions or require a separate adoption skill.
   - Reuse an existing compatible ChangeShape adoption when present.
   - In audit mode, report missing ChangeShape behavior as an adoption gap.
   - In adopt mode, add the compact ChangeShape operational core required by OutcomeFlow when no compatible method exists. Do not require a separate skill invocation or create duplicate classifiers.
8. Select the smallest adoption shape:
   - Keep durable direction in an existing product guide, project guide, or README when appropriate.
   - Keep agent-operational rules in the repository's existing agent guidance or workflow instructions.
   - Reuse an existing issue tracker, project board, or work index as the coordination system when it can preserve near-term Candidates, the Active Outcome, and live Decision Triggers without becoming a parallel authority.
   - Create a compact direction or workflow document only when necessary truth has no appropriate durable home.
   - Do not create a work index unless active Shaped work or a live awaiting-evidence trigger needs cross-session coordination that no existing system provides, or the user explicitly requests one.
   - Do not invent product direction, Initiatives, candidates, metrics, dependencies, or active work to demonstrate the framework.
9. In audit mode, report the current fit, material conflicts, duplicated state, missing decisions, and the smallest useful adoption. Stop without editing.
10. In adopt mode:
    - Preserve repository-specific ownership, commands, safety, release, and commit rules.
    - Add or adapt a compact operating model for Direction, Select, optional EvidenceProbe decisions, Shape, Escalate, Accept, Integrate, Observe, and Reconsider.
    - Treat Direction as durable decision context, not a vision-document template, roadmap, candidate list, or record of temporary priorities.
    - Keep Initiatives optional and non-executable. Convert only work relevant to near-term decisions into independently valuable outcomes.
    - Treat Candidate as a temporary near-term selection state, not a renamed backlog or storage class for ideas.
    - Keep at most one active Shaped Outcome across the human integration owner's current ownership domain while also preserving ChangeShape's one-active-Shaped-Outcome limit per repository.
    - Move a delivered Outcome to Awaiting evidence when delayed product or operational evidence remains unknown. Keep only its observation condition, evidence source, and live Decision Trigger, and do not count it as active delivery.
    - Keep release, deployment, publication, analytics, incident, and feedback history in their native systems.
    - Do not require a metric or report for every Outcome or imply automatic agent monitoring without an actual automation.
    - Consolidate duplicated guidance instead of adding parallel authorities.
    - Do not delete material tracking or history without clear authorization.
11. Validate affected Markdown or configuration with available project tools. Check changed links and references, inspect the complete diff for contradictory workflow rules, and run `git diff --check` when the target uses Git.

## Adoption Requirements

An adopted project must express these behaviors, although headings and file locations may vary:

- Direction preserves only the durable orientation, decision principles, strategic constraints, and non-goals needed to choose between plausible next Outcomes. It excludes roadmaps, Candidate lists, and temporary priorities.
- Initiatives are optional, temporary strategic bets that connect Direction to Outcomes. They are not executable. Outcomes may also enter directly from maintenance, incidents, obligations, or small improvements.
- Outcomes are independently valuable and observable. Selection considers why the outcome matters now, important constraints, and how its effect can be observed.
- Candidate is a temporary selection state for an Outcome plausible enough to compete for near-term attention. Keep at most two or three Candidates and do not use the state as a backlog for ideas.
- The human owner selects priority, product meaning, costly-to-reverse decisions, and final acceptance. Agents may investigate and recommend.
- Selection considers value, urgency, learning, risk reduction, immediate dependencies, review capacity, verification environments, and external constraints without totaling scores or estimating agent effort.
- When consequential uncertainty blocks responsible selection, shaping, or reconsideration, use EvidenceProbe or an equivalent bounded decision method. Do not invoke it for a preference the human owner can answer directly, a conventional reversible implementation, or research without a blocked action.
- A Probe gathers the smallest discriminating evidence, reports `decision-ready` or `inconclusive`, names residual uncertainty, and returns the choice to the human owner. It never counts as production implementation.
- ChangeShape or an equivalent execution method classifies selected outcomes by ambiguity, blast radius, recovery risk, coordination, and verification.
- Direct, Scoped, and Shaped execution retains the applicable classification, reclassification, verification-state, integration-gate, and documentation behavior from the canonical ChangeShape workflow.
- Keep at most one active Shaped Outcome across the integration owner's current ownership domain and at most one active Shaped Outcome per repository. Allow inexpensive Direct or Scoped interruptions only when they do not displace integration attention.
- Use Select, Shape, Escalate, Accept, Integrate, Observe, and Reconsider as decision points, not mandatory meetings or fixed delivery intervals.
- Treat ChangeShape acceptance as evidence that the implementation is sufficiently verified for integration. Treat OutcomeFlow observation as evidence that the accepted change produced its expected product or operational effect.
- Move a delivered Outcome to Awaiting evidence when observation is delayed. It no longer consumes the active Shaped-outcome limit, so independent delivery may continue.
- Give each Outcome awaiting evidence a live Decision Trigger with an observable condition, evidence source, and decision to reopen. Remove it from coordination after reconsideration or when the trigger is no longer useful.
- Record only dependencies that affect selection, sequencing, ownership, or acceptance. Treat cross-repository behavior as one outcome when combined acceptance requires it.
- Keep canonical truth, temporary coordination, and operational history distinct. Version control, CI, release, deployment, incident, analytics, and feedback systems retain the state they own.
- Do not create a comprehensive backlog, speculative task tree, progress journal, learning ledger, dependency inventory, completed-outcome archive, or agent report archive.

## Output Expectations

In audit mode, lead with one verdict:

- `compatible`: equivalent local behavior represents OutcomeFlow, optional EvidenceProbe routing, and ChangeShape without material conflict
- `partially compatible`: the project follows part of the framework but has specific gaps that can be corrected incrementally
- `adoption recommended`: the project lacks a coherent equivalent or materially conflicts with outcome selection, execution, attention, observation, or information-lifecycle behavior

Follow the verdict with only material findings and the smallest recommended changes.

In adopt mode, report:

- files created, changed, consolidated, or deliberately retained
- where Direction, selection, optional EvidenceProbe routing, active coordination, awaiting-evidence triggers, and execution rules now live
- the active outcome and ChangeShape classification, when one exists
- validation performed
- unresolved product decisions, active or inconclusive Probes, conflicts, or residual risks

Do not claim that OutcomeFlow requires a specific issue tracker, branching model, hosting platform, delivery interval, metric, repository layout, or document filename.
