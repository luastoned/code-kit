# OutcomeFlow

> An agent-native product delivery framework for selecting, delivering, and learning from independently valuable outcomes.
>
> Version 1.1.1
>
> Status: Released

OutcomeFlow helps one person acting as product owner and developer decide what should become true next, deliver it with AI assistance, and reconsider direction using observed evidence. It coordinates one or more related repositories without imposing a backlog, delivery cadence, or document tree.

## Operating Contract

### Flow

1. Review Direction, live Decision Triggers, and the few candidates that matter.
2. Select one outcome, unless a clear request already selected it.
3. Hand it to execution, using EvidenceProbe only when consequential uncertainty blocks a decision.
4. Deliver it through the integration or release the owner authorizes.
5. Reconsider immediately when verification establishes the intended effect; otherwise keep it awaiting evidence with a Decision Trigger.
6. At reconsideration, continue, reshape, or stop, update Direction when understanding changed, and select again.

### Direction and Selection

Direction preserves durable product or operational orientation, decision principles, strategic constraints, and non-goals. It does not contain temporary priorities or a detailed roadmap.

An Initiative is an optional strategic bet containing independently valuable outcomes. It is not an executable task. Do not decompose it in advance; select its next outcome from current evidence and reconsider the Initiative after learning from that outcome. Maintenance, incidents, obligations, and small improvements can enter directly as outcomes.

An Outcome is an independently valuable, observable change. Establish what should become true, why it matters now, the important constraints, and how its effect can be observed; do not expand it into a speculative task tree. Select using value, urgency, learning, risk reduction, dependencies, and review or environment capacity. Do not total scores or estimate agent effort.

Prefer the smallest outcome that delivers value or useful learning independently. A partial implementation with no usable effect is not a smaller outcome; do not reduce scope by discarding required behavior or acceptance conditions.

The human owner retains priority, product meaning, costly-to-reverse decisions, and final acceptance unless those decisions have been explicitly delegated. Honor prior decisions and delegation; a clear implementation request already selects its outcome. Do not ask the owner to select it again.

### Execution and Decisions

Use [ChangeShape](./change-shape.md) or equivalent local behavior to classify, execute, and verify the selected outcome. Read its contract when adopting execution rules or resolving an execution question; do not reread it for every selected task.

Hand execution what should become true, why it matters now, constraints and non-goals, decision authority, and the intended observable effect. Execution derives acceptance conditions from the effects implementation can demonstrate and leaves effects that only delayed use can show to observation. It returns the classification, evidence states, accepted or unresolved risks, and what was integrated or still awaits authorization.

Use [EvidenceProbe](./evidence-probe.md) only when consequential uncertainty blocks a decision and bounded evidence can change the action. Its result is evidence, not production implementation. Resume the blocked workflow under existing conditional authorization, or request the unresolved decision from the owner.

Reassess when evidence changes meaning, ownership, recovery risk, scope, dependencies, or verification needs. Adapt execution within granted authority; pause dependent work only when a new decision or permission is required. Continue useful independent work.

Infer the completion endpoint from the conversation. Continue implementation through relevant verification and repairs to reach it. Acceptance may follow from satisfying previously approved criteria; obtain fresh acceptance only for reserved choices or named risks outside that approval.

Integration, deployment, publication, release, and external exposure remain distinct actions governed by their native systems and the user's authorization. Their relevance to the outcome does not itself authorize them. If new authority is required, finish the authorized preparation and present the concrete remaining action.

### Delivery and Observation

Execution verification establishes that the implementation behaves as intended. Observation establishes whether delivery produced its expected product or operational effect.

Use only coordination states that affect the next decision:

- **Candidate:** a plausible near-term outcome competing for attention.
- **Active:** the selected outcome being shaped, implemented, verified, or delivered. It stays active until the integration or release that lets its effect occur is complete.
- **Awaiting evidence:** a delivered outcome waiting for a delayed effect; it is no longer active delivery.

When verification establishes the intended effect and no delayed evidence matters, reconsider immediately. Otherwise retain a Decision Trigger: an observable condition such as a date, usage volume, external response, or production or support signal, its evidence source, and the decision to reopen. Native automation or a person may monitor it; do not imply an agent will wake automatically without an actual mechanism. Before selecting the next outcome, review live triggers whose conditions may have been met; a met trigger can reopen its decision ahead of new candidates.

At immediate reconsideration or when a trigger's condition is met, use the available evidence to continue or stop the Initiative, reshape a candidate, change a constraint or assumption, or select a different outcome within the owner's decision authority. Update Direction or other canonical truth only when evidence changed that understanding. Do not require a metric, observation report, or retrospective for every delivery. Remove stale triggers and completed coordination when authorized.

### Attention and Ownership

For the solo integration-owner model, default to one active Shaped outcome across the owner's current ownership domain, including involved repositories. Apply ChangeShape's per-repository default too. Local safety or release constraints may impose a stricter limit. The owner may delegate independent integration responsibility when review, verification, and environment capacity justify different concurrency.

Delivered outcomes awaiting evidence do not consume active delivery capacity. Direct or Scoped interruptions are appropriate when inexpensive and when they neither create competing integration demands nor displace review, integration, or product attention.

Keep only candidates that matter to the next selection; two or three are a useful default. Do not fill a quota, reclassify a whole backlog, or manufacture product direction, metrics, or work.

Use additional agents only when available, authorized, and useful for independent work the integration owner can evaluate. Follow ChangeShape's ownership and integration constraints.

Treat cross-repository changes as one outcome when value or acceptance depends on their combined behavior; one integration owner verifies the combined boundary. Split unrelated outcomes even when they share a repository, release, or available agent. Record only dependencies affecting selection, sequencing, ownership, or acceptance.

### Information Lifecycle

- Canonical documents own current direction, architecture, constraints, and operating truth.
- One existing coordination system holds active boundaries, immediate candidates, unresolved decisions, and live evidence triggers when they must survive the interaction.
- Native version-control, CI, release, deployment, incident, analytics, and feedback systems own operational history.

Create a work index or temporary specification only when existing coordination cannot carry the needed information. Avoid parallel backlogs, progress journals, learning ledgers, completed-outcome archives, and per-agent handoffs. Preserve established local records unless consolidation or removal is authorized.

## Supporting Methods and Examples

Equivalent local methods can satisfy the contracts without adopting their names or copying their documents.

Read [delivery examples and flow](./references/outcome-flow.md) when the relationships between direction, execution, and delayed observation need illustration. Read its [changelog](./references/outcome-flow.md#changelog) when upgrading an adopted version. The adoption skill is `$adopt-outcome-flow`; it audits or adapts only the behavior missing from the target.
