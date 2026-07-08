---
name: session-state
description: Save or restore current-session handoff context through an AGENTS_STATE.md file. Use when Codex needs to write a concise handoff before ending a session, read/consume a previous handoff at the start of a new session, continue work from saved agent state, or update the local session state for a repository without reading Codex history logs.
---

# Session State

## Overview

Use `AGENTS_STATE.md` as a short-lived handoff file for agent context that should survive between sessions. The file is dynamic, local working state for the current repository or project, not source documentation.

This skill only uses the current conversation, repository state, and an existing `AGENTS_STATE.md` when present. Do not read `~/.codex/history.jsonl`, `~/.codex/session_index.jsonl`, or `~/.codex/sessions/*` for this skill.

## Mode Selection

- **Write mode**: Use when the user says to save, write, update, persist, or prepare session state, handoff, or continuation notes.
- **Read mode**: Use when the user says to read, load, restore, consume, continue from, or resume session state.
- If the request is ambiguous, infer from context:
  - Existing `AGENTS_STATE.md` plus "continue" means read mode.
  - End-of-session wording means write mode.
  - "Update state" means write mode.

## File Location

1. Use the repository or project root as the default location.
2. If the user gives a folder, use that folder.
3. If a nearer `AGENTS.md` clearly owns the active work area, place `AGENTS_STATE.md` next to that `AGENTS.md`.
4. Do not create nested state files unless the user is explicitly working in a nested project with its own guidance.

## Read Mode

1. Read `AGENTS_STATE.md` completely.
2. Summarize the handoff for the current session:
   - current goal
   - status
   - relevant decisions
   - changed files
   - validation state
   - open questions
   - next steps
3. Delete `AGENTS_STATE.md` after a successful read unless the user explicitly says to keep it.
4. If the file is absent, say that no saved agent state exists and continue from the visible repository context.
5. Do not treat stale state as authoritative when it conflicts with current files, git status, or direct user instructions.

## Write Mode

1. Inspect only the context needed to make the handoff accurate:
   - current user goal and latest instructions
   - existing `AGENTS_STATE.md`, if present
   - `git status --short`
   - relevant diffs or changed file summaries when needed
   - validation commands and results already known from the session
2. Create or update `AGENTS_STATE.md` with concise, factual, actionable state.
3. Preserve still-relevant prior state and remove stale completed items.
4. Do not include raw chat transcripts, tool dumps, hidden reasoning, secrets, credentials, tokens, or unrelated personal context.
5. Mark uncertainty explicitly when a fact was inferred.
6. Prefer short bullets. Keep the file small enough to read at session start.

Use this structure:

```md
# Agent State

## Scope
- Repository/project/folder this state applies to.

## Current Goal
- The task the next session should continue.

## Status
- What is done, in progress, paused, or blocked.

## Decisions
- Important decisions that should not be rediscovered.

## Changed Files
- Files changed or expected to be changed, with short reasons.

## Validation
- Commands run and results.
- Anything relevant that was not verified.

## Open Questions
- Only blockers or unresolved choices.

## Next Steps
- Concrete continuation steps in order.
```

## Git Handling

- Treat `AGENTS_STATE.md` as dynamic handoff state.
- Do not commit `AGENTS_STATE.md` unless the user explicitly asks to track it.
- If adding repository setup for this workflow, prefer ignoring `AGENTS_STATE.md` in `.gitignore`.
- Mention in the final response whether the state file was written, consumed, kept, deleted, or missing.

## Output Expectations

- In write mode, report the path written and the main continuation point.
- In read mode, report the loaded handoff summary and whether the file was deleted.
- If the skill cannot determine the correct project root, state the assumed root and proceed.
