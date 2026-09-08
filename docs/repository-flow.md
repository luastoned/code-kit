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
  diff --> authorized{"Commit authorized?"}
  authorized -->|Yes| commit["Commit one coherent change"]
  authorized -->|No| handoff["Return verified changes"]
```

Choose one canonical home for each rule or resource. Update related files only when they consume, index, describe, or validate that source. A request to edit shared resources does not by itself require a commit.

For substantial workflow changes, exercise representative request scenarios before handoff: a narrow edit, a read-only audit, an authorized implementation with verification, and a case needing a new decision. Check scope preservation and observable completion rather than matching prose or headings.

## Downstream Consumption

```mermaid
flowchart LR
  subgraph kit["code-kit"]
    guidance["guidance/"]
    configs["configs/"]
    skills["skills/"]
    workflows["docs/workflows/<br/>Operating contracts"]
    examples["docs/workflows/references/<br/>Optional examples"]
    skillDetails["Skill-local references/<br/>and assets/"]
    references["references/"]
    installers["install-skills.sh<br/>install-skills.ps1"]
    validator["scripts/validate.py"]
  end

  skills --> installers
  skillDetails --> skills
  workflows -.->|When needed| examples
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

Synchronization and adoption inspect relevant target evidence first. They adapt shared behavior to local ownership, language, tooling, and workflow conventions. Missing generic advice or omitted source sections do not establish drift; retain instructions that affect likely decisions or protect concrete constraints.

Guidance synchronization defaults to one `AGENTS.md` at the owning project root, not one per source folder or build target. Nested guidance needs an explicit placement request or materially different subtree rules that cannot be kept clear at the root. A solution directory with a same-named inner C++ source directory normally remains one guidance scope; see [repository placement guidance](../guidance/Repositories.md#guidance-shape).

Source language guides share a consistent layout and link to canonical readability and local-consistency rules in `guidance/AGENTS.md`. Guidance synchronization keeps one applicable copy of those rules in the target and updates links; standalone exports include the required rules when the shared entrypoint will not accompany them.

Workflow documents own compact operating contracts; their examples and rationale live under `docs/workflows/references/` and are read only for a relevant question. Skills route to these contracts and conditional skill-local resources instead of duplicating every rule. Existing compatible supporting methods do not require loading all linked workflows.

Installers link complete skill directories. Keep the source checkout available because adoption and sync skills resolve shared `docs/`, `guidance/`, or `configs/` through their real paths. Standalone copies must include skill-local references and assets and may need user-supplied shared-source paths.

Changes do not propagate automatically. Run the relevant audit or synchronization skill when a target repository needs current guidance or configuration.

Private guidance under `guidance/private/` stays local. Do not publish or copy it unless the user explicitly requests that action.
