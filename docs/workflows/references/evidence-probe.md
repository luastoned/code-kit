# EvidenceProbe Examples and Records

These examples support the [operating contract](../evidence-probe.md).

## Discriminating Probes

| Decision question                                                        | Useful evidence                                                                                    | Stop condition                                                                  |
| ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| Can the storage model support offline synchronization without data loss? | Inspect conflict semantics and reproduce representative conflicts in an isolated fixture.          | Material conflict cases support an approach or expose unresolved recovery risk. |
| Is rendering slow because of preparation or layout?                      | Measure both paths in a representative scene.                                                      | The measurement distinguishes the bottleneck sufficiently to choose a fix.      |
| Does an authentication option meet the product constraints?              | Check documented behavior and reproduce the consequential boundary in a faithful test environment. | Required constraints are supported, contradicted, or explicitly unresolved.     |

Broad topics such as “research authentication” need a concrete blocked action before this method helps. Do not run a benchmark when existing diagnostics already distinguish the alternatives.

## Incident Response and Evidence Quality

During a live outage, an already authorized rollback with a known recovery procedure belongs to incident response, not a new comparison study. Restore service through that path, then probe a remaining question such as whether retry behavior caused the overload. If the recovery action itself is uncertain, use the diagnostics needed for safe response without imposing a separate research ceremony or assuming new production authority.

A local throughput benchmark may not answer whether a service meets its production tail-latency requirement. Prefer observations of the relevant latency under representative load; if only a substitute environment is available, identify which conclusion it cannot support. Primary documentation can establish a documented guarantee, while a faithful reproduction can test whether the configured system exhibits it. Keep enough setup and command context to make observations reproducible without rerunning valid evidence merely for presentation.

## Decision Record

Persist a record only when future readers need the rationale. Use local conventions and include the context, material observations, choice and decision authority, tradeoffs, residual uncertainty, and any reconsideration trigger.

A prototype is evidence. Reusing it for production requires an authorized implementation task and the project's production-quality checks.

## Completion Examples

For “compare these options,” return the result and recommend an option only when the evidence supports one.

For “test whether A meets these constraints; implement A if it does,” report the evidence and continue when the condition is met. Ask only if the result leaves a consequential choice outside that authorization.

For an inconclusive probe with no useful next experiment, name the missing evidence and affected decision. More source collection does not by itself improve the result.

## Changelog

### 1.1.1

- Test-work rules condensed without changing behavior.

### 1.1.0

- Focused disposable tests using existing tooling are allowed within the investigation boundary; remove scratch tests when finished. Persistent test changes and reusable test harnesses or infrastructure require an explicit request, even when called temporary or untracked.

### 1.0.0

- Initial release.
