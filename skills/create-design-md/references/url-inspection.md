# Webpage Design Inspection

Inspect the rendered webpage rather than relying only on page text or metadata.

1. Confirm the URL is a reachable public HTTP or HTTPS page. Do not bypass authentication, paywalls, access controls, CAPTCHAs, or anti-bot protections.
2. Use available browser, screenshot, page-inspection, and fetch tools to examine:
   - A representative desktop viewport and a narrow or mobile viewport when possible.
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
6. If rendering or inspection is blocked, use sufficient supplied local evidence or an authorized design brief and state the reduced evidence level. Ask for screenshots, exported styles, or missing design intent only when the task depends on that evidence; do not fabricate exact observed values.
