import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tokens.dart';

/// Semantic color accessor for widgets, backed by the generated [FallowColors]
/// tokens. `text`/`muted`/`subtle` are the three text tiers; `onAccent` is the
/// on-primary color.
class AppColors {
  final Color surface;
  final Color surfaceRaised;
  final Color border;
  final Color text;
  final Color muted;
  final Color subtle;
  final Color accent;
  final Color onAccent;

  const AppColors._({
    required this.surface,
    required this.surfaceRaised,
    required this.border,
    required this.text,
    required this.muted,
    required this.subtle,
    required this.accent,
    required this.onAccent,
  });

  static AppColors _from(FallowColors c) => AppColors._(
        surface: c.surface,
        surfaceRaised: c.surfaceRaised,
        border: c.border,
        text: c.textPrimary,
        muted: c.textSecondary,
        subtle: c.textMuted,
        accent: c.accent,
        onAccent: c.onPrimary,
      );

  static final light = _from(FallowColors.light);
  static final dark = _from(FallowColors.dark);

  static AppColors of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;
}

TextStyle _style(TypeScaleStep s, Color color) {
  return GoogleFonts.manrope(
    color: color,
    fontSize: s.size,
    height: s.lineHeight,
    fontWeight: s.weight,
    letterSpacing: s.letterSpacing == 0 ? null : s.letterSpacing,
  );
}

TextTheme _buildTextTheme(Color text, Color secondary, Color subtle) => TextTheme(
      displaySmall: _style(TypeScale.xl2, text), // screen headline (28)
      headlineSmall: _style(TypeScale.xl, text), // section / card titles (20)
      titleLarge: _style(TypeScale.wordmark, text), // app-bar wordmark
      bodyLarge: _style(TypeScale.md, text), // quotes (16)
      bodyMedium: _style(TypeScale.md, secondary), // body copy
      bodySmall: _style(TypeScale.sm, secondary), // blurbs
      labelMedium: _style(TypeScale.xs, subtle), // citations
      labelSmall: _style(TypeScale.overline, text), // eyebrow (color set at use)
    );

ThemeData _theme(Brightness brightness, FallowColors c) {
  final base = ThemeData(brightness: brightness, useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: c.surface,
    // Border-only elevation: no Material default shadow ever paints.
    shadowColor: Colors.transparent,
    colorScheme: base.colorScheme.copyWith(
      surface: c.surfaceRaised,
      primary: c.primary,
      secondary: c.accent,
      onPrimary: c.onPrimary,
      outline: c.border,
    ),
    textTheme: _buildTextTheme(c.textPrimary, c.textSecondary, c.textMuted),
    appBarTheme: AppBarTheme(
      backgroundColor: c.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      foregroundColor: c.textPrimary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      elevation: 0,
      backgroundColor: c.surface,
      surfaceTintColor: Colors.transparent,
    ),
  );
}

ThemeData buildLightTheme() => _theme(Brightness.light, FallowColors.light);
ThemeData buildDarkTheme() => _theme(Brightness.dark, FallowColors.dark);
