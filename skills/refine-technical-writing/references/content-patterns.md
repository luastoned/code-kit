# Technical Content Patterns

Use this reference when the requested revision changes a procedure, reference format, or accessibility behavior. Existing project structure and markup conventions remain authoritative.

## Structure and Procedures

Use semantic heading levels and descriptive titles. Group content around reader tasks. Use numbered steps for dependent actions, bullets for parallel items, and tables when values need comparison.

Put prerequisites before the steps and conditions before dependent actions. Distinguish optional paths. State an expected result when readers need it to confirm progress. Use warnings only for material consequences, and keep critical prerequisites in the main procedure.

Avoid repeated procedures when a stable cross-reference suffices. Do not impose a standard section inventory on a document that does not need it.

## Links and Examples

Use descriptive link text and preserve stable anchors where practical. Update inbound links when a heading changes. Check changed targets; report unavailable external sources rather than inventing their content.

Make examples copyable and distinguish commands from output. Explain placeholders and mark illustrative, abridged, or variable results. Preserve code syntax and significant identifiers unless the task authorizes a technical change.

Use fictitious or reserved values for sample credentials, personal data, and network addresses. Retain context needed to run commands safely.

## API and Interface Instructions

Describe the element's purpose and document inputs, defaults, outputs, errors, side effects, constraints, and deprecations that are part of its contract. Do not repeat an API signature unless the explanation adds meaning. Identify migration paths for deprecated interfaces when known.

Describe the user's goal with exact visible interface labels. Avoid instructions that depend only on position, color, or shape.

## Accessibility

Use semantic headings, lists, tables, and controls. Supply informative alt text or an equivalent text explanation when an image conveys essential information. Do not place essential instructions only in images, motion, or audio.

When revising an interactive flow, check the affected keyboard and assistive-technology behavior when tools permit. Preserve units, signs, precision, time zones, and mathematical meaning; explain essential notation.

## Further Reference

Consult the relevant official Google topic only when the current revision needs detail:

- [Procedures](https://developers.google.com/style/procedures) and [notices](https://developers.google.com/style/notices).
- [Cross-references](https://developers.google.com/style/cross-references) and [code samples](https://developers.google.com/style/code-samples).
- [API reference comments](https://developers.google.com/style/api-reference-comments) and [UI elements](https://developers.google.com/style/ui-elements).
- [Accessibility](https://developers.google.com/style/accessibility) and [images](https://developers.google.com/style/images).

These patterns do not prescribe an external publisher's house style.
