# Technical Content Patterns

Use the sections that match the target. These patterns cover broadly useful content and accessibility guidance. Project-specific structure, markup, and formatting remain authoritative.

## Contents

- [Document structure](#document-structure)
- [Procedures and notices](#procedures-and-notices)
- [Links and cross-references](#links-and-cross-references)
- [Code, commands, APIs, and interfaces](#code-commands-apis-and-interfaces)
- [Examples and placeholders](#examples-and-placeholders)
- [Images and accessibility](#images-and-accessibility)
- [Dates, numbers, units, and mathematical content](#dates-numbers-units-and-mathematical-content)
- [Formatting boundaries](#formatting-boundaries)

## Document Structure

- Use a descriptive title and heading hierarchy that reflects the document structure. Do not skip heading levels or use headings only for visual styling.
- Make headings specific enough to distinguish sections when they appear in navigation or search results.
- Use an imperative or task phrase for a procedure heading and a noun phrase for a concept heading when that distinction helps readers.
- Use numbered lists for ordered actions, bullets for unordered items, and a table or description list only when readers need to compare or map values.
- Keep list items grammatically parallel. Introduce a list when its purpose is not clear from the preceding sentence or heading.
- Avoid deep list nesting, single-item lists, and tables that contain long passages of prose.
- Use tables for multidimensional relationships, not page layout. Give columns clear headings and provide a caption or introduction when readers need context.
- Avoid footnotes when an inline explanation, notice, or descriptive link would be clearer and more accessible.

## Procedures and Notices

- Put prerequisites and required context before the steps.
- Use numbered steps for actions that readers must perform in order.
- Start each step with an imperative action when practical.
- Keep one meaningful action or decision in each step. Split a step when readers must verify an intermediate result before continuing.
- Put a condition or goal before the action that depends on it.
- Label optional steps and alternatives. Present the shortest or default path first, then distinguish other paths clearly.
- State the expected result after the action when readers need it to confirm progress.
- Do not repeat a shared procedure when a stable cross-reference is clearer.
- Use a note, caution, or warning only for material information. Do not hide a prerequisite or critical step inside a notice, and match the notice severity to the consequence.

## Links and Cross-References

- Put information needed to understand or complete the current task in the current document. Use links for supporting detail, not as substitutes for essential context.
- Write descriptive link text that identifies the destination or purpose. Do not use `click here`, `this link`, or a bare URL when a useful label fits.
- Avoid several adjacent links or repeated links to the same destination when one clear reference works.
- Mention unusual link behavior, such as a download or an external system, when readers need that information before following the link.
- Do not force a link to open in a new browsing context unless the target experience requires it.
- Keep anchors stable when practical. If a heading change alters an anchor, update inbound links or preserve a compatible anchor.
- Verify changed link targets when the environment permits it. Report links that remain unverified.

## Code, Commands, APIs, and Interfaces

- Preserve code, syntax, exact identifiers, interface labels, and output unless the user requests a technical change.
- Distinguish literal code from prose with the target format's semantic markup. Do not format product names, URLs, or ordinary technical terms as code solely because they are technical.
- Introduce a code sample with its purpose and relevant context. Explain non-obvious behavior after the sample instead of narrating every line.
- Make runnable examples copyable. Do not include shell prompt characters in a command that readers should copy, and distinguish input from output.
- Mark placeholders, optional arguments, repeated arguments, omitted sections, and variable output clearly and consistently.
- Follow the project's code style in samples. Do not rewrite code merely to satisfy prose guidance.
- Keep sample comments focused on purpose, decisions, and non-obvious behavior. Do not restate code in prose.
- In API reference text, begin with the element's purpose in present tense. Document parameters, defaults, return values, errors, side effects, constraints, and deprecations when they are part of the contract.
- When an API is deprecated, identify the preferred replacement or migration path when one exists.
- Do not repeat information that the API signature already expresses unless the repetition adds meaning.
- For UI instructions, describe the reader's goal and use the exact visible label. Name the control type only when it helps, and do not rely on location-only phrases such as `above` or `on the right`.

## Examples and Placeholders

- Use examples that are relevant, internally consistent, and sufficient to demonstrate the point.
- Do not use real personal data, credentials, secrets, private domains, or routable sample addresses. Use reserved or clearly fictitious values.
- Use descriptive placeholder names and one placeholder syntax consistently. Explain a placeholder before or near its first use.
- Avoid `foo`, `bar`, and similar arbitrary names when a meaningful name makes the example easier to understand.
- Use inclusive names, roles, and scenarios without stereotypes or assumptions about the reader.
- Do not present illustrative output as an observed result. Mark abridged, variable, or hypothetical output.

## Images and Accessibility

- Keep the document understandable when readers cannot perceive color, position, motion, audio, or an image.
- Add alt text that communicates an image's purpose or information rather than listing decorative details. Use a caption when readers need context beyond the alt text.
- Do not place essential instructions or text only inside an image, video, or audio track.
- Refer to content by its name or purpose rather than only by visual location, shape, or color.
- Use semantic headings, lists, tables, links, and controls so assistive technology can expose the structure.
- Provide captions, transcripts, or equivalent alternatives for time-based media when applicable.
- Check that instructions remain usable with keyboard navigation and screen readers when the target includes an interactive interface.

## Dates, Numbers, Units, and Mathematical Content

- Use unambiguous dates. Include the year when readers could otherwise infer the wrong one, and avoid seasons as time references for a global audience.
- Include a time zone when a time depends on location. Follow the project's date and time convention when it remains unambiguous.
- Preserve significant digits, ranges, signs, and units. Do not simplify a number in a way that changes its meaning.
- State units consistently and repeat them when omission could create ambiguity.
- Explain mathematical notation in prose and provide an accessible text equivalent when the notation is essential.
- Use fictitious, reserved, or example-safe phone numbers, addresses, domains, and identifiers.

## Formatting Boundaries

Use semantic formatting to communicate meaning, not decoration. Follow local Markdown, HTML, capitalization, punctuation, code-formatting, UI-formatting, and image conventions. Do not use this reference to impose Google's publishing system or house style on another project.

## Further Reference

Consult these official Google topics when a case needs more detail:

- [Accessibility](https://developers.google.com/style/accessibility), [inclusive documentation](https://developers.google.com/style/inclusive-documentation), and [translation](https://developers.google.com/style/translation)
- [Headings](https://developers.google.com/style/headings), [lists](https://developers.google.com/style/lists), and [tables](https://developers.google.com/style/tables)
- [Cross-references](https://developers.google.com/style/cross-references), [procedures](https://developers.google.com/style/procedures), and [notices](https://developers.google.com/style/notices)
- [Code samples](https://developers.google.com/style/code-samples), [code syntax](https://developers.google.com/style/code-syntax), and [API reference comments](https://developers.google.com/style/api-reference-comments)
- [UI elements](https://developers.google.com/style/ui-elements), [examples](https://developers.google.com/style/examples), [placeholders](https://developers.google.com/style/placeholders), and [images](https://developers.google.com/style/images)
