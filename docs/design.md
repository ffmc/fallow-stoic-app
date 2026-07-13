---
version: alpha
name: Fallow
description: A calm, reading-first Stoic reflection app — warm paper by day, cool slate by night, with one muted tide-blue accent and a single fading horizon-line motif.
colors:
  primary:        { light: "#6E93A8", dark: "#8FB0C2" }
  primaryHover:   { light: "#567A8F", dark: "#A9C6D5" }
  onPrimary:      { light: "#F5F6F2", dark: "#14181D" }
  surface:        { light: "#E8EAE4", dark: "#1B2430" }
  surfaceRaised:  { light: "#F5F6F2", dark: "#2B3A4F" }
  textPrimary:    { light: "#14181D", dark: "#E8EAE4" }
  textSecondary:  { light: "#445168", dark: "#9AA8BC" }
  textMuted:      { light: "#667085", dark: "#74839A" }
  border:         { light: "#C7CBC2", dark: "#465872" }
  focusRing:      { light: "#6E93A8", dark: "#8FB0C2" }
  accent:         { light: "#6E93A8", dark: "#8FB0C2" }
  success:        { light: "#6B8F71", dark: "#9CC2A0" }
  warning:        { light: "#A9862E", dark: "#D9B457" }
  danger:         { light: "#B2564A", dark: "#D98A7D" }
  info:           { light: "#6E93A8", dark: "#8FB0C2" }
typography:
  fontFamily: "Manrope"
  ratio: "~1.2 (minorThird, hand-tuned)"
  scale:
    xs:  { size: "12px", lineHeight: 1.35, weight: 500, letterSpacing: "0.02em" }
    sm:  { size: "14px", lineHeight: 1.45, weight: 400, letterSpacing: "0em" }
    md:  { size: "16px", lineHeight: 1.55, weight: 400, letterSpacing: "0em" }
    xl:  { size: "20px", lineHeight: 1.4,  weight: 600, letterSpacing: "0em" }
    2xl: { size: "28px", lineHeight: 1.2,  weight: 700, letterSpacing: "-0.02em" }
    3xl: { size: "36px", lineHeight: 1.15, weight: 700, letterSpacing: "-0.02em" }
  wordmark: { size: "22px", lineHeight: 1.2, weight: 600, letterSpacing: "-0.01em" }
  overline: { source: xs, weight: 600, letterSpacing: "0.16em", transform: uppercase }
spacing: { xs: "4px", sm: "8px", md: "12px", lg: "16px", xl: "24px", 2xl: "32px", 3xl: "48px" }
radius:  { sm: "4px", md: "8px", lg: "16px", full: "999px" }
elevation:
  strategy: border-only
  flat:   { border: "1px solid {colors.border}", shadow: none }
  raised: { border: "1px solid {colors.border}", shadow: none, background: "{colors.surfaceRaised}" }
motion:
  fast: "120ms"
  base: "220ms"
  slow: "320ms"
  easing: "cubic-bezier(0.2, 0, 0, 1)"
horizon:
  color: "{colors.accent}"
  opacity: 0.35
  thickness: "1px"
  shape: "horizontal gradient, transparent → color@opacity → transparent"
components:
  screen:
    variants: [scroll]
    states:   [default]
    tokens: { background: "{colors.surface}", contentPaddingX: "{spacing.xl}", contentPaddingTop: "{spacing.sm}", contentPaddingBottom: "{spacing.2xl}" }
  appBar:
    variants: [home, detail]
    states:   [default, pinned]
    tokens: { background: "{colors.surface}", title: "{colors.textPrimary}", titleType: "{type.wordmark}", icon: "{colors.textMuted}", shadow: none }
  card:
    variants: [tile, prompt, quote]
    states:   [default, pressed]
    tokens:
      background: "{colors.surfaceRaised}"
      border:     "1px solid {colors.border}"
      radius:     "{radius.lg}"
      padding:    "{spacing.xl}"
      gapWithin:  "{spacing.md}"
      pressedOverlay: "{colors.textPrimary} @ 6%"
      minHit:     "44px"
  eyebrow:
    variants: [default]
    states:   [default]
    tokens: { type: "{type.overline}", color: "{colors.accent}", marginBottom: "{spacing.sm}" }
  horizonLine:
    variants: [default]
    states:   [default]
    tokens: { color: "{colors.accent}", opacity: "{horizon.opacity}", thickness: "{horizon.thickness}" }
  iconButton:
    variants: [bar, bookmark]
    states:   [default, active, pressed]
    tokens:
      size:        "40px"
      hit:         "44px"
      icon:        "{colors.textMuted}"
      iconActive:  "{colors.accent}"
      activeHalo:  "{colors.accent} @ 12%"
      radius:      "{radius.full}"
