---
name: session-state
description: Save, restore, or consume a concise project handoff. Use only when explicitly requested as $session-state.
---

# Session State

Use the visible conversation, repository state, and established handoff only. Do not inspect agent-runtime history or session logs, including `~/.codex/history.jsonl`, `~/.codex/session_index.jsonl`, or `~/.codex/sessions/*`.

## Mode and Location

- Save, update, or end-of-session handoff wording means write mode.
- Read, load, restore, resume, or continue wording means read mode; keep the file.
- Consume or an explicit instruction to delete after loading means consume mode.

Reuse the project's established coordination or shared handoff when it carries the active work. An explicit `AGENTS_STATE.md` request takes precedence. Otherwise use the repository root, or the owning project root when no Git root exists. Use a nested project only when it is explicitly in scope; do not create multiple state files based solely on nearer guidance.

## Read or Consume

Read the requested handoff completely. Check its scope, decisions, changed files, and next action against current instructions, files, and Git status. Stale state does not override the user or current evidence.

Summarize only the continuation context that matters. If the request is to resume or continue work, proceed with the authorized next action after loading; do not stop at the summary. A request only to read or summarize ends with that result.

Consume only the explicitly designated handoff after successful loading. Do not delete a work index or specification merely because it also carries handoff context; remove only the authorized handoff portion if the user requested that. If no file exists, report it and continue from available context when work was requested.

## Write

Inspect relevant changes and known validation results. Update the established location or use [the optional state outline](assets/state.template.md) for a new `AGENTS_STATE.md`. Include only necessary fields: goal, status, decisions and delegated authority, affected files, verified or unverified conditions, blockers, and the next action.

Preserve still-relevant state, remove stale entries, and keep the handoff concise. Exclude transcripts, tool dumps, hidden reasoning, secrets, credentials, and unrelated personal context. Mark inferred facts.

## Git and Completion

Do not commit handoff state unless tracking is requested. Add an ignore rule only when setting up that workflow is in scope.

Report the location and whether state was written, loaded, kept, consumed, or missing. For resumed work, continue to its requested endpoint and include material handoff limitations in the final result.
