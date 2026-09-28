---
name: run-evidence-probe
description: Resolve one consequential decision with bounded evidence. Use only when explicitly requested as $run-evidence-probe.
---

# Run EvidenceProbe

Use this skill for uncertainty that blocks a consequential action. A conventional reversible implementation or a preference the owner can answer directly does not need a probe.

Do not make a probe a prerequisite for immediate containment or restoration of a live service. Follow the authorized incident-response path; probe remaining consequential uncertainty when urgent response permits it.

## Probe Contract

Establish the decision question, owner, blocked action, and why existing evidence is insufficient. Define plausible options, relevant constraints, permitted side effects, consequences, and stop conditions only to the extent they affect the decision.

Inspect existing evidence before creating an experiment. Select the smallest action that distinguishes the alternatives and state which results would support, contradict, or leave the claim unresolved. Prefer faithful environments, direct measurements, primary sources, and reproducible observations when they answer the question; state material limits of proxies or substitutes.

Run the probe within its authority. Local disposable experiments are permitted when covered by the investigation; tracked implementation edits, external mutations, and costly state require authorization for those actions and their recovery implications. Preserve unrelated work and user-owned evidence.

Focused throwaway tests using existing tooling are fine; keep them out of maintained files and remove them when done. Add or change maintained tests, fixtures, test configuration, or test infrastructure, including reusable harnesses even when temporary or untracked, only when asked.

Label material claims `supported`, `contradicted`, or `unresolved`. Report observations actually obtained, commands as run, relevant environments, and limitations. Cite external evidence near the claim; do not invent confidence percentages or gather sources to meet a quota.

Stop when another probe cannot reasonably change the action. Return `decision-ready` or `inconclusive` with residual uncertainty. Recommend an option only when the evidence supports one. An inconclusive result blocks a costly commitment unless the owner accepts the named risk; do not relabel evidence after acceptance.

## Continuation and Artifacts

For a probe-only request, end with evidence and the consequential choice left to the owner. For an authorized probe-then-implement request, apply the owner's decision condition or delegated choice and continue through the project's execution method when the evidence permits it. Ask only for decisions outside that authority.

Do not silently promote a prototype into production. Transition explicitly and apply production verification requirements. Remove disposable artifacts only when safe and authorized. Persist rationale only when it must survive or the user requests it; avoid research diaries and parallel state files.

## Optional Reference

The contract above supports standalone use. For unfamiliar decision boundaries or workflow integration, resolve symlinks to this skill and read `docs/workflows/evidence-probe.md` from the code-kit root two directories above it, or the user-supplied reference. If unavailable, continue with this contract.

Read OutcomeFlow or ChangeShape only to resolve a question about an applicable integration. Do not make adopting either method a prerequisite for production work.

## Output

Lead with the result and decision it informs. Give material evidence, uncertainty, and the authorized next step or unresolved owner decision. Summarize routine commands and results without dumping logs.
