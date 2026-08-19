# Repository Flow

This document shows how code-kit is maintained and how other repositories consume it. Code-kit is a source repository for shared resources. It is not a runtime dependency of target projects.

## Maintenance Flow

```mermaid
flowchart TD
  request["Requested shared change"] --> owner{"Choose the owning source"}

  owner -->|Agent behavior| guidance["guidance/<br/>Reusable agent instructions"]
  owner -->|Tool defaults| configs["configs/<br/>Reusable configuration"]
  owner -->|Repeatable task| skills["skills/<br/>Portable agent workflows"]
  owner -->|Durable workflow or explanation| docs["docs/<br/>Workflows and references"]
  owner -->|Structured lookup data| references["references/<br/>Machine-readable data"]
  owner -->|Repository maintenance| scripts["scripts/<br/>Install and validation helpers"]

  guidance --> review["Review affected consumers"]
  configs --> review
  skills --> review
  docs --> review
  references --> review
  scripts --> review

  review --> format["Run oxfmt"]
  format --> validate["Run scripts/validate.py"]
  validate --> diff["Review the complete diff"]
  diff --> commit["Commit one coherent change"]
```

Choose one canonical home for each rule or resource. Update related files only when they consume, index, describe, or validate that source.

## Downstream Consumption

```mermaid
flowchart LR
  subgraph kit["code-kit"]
    guidance["guidance/"]
    configs["configs/"]
    skills["skills/"]
    workflows["docs/workflows/"]
    references["references/"]
    installers["install-skills.sh<br/>install-skills.ps1"]
    validator["scripts/validate.py"]
  end

  skills --> installers
  installers --> runtime["~/.codex/skills/<br/>~/.claude/skills/"]

  guidance --> syncGuidance["$sync-agent-guidance"]
  skills --> syncGuidance
  syncGuidance --> targetGuidance["Target AGENTS.md<br/>and mapped guides"]

  configs --> syncConfigs["$sync-project-configs"]
  skills --> syncConfigs
  syncConfigs --> targetConfigs["Target formatter, linter,<br/>TypeScript, and package configs"]

  workflows --> directWorkflow["Read or adapt workflow directly"]
  directWorkflow --> targetWorkflow["Target workflow or<br/>agent guidance"]

  workflows --> adoptWorkflow["Explicit adoption skill<br/>when available"]
  skills --> adoptWorkflow
  adoptWorkflow --> targetWorkflow

  references --> consumers["Maintenance scripts<br/>and applicable skills"]
  validator --> kitCheck["Repository-wide checks"]

  targetGuidance --> target["Target repository"]
  targetConfigs --> target
  targetWorkflow --> target
```

Installation exposes skills to an agent runtime. It does not apply them to a project. A user must invoke task-oriented skills explicitly.

Workflows can be read or adapted directly. Add an adoption skill only after its adoption behavior is defined and repeatable.

Synchronization and adoption inspect the target first. They adapt shared behavior to local ownership, language, tooling, and workflow conventions. They keep project-specific rules until those rules have been evaluated.

Changes do not propagate automatically. Run the relevant audit or synchronization skill when a target repository needs current guidance or configuration.

Private guidance under `guidance/private/` stays local. Do not publish or copy it unless the user explicitly requests that action.
