# OutcomeFlow Examples

Read the [operating contract](../outcome-flow.md) for requirements. This document illustrates the relationships between selection, delivery, and observation.

## Delivery Flow

```mermaid
flowchart LR
  direction["Direction"] --> select["Select outcome"]
  select --> ready{"Enough evidence?"}
  ready -->|No| probe["Bounded probe"]
  probe --> choice["Decision within granted authority"]
  choice --> select
  ready -->|Yes| execute["Classify, implement, verify"]
  execute --> accept["Satisfy acceptance"]
  accept --> deliver["Authorized integration or release"]
  deliver --> delayed{"Delayed evidence needed?"}
  delayed -->|No| reconsider["Reconsider"]
  delayed -->|Yes| awaiting["Awaiting evidence with trigger"]
  awaiting -.-> select
  awaiting -->|Trigger fires| observe["Observe effect"]
  observe --> reconsider
  reconsider --> direction
```

## Direction and Outcomes

- Direction: Make multiplayer effortless for casual groups.
- Optional Initiative: Remove friction from joining a game.
- Outcome: A player can join from a shared link without creating an account.

The owner may select that outcome directly. The agent does not need to construct an Initiative or ask for selection again.

A first outcome might let a host invite a player into an existing session end to end, without adding an invitation dashboard or persistent social graph. An unused invitation table alone would not deliver that value. Required access controls and join validation remain part of the outcome, not optional scope to cut.

## Delayed Evidence

A verified onboarding change may be delivered before enough users have tried it to assess completion rates. Keep the evidence source, observation condition, and decision to revisit. Another independent outcome can proceed while that evidence is pending.

A copy correction whose effect is established by direct inspection usually needs no delayed observation. Avoid creating metrics or a report solely to fill a workflow stage.

## Reconsideration

If shared-link joining works technically but observed failures cluster around expired links, the owner may reshape the next candidate around recovery messaging instead of building more invitation features. If evidence supports continued investment, select the next independently valuable outcome. If it undermines the Initiative's premise, the owner may change the assumption, stop the Initiative, or choose another outcome; sunk implementation work does not require continuing the plan.

## Ownership

OutcomeFlow owns direction, selection, attention, and delayed observation. ChangeShape owns implementation classification and verification. EvidenceProbe owns bounded evidence gathering. Native systems own code, checks, deployments, incidents, and product signals.