---

# Fallow Design System

## How to build with this
> Read this file before building any UI. `docs/design.md` is the single source of truth; `docs/design.html`
> and the token files (`design-system/tokens.dart` / `tokens.css`) are generated from it — edit this file,
> then regenerate them, never the reverse. Bind every visual value to a token; never hardcode a hex, px
> size, or opacity that has a token — in particular type sizes come from `type.*`, gaps and padding from
> `spacing.*`, corners from `radius.*`, and the horizon motif from `horizon.*`. Use only the variants and
> states listed per component — the lists are CLOSED. If a feature needs a token, variant, or component
> that isn't defined here, STOP and flag the user, then add it to this file deliberately — do not improvise
> it. Honor the Do's and Don'ts; avoid the named clichés.

## Overview
Fallow is a single-purpose reflection tool: a person names a life problem, receives one authored Stoic
prompt and a few cited verbatim quotes, and can save quotes locally. No accounts, no feed, no runtime AI.
The design has one job — get out of the way of reading. The audience is anyone reaching for a moment of
composure, most often on a phone, in either bright or dim light. The felt response should be *steady,
unhurried, literary*. It must never read as a productivity dashboard, a quote-of-the-day widget, or a
gamified habit app. The one expressive move is restraint: a lot of quiet surface, one muted accent, and a
single recurring motif (the horizon line) that ties every screen together.

