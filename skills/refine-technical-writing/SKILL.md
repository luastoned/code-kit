---
name: refine-technical-writing
description: Audit or revise technical prose without changing meaning or established voice. Use only when explicitly requested as $refine-technical-writing.
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
4. Read [references/language-principles.md](references/language-principles.md) for a broad editorial pass or a question about terminology, modality, or evidence. A narrow correction with a clear local convention does not require it.
5. Read [references/content-patterns.md](references/content-patterns.md) when restructuring a procedure, API reference, accessibility guidance, or another content form whose conventions affect the requested revision. Merely containing a link, heading, or code block does not require loading the reference.
6. Inspect enough surrounding context to preserve meaning, terminology, document purpose, and cross-file consistency. Verify factual claims against repository evidence when practical.
7. In audit mode, return findings without editing or formatting files. In rewrite mode, refine the prose at the smallest useful scope; prefer focused edits over a uniform rewrite.
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
