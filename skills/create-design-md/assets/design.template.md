---
version: alpha
name: '{{design-system-name}}'
description: '{{one-sentence-specific-design-description}}'
colors:
  primary: '{{css-color}}'
  on-primary: '{{css-color}}'
  surface: '{{css-color}}'
  on-surface: '{{css-color}}'
typography:
  headline-lg:
    fontFamily: '{{font-family-and-fallbacks}}'
    fontSize: '{{dimension}}'
    fontWeight: '{{number}}'
    lineHeight: '{{dimension-or-number}}'
    letterSpacing: '{{dimension}}'
  body-md:
    fontFamily: '{{font-family-and-fallbacks}}'
    fontSize: '{{dimension}}'
    fontWeight: '{{number}}'
    lineHeight: '{{dimension-or-number}}'
rounded:
  sm: '{{dimension}}'
  md: '{{dimension}}'
spacing:
  sm: '{{dimension}}'
  md: '{{dimension}}'
  lg: '{{dimension}}'
components:
  button-primary:
    backgroundColor: '{colors.primary}'
    textColor: '{colors.on-primary}'
    typography: '{typography.body-md}'
    rounded: '{rounded.sm}'
    padding: '{spacing.md}'
  card-surface:
    backgroundColor: '{colors.surface}'
    textColor: '{colors.on-surface}'
    rounded: '{rounded.md}'
    padding: '{spacing.lg}'
---

# Design System

## Overview

{{Name a specific visual reference, audience, emotional response, and the design's governing idea. Explain why it fits the product.}}

## Colors

{{Explain the palette strategy and the semantic role, application, and restraint of each color.}}

## Typography

{{Explain the type hierarchy, font roles, reading density, casing, and when each level is used.}}

## Layout

{{Describe the grid or flow model, container behavior, spacing rhythm, density, breakpoints, and responsive priorities.}}

## Elevation & Depth

{{Explain whether hierarchy uses shadows, borders, tonal surfaces, blur, overlap, or deliberate flatness. Include exact observed values when available.}}

## Shapes

{{Describe the geometry, corner-radius roles, border language, icon shapes, and consistency constraints.}}

## Components

{{Describe the visual and interaction rules for the important component families and their states.}}

## Do's and Don'ts

- Do {{specific behavior that reinforces the design reference}}.
- Don't {{specific drift that would weaken the design's character}}.
