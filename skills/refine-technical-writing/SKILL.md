---
name: refine-technical-writing
description: Audit or rewrite technical prose for clarity, concision, consistency, and global readability without changing its technical meaning or established voice. Use only when the user explicitly invokes `$refine-technical-writing` or names the `refine-technical-writing` skill for text, documentation, guidance, comments, docstrings, user-facing messages, or a prose-focused repository review.
---

# Refine Technical Writing

## Goal

Improve technical prose without changing the facts, requirements, commands, product behavior, or deliberate voice it communicates.

## Workflow

1. Identify the target and requested mode:
   - Use audit mode when the user asks for findings, advice, or a review without requesting edits.
   - Use rewrite mode when the user asks to refine, revise, or apply the findings.
   - For repository-wide work, identify prose-bearing files and exclude dependencies, generated output, vendored content, lockfiles, and machine-managed artifacts.
   - In source files, edit comments, docstrings, or user-facing messages only when the user includes them in scope.
2. Read the applicable project instructions and local writing guidance. Treat them as the primary authority.
3. Identify the intended readers, document purpose, and content types before choosing edits.
4. Read [references/language-principles.md](references/language-principles.md) before evaluating or changing prose.
5. Read [references/content-patterns.md](references/content-patterns.md) when the target contains structured documentation, procedures, notices, links, tables, UI instructions, code or command examples, API reference text, placeholders, images, dates, numbers, or units.
6. Inspect enough surrounding context to preserve meaning, terminology, document purpose, and cross-file consistency. Verify factual claims against repository evidence when practical.
7. Refine the prose at the smallest useful scope. Prefer focused edits over a uniform rewrite.
8. Review the result for semantic drift, weakened or strengthened requirements, broken links, malformed Markdown, changed commands, and inconsistent terminology. Apply the relevant content checks from `content-patterns.md` when that reference was used.
9. Report the files or text changed, the main language improvements, any material judgment calls, and anything that remains unverified.

## Editing Boundaries

- Preserve technical meaning, requirements, examples, code, commands, paths, link targets, config keys, API names, and quoted interface labels unless the user requests a corresponding technical change.
- Preserve quotations and attributed statements. Do not silently rewrite another author's words.
- Preserve established product, community, and author voice when it remains clear and appropriate.
- Preserve necessary domain terms. Define an unfamiliar term when readers need it instead of replacing it with a less accurate phrase.
- Do not apply mechanical word substitutions across a repository. Evaluate each occurrence in context.
- Do not rewrite generated documentation, vendored content, or code under a prose-only request.
- Do not redesign document structure, branding, navigation, or visual presentation unless the user includes that work in scope.
- Do not claim compliance with Google, Microsoft, Apple, or another external style guide. Apply the selected language principles as editorial guidance.
- Do not create a style report or other persistent artifact unless the user requests one.

## Audit Output

For audit mode, prioritize findings that materially affect comprehension or correctness. Give each finding a location, explain its effect briefly, and suggest a concrete revision. Do not inventory minor personal preferences.

For rewrite mode, lead with the completed result. Summarize the changes without reproducing the full diff.
