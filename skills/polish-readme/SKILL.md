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

Follow established project style first. When no style exists and a full presentation is requested, this skill's preference is friendly prose, restrained emoji headings, and a concise title or existing logo. Centered HTML, navigation, and flat-square badges are optional.

Use badges, screenshots, comparisons, benchmarks, adopters, and release highlights only when supported and useful. Do not invent APIs, install commands, features, assets, popularity, or support promises.

Use consistent terminology, actionable instructions, and descriptive links. Preserve requirements and commands when editing wording. Consult external README examples only when the user requests inspiration.

## Completion

Verify changed links and anchors, heading structure, code-fence languages, and command names against project evidence. Execute examples only when their side effects are understood and the check is relevant and authorized.

Repair introduced issues and report the completed README, material assumptions, and unverified links or commands. Do not repeat the rewrite plan.