## Colors
The palette is built on a deliberate temperature flip between modes. **Light is warm paper** — a soft
greenish-oat `surface` (#E8EAE4) with a near-white raised card (#F5F6F2) and greenish-stone borders.
**Dark is cool slate** — a tinted near-black (#1B2430, never `#000`) with bluer raised surfaces and
borders. This is the one choice to defend to a designer: the modes are not inversions of each other, they
are two different rooms at two different times of day.

The single brand/interactive hue is **tide**, a muted blue-teal (#6E93A8) — chosen precisely because it is
*not* the default indigo/violet; it reads like weathered water, calm rather than corporate. In dark mode
tide is shifted a step lighter (#8FB0C2) to hold contrast on slate. `accent` is the same hue as `primary`;
there is intentionally no second expressive color. `primary` carries interactive affordances, the eyebrow
label, and the horizon motif.

Text runs three tiers — `textPrimary` for content, `textSecondary` for supporting body, `textMuted` for
citations and icons — all meeting WCAG AA on their surfaces in both modes. Semantics (`success` sage,
`warning` dust, `danger` clay) are earthy, drawn from the same natural register as tide, not saturated UI
primaries; they exist for future states and must not be repurposed as decoration.

## Typography
One family: **Manrope** (a geometric-humanist sans) for everything — headlines, wordmark, quotes, body,
labels. An earlier draft paired it with Newsreader (a serif) for display/reading moments, but the two
voices read as inconsistent in practice, and the serif's italic quote treatment tested as hard to read;
both were dropped in favor of one consistent face throughout.

The scale is hand-tuned around a ~1.2 minor-third feel and strictly increasing — every step has one
size and one job, no two steps share a size. `2xl`/`3xl` (screen headlines, tight negative tracking)
sit at the display end. `xl` (card titles, w600), `md` (quote body and body copy, w400, 16px — quotes
were `lg`/20px/w500 until that step was retired as redundant with `xl`), `sm` (blurbs), and `xs`
(citations) cover UI and supporting text. Quotes are marked with a small accent-colored quote glyph
(Lucide `quote`) above the text instead of a distinct type size, so the visual "this is a citation" cue
comes from the icon, not from type. The `overline` treatment (uppercase `xs`, wide 0.16em
tracking, w600, in `accent`) is reserved for the single "REFLECT" eyebrow — never for whole phrases.

## Layout
One column, phone-first. Screen content sits in `spacing.xl` (24px) side gutters. Spacing carries
hierarchy: gaps *within* a card use `sm`/`md` (8–12px), gaps *between* sections use `xl` (24px) or more, so
the eye groups content without rules doing the work. Cards use `xl` padding for generous breathing room —
this is a reading app, not a dense list. Because it is mobile, running text is allowed to fill the column;
no fixed measure token is needed, but never place long text edge-to-edge without the gutter.

## Elevation & Depth
**Border-only. There are no shadows in this system.** Depth is communicated by a raised surface
(`surfaceRaised`) plus a single hairline `border` — nothing floats. This suits the calm, flat, papery mood
and reads identically in both modes (in dark, the border does the lifting that a shadow can't). Any
shadow, glow, or halo is off-spec. The previously defined `shadow-*` tokens are intentionally dropped.
The theme enforces this globally by painting shadow color transparent, so Material's default component
elevations (cards, nav bar, hover/press state layers) never render a shadow — the rule can't be
accidentally violated by a framework default.

## Shapes
Radius varies by element class, within a closed scale. **Cards** (tile, prompt, quote) are `radius.lg`
(16px) — soft, friendly, but not pill-like. **Buttons and inputs** are `radius.md` (8px). **Circular
toggles** (the bookmark, bar icons) and any pill are `radius.full`. `radius.sm` (4px) is reserved for small
inner chips. There is no 18px or other off-scale corner — every corner is one of these four.

## Components
**screen** — the scaffold. `surface` background, `xl` horizontal gutters, comfortable top/bottom padding.

**appBar** — flat (no shadow, no bottom border), `surface` background so it dissolves into the page. Its
title uses the `wordmark` treatment — Manrope at 22px, semibold, tight tracking — so every screen's top
title reads with a bit more presence than body text. `home` variant shows the "Fallow"
wordmark plus theme + info icons; `detail` shows the category title and a back affordance. `pinned` state
keeps it fixed on scroll with no added elevation.

**card** — the workhorse, three variants sharing one skin (`surfaceRaised` + hairline `border` +
`radius.lg` + `xl` padding): `tile` (a tappable home-list category with title, blurb, and a trailing
horizon line), `prompt` (the reflection block: an `eyebrow`, the prompt in `md`, a horizon line), `quote`
(a header row with a small `accent` quote glyph on the left and the bookmark toggle on the right, the
verbatim quote in `md` below, a horizon line, then the citation in `xs` muted). All three MUST use the
identical border+radius+padding skin —
no bare-edge variants. `pressed`
applies a 6% `textPrimary` overlay; the whole card is the ≥44px hit target for `tile`.

**eyebrow** — the `overline` label ("REFLECT") in `accent`. One short word or two; never a sentence.

**horizonLine** — the signature motif: a 1px horizontal gradient, transparent → `accent` at `opacity`
(0.35) → transparent, that fades at both ends. It sits under quotes, prompts, and card content as the one
recurring flourish. Color and opacity come from `horizon.*` tokens — never hardcode the 0.35.

**iconButton** — a 40px control inside a ≥44px hit area. `bar` variant (theme toggle, info) shows a
`textMuted` icon, no background. `bookmark` variant toggles between `default` (muted, regular-weight icon)
and `active` (bolder icon in `accent` over a 12% `accent` circular halo). `pressed` uses the standard ink
ripple within `radius.full`. Icons are drawn from **Lucide** (`lucide_icons_flutter` on pub.dev) — a
stroke-only set with no separate filled glyphs, so `active` is signaled by weight + color, not a shape
swap. (Phosphor Icons was tried first but doesn't compile on Flutter 3.44+: its icon class subclasses
`IconData`, which that SDK made non-extendable.)

## Do's and Don'ts
**Do**
- Bind every size, gap, corner, and opacity to a token; if you're typing a raw px or hex in a widget, stop and use the token.
- Keep one type family (Manrope) everywhere; vary voice with size/weight/tracking, not a second font.
- Give every card the same border+radius+padding skin; distinguish variants by content, not by edge.
- Let spacing group content — tight within, generous between — instead of adding rules or boxes.
- Design each mode on its own terms (warm paper vs cool slate), verifying AA contrast in both.

**Don't**
- Don't add shadows, glows, or halos — elevation is border-only, and colored glows are banned outright.
- Don't introduce a second accent hue, a purple/blue gradient, or repurpose the earthy semantics as decoration.
- Don't use an off-scale radius (no 18px), uniform-everything spacing, or cramped card padding.
- Don't introduce a second font family — a single consistent voice is the point.
- Don't use emoji as icons or list markers, and don't hardcode the horizon line's 0.35 opacity.
