---
name: run-evidence-probe
description: Resolve one consequential product, technical, or operational decision with the smallest trustworthy evidence, reporting supported, contradicted, and unresolved claims before returning the choice to the human owner. Use only when the user explicitly invokes `$run-evidence-probe` or names the `run-evidence-probe` skill.
---

# Run EvidenceProbe

## Overview

Run a bounded EvidenceProbe when material uncertainty blocks a consequential decision. Gather only evidence that can affect the decision, leave the choice with the human owner, and keep production implementation outside the probe.

## Workflow

1. Resolve the canonical method when available:
   - Use a path supplied by the user first.
   - Otherwise resolve symlinks to find this skill's directory, then look for `docs/workflows/evidence-probe.md` from the code-kit root two directories above it.
   - Read the complete document when found. If it is unavailable, continue with the operational core in this skill instead of blocking the probe.
   - Read the canonical OutcomeFlow or ChangeShape document only when the decision is part of one of those workflows.
2. Read applicable `AGENTS.md` files and the product, architecture, operational, decision, and verification material relevant to the question. Preserve unrelated work.
3. Confirm that material uncertainty blocks a consequential choice or action:
   - If the human owner can answer a product preference directly, ask that focused question instead of manufacturing a probe.
   - If one conventional, inexpensive-to-reverse approach is already supported, explain why EvidenceProbe is unnecessary and route implementation through the project's normal method.
   - If the request contains several independent decisions, separate them and probe only the decision the user placed first or explicitly selected.
4. State the Decision Question, Decision Owner, blocked action, and why existing evidence is insufficient in one concise update.
5. Inspect existing evidence before creating an experiment. Prefer repository behavior, operational data, faithful environments, and primary documentation over summaries or speculation.
6. Define the smallest useful Decision Boundary:
   - plausible options or hypotheses
   - relevant constraints and exclusions
   - consequences of a wrong decision
   - acceptable residual uncertainty
   - stop or reframe conditions
7. Select the smallest discriminating Probe. Before running it, state which possible result would support, contradict, or leave the material claim unresolved.
8. Keep mutation authority narrow:
   - Prefer read-only inspection and measurements.
   - Put disposable experiments outside production paths when practical.
   - Do not modify tracked implementation, external systems, production data, or costly state unless the user explicitly authorized that probe and its recovery plan.
   - Do not silently turn an experiment into production implementation.
9. Run the Probe and report only evidence actually observed. Record commands as run, relevant environment details, and material limitations. Never present an expected or unrun result as evidence.
10. Mark each decision-relevant claim as `supported`, `contradicted`, or `unresolved`. Do not total scores, count sources as votes, or invent confidence percentages.
11. Stop when the evidence is decision-ready. Run another Probe only when it can reasonably change the action and remains within the Decision Boundary.
12. End with one overall state:
    - `decision-ready`: enough evidence exists for the human owner to choose while understanding residual uncertainty
    - `inconclusive`: no useful Probe remains within the Decision Boundary, or necessary evidence is unavailable
13. Return the choice to the human owner. Recommend an option when the evidence supports one, but do not silently make a consequential product or technical decision.
14. Route follow-up work:
    - Use ChangeShape or the project's equivalent execution method for production implementation.
    - Return product selection or reconsideration to OutcomeFlow when it applies.
    - Keep a standalone decision standalone when neither workflow is present.
15. Remove only disposable artifacts created by the probe when removal is safe and authorized. Persist a concise decision record only when the rationale must survive or the user requests one.

## Probe Contract

Keep the active interaction observable and concise:

- **Decision Question:** the choice and blocked action
- **Probe:** the bounded action and what its outcomes distinguish
- **Evidence:** material observations labeled `supported`, `contradicted`, or `unresolved`
- **Result:** `decision-ready` or `inconclusive`
- **Residual uncertainty:** what remains unknown and why it matters
- **Decision needed:** the explicit choice left with the human owner

An `inconclusive` result blocks a costly-to-reverse production commitment by default. Proceed only when the human owner explicitly accepts the named uncertainty and consequence. Do not relabel the evidence.

## Output Expectations

Lead with the overall result and the decision it informs. Report commands and results concisely; do not dump routine logs unless they are needed to understand the evidence or the user requests them.

Do not create research journals, source dumps, prototype diaries, progress reports, permanent option matrices, or a durable decision record by default.
