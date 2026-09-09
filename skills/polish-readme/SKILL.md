---
name: polish-readme
description: Create or refresh a factual README while preserving project voice. Use only when explicitly requested as $polish-readme.
---

# Polish README

Improve the target README using repository evidence. Honor a supplied path or directory; otherwise use the current project's `README.md`. A supplied README may live below the project root, so discover ownership from manifests and guidance rather than assuming its parent owns the project.

## Evidence and Structure

Read the existing README and the manifests, commands, examples, license, and product documentation needed to check its claims. Inspect relevant entrypoints when usage is unclear. Do not inventory unrelated source merely to rewrite introductory prose.

Preserve deliberate branding, voice, useful examples, and accurate external facts. Mark facts that cannot be checked as unverified rather than treating them as false or silently deleting them.

Put purpose and the reader's first useful action near the top. Select sections for the actual project: a library needs usage and API discovery; a resource repository may need contents, consumption, and maintenance. Link to detailed docs instead of repeating them.

Use [the optional outline](assets/readme.template.md) when creating a README or when its structure needs replacement. Omit irrelevant sections and replace all placeholders. Preserve the existing structure for narrower updates.

## Style Defaults

Use a friendly, emoji-accented presentation: centered title or existing logo, a short subtitle, flat-square Shields badges backed by project facts, section navigation, emoji section headings, and concise emoji feature bullets. These are the standard presentation, not optional polish. Preserve explicit project presentation requirements and keep narrow edits scoped rather than redesigning unrelated sections.

Keep the first screen focused on the project name, purpose, badges, and navigation. Use existing or supplied logos and banners; do not invent assets or badges to fill the layout. Use practical install and quick-start examples, adapting section choices to the project.

Include factual badges as part of the standard presentation; omit unsupported badges. Screenshots, comparisons, benchmarks, adopters, and release highlights are optional additions when supported and useful. Do not invent APIs, install commands, features, assets, popularity, or support promises.

Use consistent terminology, actionable instructions, and descriptive links. Preserve requirements and commands when editing wording. Consult external README examples only when the user requests inspiration.

## Completion

Verify changed links and anchors, heading structure, code-fence languages, and command names against project evidence. Execute examples only when their side effects are understood and the check is relevant and authorized.

Repair introduced issues and report the completed README, material assumptions, and unverified links or commands. Do not repeat the rewrite plan.
