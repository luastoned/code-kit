# DESIGN.md Format and Validation

The compatibility reference is the [Google Labs DESIGN.md specification](https://github.com/google-labs-code/design.md/blob/main/docs/spec.md). It is an evolving alpha format. Follow the target's declared version and installed tooling when they differ from this snapshot; report material incompatibilities rather than silently changing schemas.

The upstream format allows prose without token frontmatter. This skill defaults to tokens plus rationale for reusable implementation; that is an output preference, not a claim that upstream requires YAML. Preserve an existing prose-only document unless the task calls for adding tokens.

## Format Rules

- When including tokens, put YAML front matter first, bounded by exact `---` lines. Use `version: alpha` for this profile, a required `name`, and an optional concise `description`.
- Use the supported top-level token groups when applicable: `colors`, `typography`, `rounded`, `spacing`, and `components`. Custom token groups are allowed when the design needs them.
- Use valid CSS colors. Prefer `#RRGGBB` for simple colors while preserving meaningful functional or wide-gamut values when observed.
- Use `px`, `em`, or `rem` dimensions. Use a number only for unitless spacing values or typography line-height.
- Keep typography tokens to supported properties: `fontFamily`, `fontSize`, `fontWeight`, `lineHeight`, `letterSpacing`, `fontFeature`, and `fontVariation`.
- Use `{path.to.token}` references and verify that every reference resolves. Component references may point to composite typography tokens.
- Keep component token properties to `backgroundColor`, `textColor`, `typography`, `rounded`, `padding`, `size`, `height`, and `width`; place borders, shadows, motion, and richer behavior in prose or custom token groups.
- For the alpha profile, use unique `##` headings in this order, omitting irrelevant sections in accordance with the target linter: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, Do's and Don'ts.
- Place extra domain-specific `##` sections after the canonical sections. Preserve useful unknown sections when updating an existing file.
- Do not leave empty sections or template placeholders.

## Validation

1. Parse YAML front matter when present with an available project-local parser.
2. Check canonical section order, unique `##` headings, CSS color and dimension syntax, and all token references.
3. Check component text and background contrast with an available contrast tool when those pairs are defined.
4. If the `@google/design.md` CLI is already installed, run the project-local equivalent of `designmd lint DESIGN.md`. On non-Windows systems, `design.md lint DESIGN.md` may also be available.
5. Reuse existing authorization for required tooling. If installing the CLI is outside scope, use the available checks and state that official linting did not run; do not invoke a network-backed download by assumption.
6. Treat linter warnings as review prompts, not reasons to pad the document with invented tokens or prose.
