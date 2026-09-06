---
name: create-design-md
description: Create or update a DESIGN.md from visual evidence or a design brief. Use only when explicitly requested as $create-design-md.
---

# Create DESIGN.md

Create a design system whose rationale explains the visual intent and whose supported tokens make implementation repeatable. Honor an existing path, casing, format, and confirmed design decisions; otherwise use `DESIGN.md` in the project root.

## Evidence and Input

Inspect relevant local themes, CSS variables, fonts, assets, components, screenshots, and product context before asking for missing decisions.

For a webpage reference, read [webpage inspection](references/url-inspection.md). Use rendered evidence and computed values where available; text alone cannot establish visual design. Load only the pages and viewports needed to identify the system.

For a brief or local project, use the supplied audience, visual references, branding, density, responsive priorities, and constraints. Ask a focused question only if missing intent would materially alter the result. If the user delegated unspecified choices, propose them and continue. Pause only when there is too little intent to distinguish a useful design and that choice has not been delegated.

## Synthesis

- Explain the specific visual character, intended audience, and why it fits. Preserve evocative language when it carries design intent.
- Select repeated or semantically important tokens rather than cataloging every observed value.
- Distinguish observed values, inferred patterns, and proposed decisions. Do not invent precise colors, metrics, states, or breakpoints and present them as observations.
- Describe hierarchy, responsive priorities, important component states, and constraints that prevent meaningful design drift.
- Preserve confirmed local choices unless redesign is requested or evidence establishes they are stale. Identify unavailable proprietary fonts and assets.
- Include accessible foreground/background pairs when known. Claim contrast results only when checked.

## Format and Completion

Read [format and validation](references/format.md) when writing or changing structured tokens or checking format compatibility. Use [the optional template](assets/design.template.md) only when creating a new document or replacing an inadequate structure. Remove unsupported fields and placeholders; do not fill sections solely because the template has them.

Validate the representation being changed, resolve token references, and check defined contrast pairs with available tools. Continue through corrections within scope. Report the completed file, material evidence and inferred choices, validation, and unresolved source or asset limitations.
