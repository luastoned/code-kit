---
name: create-design-md
description: Create or update a DESIGN.md visual design-system file from a public webpage URL, existing project artifacts, screenshots, or a user-supplied design brief. Use only when the user explicitly invokes `$create-design-md` or names the `create-design-md` skill.
---

# Create DESIGN.md

## Overview

Create a prose-led design system with exact, machine-readable tokens in YAML front matter. Treat the design rationale as the primary artifact: tokens make decisions repeatable, while the prose explains the visual reference, intent, application, and constraints that keep generated interfaces from becoming generic.

Default to `DESIGN.md` in the target project root, following the format convention. Honor another path or casing such as `design.md` when the user specifies it or the project already uses it. Use [assets/design.template.md](assets/design.template.md) as an outline, replacing or removing every placeholder and unsupported section.

## Workflow

1. Resolve the target project and output path from the request or current working directory.
2. Inspect existing design context before asking questions or writing:
   - Existing `DESIGN.md` or `design.md` files.
   - CSS variables, theme files, Tailwind or component-library config, global styles, fonts, assets, screenshots, and representative UI components.
   - Product purpose, audience, and branding described in README or product docs.
3. Select an input mode:
   - Use [URL Mode](#url-mode) when the user supplies a webpage URL.
   - Use [Brief Mode](#brief-mode) when no usable URL is available.
   - Combine both when local artifacts or user constraints should refine a webpage-derived system.
4. Build an evidence summary before drafting: specific visual reference, repeated token values, layout rhythm, component language, responsive behavior, and hard constraints.
5. Synthesize the file using [Design Rules](#design-rules) and [Format Rules](#format-rules).
6. If a target file exists, merge deliberately. Preserve confirmed local decisions and replace them only when the user requests a redesign or stronger current evidence establishes that they are stale.
7. Validate the completed file and review it for unresolved placeholders, unsupported claims, duplicated sections, broken references, and internal contradictions.

## URL Mode

Inspect the rendered webpage rather than relying only on page text or metadata.

1. Confirm the URL is a reachable public HTTP or HTTPS page. Do not bypass authentication, paywalls, access controls, CAPTCHAs, or anti-bot protections.
2. Use available browser, screenshot, page-inspection, and fetch tools to examine:
   - A representative desktop viewport and a narrow/mobile viewport when possible.
   - The primary page plus at most a few same-site screens needed to distinguish system-wide patterns from one-off hero styling.
   - Loaded stylesheets, CSS custom properties, computed styles, and font declarations when tools expose them.
3. Record evidence for:
   - Repeated and semantic colors, including surfaces, text, borders, accents, and interaction states.
   - Font families and fallbacks, type roles, sizes, weights, line heights, and letter spacing.
   - Spacing rhythm, grids, container widths, gutters, density, and responsive changes.
   - Radii, borders, shadows, blur, overlays, gradients, and other depth signals.
   - Buttons, links, navigation, cards, inputs, lists, badges, and their visible states.
   - Iconography, imagery, motion, and other domain-specific design language when evident.
4. Distinguish direct observations from inference. Repeated computed values are strong evidence; a single decorative value is not automatically a system token.
5. Extract the visual system, not page copy, proprietary assets, or hidden implementation details. Name proprietary fonts when declared, but do not claim they are available to the target project without evidence.
6. If rendering or inspection is blocked, ask the user for screenshots, exported styles/tokens, or the brief inputs below. State the reduced evidence level instead of fabricating exact values.

## Brief Mode

Inspect local artifacts first, then ask one consolidated question covering only missing design decisions. Request:

- Product name, purpose, audience, and primary interface type.
- A specific visual reference or concrete design world, plus the intended emotional response. Prefer references such as “a 1970s university lecture handout” over generic adjectives such as “modern” or “premium.”
- Existing colors, fonts, logos, screenshots, tokens, or brand requirements that must be preserved.
- Desired density, responsive priorities, and the components or screens that matter most.
- Hard do's, don'ts, accessibility requirements, and whether the agent may propose unspecified values.

Let the user answer with partial information or “propose the rest.” Do not require exact tokens from a user who wants the agent to define them. Pause for input when neither the project nor the user provides enough intent to distinguish the design from a generic default.

## Design Rules

- Lead the Overview with one specific visual reference, the audience, and the desired emotional effect. Explain what the interface should feel like and why.
- Use concise, unambiguous technical language for tokens, application rules, and constraints. Preserve specific, evocative language when it carries design intent.
- Prefer a small coherent system over a census of every observed value. Include repeated or semantically important tokens and explain their roles.
- Keep evidence and inference honest. Do not present guessed colors, font metrics, breakpoints, shadows, or interaction states as observed facts.
- Describe negative constraints that protect the design's character. Use a focused list of meaningful do's and don'ts instead of generic quality advice.
- Define how hierarchy works through color, type, space, shape, and depth—not merely the values themselves.
- Describe responsive behavior and layout priorities when the product spans multiple viewport sizes.
- Define component variants as separate related entries, such as `button-primary`, `button-primary-hover`, and `button-primary-active`.
- Include accessible foreground/background pairs. Do not claim WCAG compliance unless contrast was actually checked.
- Add domain-specific prose sections such as Motion, Iconography, Imagery, Data Visualization, or Content Style only when they materially define the system.

## Format Rules

- Put YAML front matter first, bounded by exact `---` lines. Use `version: alpha`, a required `name`, and an optional concise `description`.
- Use the supported top-level token groups when applicable: `colors`, `typography`, `rounded`, `spacing`, and `components`. Custom token groups are allowed when the design needs them.
- Use valid CSS colors. Prefer `#RRGGBB` for simple colors while preserving meaningful functional or wide-gamut values when observed.
- Use `px`, `em`, or `rem` dimensions. Use a number only for unitless spacing values or typography line-height.
- Keep typography tokens to supported properties: `fontFamily`, `fontSize`, `fontWeight`, `lineHeight`, `letterSpacing`, `fontFeature`, and `fontVariation`.
- Use `{path.to.token}` references and ensure every reference resolves. Component references may point to composite typography tokens.
- Keep component token properties to `backgroundColor`, `textColor`, `typography`, `rounded`, `padding`, `size`, `height`, and `width`; place borders, shadows, motion, and richer behavior in prose or custom token groups.
- Use unique `##` headings in this canonical order, omitting only irrelevant sections: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and Don'ts.
- Place extra domain-specific `##` sections after the canonical sections. Preserve useful unknown sections when updating an existing file.
- Do not leave empty sections or template placeholders.

## Validation

1. Parse the YAML front matter with an available project-local parser.
2. Check canonical section order, unique `##` headings, CSS color and dimension syntax, and all token references.
3. Check component text/background contrast with an available contrast tool when those pairs are defined.
4. If the `@google/design.md` CLI is already installed, run the project-local equivalent of `designmd lint DESIGN.md`. On non-Windows systems, `design.md lint DESIGN.md` may also be available.
5. Do not install packages or invoke a network-backed `npx` download solely for validation without permission. If the CLI is unavailable, perform the manual checks and state that official linting did not run.
6. Treat linter warnings as review prompts, not reasons to pad the document with invented tokens or prose.

## Output Expectations

Write the completed file, then report its path, input mode and evidence used, major inferred decisions, and validation performed. Call out inaccessible sources, unresolved design choices, missing font/assets, or resolver/tool limitations that may affect implementation.
