// GENERATED from docs/design.md (Fallow) — the single source of truth.
// Flutter has no live token-binding mechanism, so this is a generated constants
// file: edit docs/design.md, then re-run /design-system tokens to regenerate it.
// Do not hand-edit values here.

import 'package:flutter/material.dart';

class FallowColors {
  final Color primary;
  final Color primaryHover;
  final Color onPrimary;
  final Color surface;
  final Color surfaceRaised;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color focusRing;
  final Color accent;
  final Color success;
  final Color warning;
  final Color danger;
  final Color info;

  const FallowColors._({
    required this.primary,
    required this.primaryHover,
    required this.onPrimary,
    required this.surface,
    required this.surfaceRaised,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.focusRing,
    required this.accent,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
  });

  static const light = FallowColors._(
    primary: Color(0xFF6E93A8),
    primaryHover: Color(0xFF567A8F),
    onPrimary: Color(0xFFF5F6F2),
    surface: Color(0xFFE8EAE4),
    surfaceRaised: Color(0xFFF5F6F2),
    textPrimary: Color(0xFF14181D),
    textSecondary: Color(0xFF445168),
    textMuted: Color(0xFF667085),
    border: Color(0xFFC7CBC2),
    focusRing: Color(0xFF6E93A8),
    accent: Color(0xFF6E93A8),
    success: Color(0xFF6B8F71),
    warning: Color(0xFFA9862E),
    danger: Color(0xFFB2564A),
    info: Color(0xFF6E93A8),
  );

  static const dark = FallowColors._(
    primary: Color(0xFF8FB0C2),
    primaryHover: Color(0xFFA9C6D5),
    onPrimary: Color(0xFF14181D),
    surface: Color(0xFF1B2430),
    surfaceRaised: Color(0xFF2B3A4F),
    textPrimary: Color(0xFFE8EAE4),
    textSecondary: Color(0xFF9AA8BC),
    textMuted: Color(0xFF74839A),
    border: Color(0xFF465872),
    focusRing: Color(0xFF8FB0C2),
    accent: Color(0xFF8FB0C2),
    success: Color(0xFF9CC2A0),
    warning: Color(0xFFD9B457),
    danger: Color(0xFFD98A7D),
    info: Color(0xFF8FB0C2),
  );

  static FallowColors of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;
}

class Space {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xl2 = 32.0;
  static const xl3 = 48.0;
}

class AppRadius {
  static const sm = 4.0;
  static const md = 8.0;
  static const lg = 16.0;
  static const full = 999.0;
}

class TypeScaleStep {
  final double size;
  final double lineHeight; // multiplier
  final FontWeight weight;
  final double letterSpacing; // logical px, derived from the em value in design.md
  const TypeScaleStep({
    required this.size,
    required this.lineHeight,
    required this.weight,
    required this.letterSpacing,
  });
}

class TypeScale {
  static const xs = TypeScaleStep(size: 12, lineHeight: 1.35, weight: FontWeight.w500, letterSpacing: 0.24);
  static const sm = TypeScaleStep(size: 14, lineHeight: 1.45, weight: FontWeight.w400, letterSpacing: 0);
  static const md = TypeScaleStep(size: 16, lineHeight: 1.55, weight: FontWeight.w400, letterSpacing: 0);
  static const xl = TypeScaleStep(size: 20, lineHeight: 1.4, weight: FontWeight.w600, letterSpacing: 0);
  static const xl2 = TypeScaleStep(size: 28, lineHeight: 1.2, weight: FontWeight.w700, letterSpacing: -0.56);
  static const xl3 = TypeScaleStep(size: 36, lineHeight: 1.15, weight: FontWeight.w700, letterSpacing: -0.72);

  // wordmark: app-bar title (-0.01em ≈ -0.22px tracking).
  static const wordmark = TypeScaleStep(size: 22, lineHeight: 1.2, weight: FontWeight.w600, letterSpacing: -0.22);

  // overline: xs source, uppercase, w600, 0.16em (1.92px) tracking — for the "REFLECT" eyebrow only.
  static const overline = TypeScaleStep(size: 12, lineHeight: 1.35, weight: FontWeight.w600, letterSpacing: 1.92);
}

const fontFamily = 'Manrope';

class Motion {
  static const fast = Duration(milliseconds: 120);
  static const base = Duration(milliseconds: 220);
  static const slow = Duration(milliseconds: 320);
  static const easing = Cubic(0.2, 0, 0, 1);
}

class Horizon {
  static const opacity = 0.35;
  static const thickness = 1.0;
}
