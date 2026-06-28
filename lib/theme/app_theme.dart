import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  final Color bg;
  final Color surface;
  final Color surfaceAlt;
  final Color border;
  final Color text;
  final Color muted;
  final Color accent;

  const AppColors._({
    required this.bg,
    required this.surface,
    required this.surfaceAlt,
    required this.border,
    required this.text,
    required this.muted,
    required this.accent,
  });

  static const light = AppColors._(
    bg: Color(0xFFF0F2ED),
    surface: Color(0xFFFFFFFF),
    surfaceAlt: Color(0xFFE6E9E2),
    border: Color(0xFFCDD1C8),
    text: Color(0xFF0D1010),
    muted: Color(0xFF6B7268),
    accent: Color(0xFF4A7950),
  );

  static const dark = AppColors._(
    bg: Color(0xFF0D1010),
    surface: Color(0xFF141A1A),
    surfaceAlt: Color(0xFF1A2222),
    border: Color(0xFF283030),
    text: Color(0xFFF0F2ED),
    muted: Color(0xFF8A9A8A),
    accent: Color(0xFF78B07E),
  );

  static AppColors of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? dark : light;
}

TextTheme _buildTextTheme(TextTheme base, Color text, Color muted) =>
    GoogleFonts.loraTextTheme(base).copyWith(
      displaySmall: GoogleFonts.playfairDisplay(
        color: text,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        color: text,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.playfairDisplay(
        color: text,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.lora(color: text, height: 1.65),
      bodyMedium: GoogleFonts.lora(color: muted, height: 1.55),
    );

ThemeData buildLightTheme() {
  final base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.light.bg,
    colorScheme: base.colorScheme.copyWith(
      surface: AppColors.light.surface,
      primary: AppColors.light.accent,
      secondary: AppColors.light.accent,
      onPrimary: Colors.white,
    ),
    textTheme: _buildTextTheme(base.textTheme, AppColors.light.text, AppColors.light.muted),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light.bg,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.light.text,
    ),
  );
}

ThemeData buildDarkTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: AppColors.dark.bg,
    colorScheme: base.colorScheme.copyWith(
      surface: AppColors.dark.surface,
      primary: AppColors.dark.accent,
      secondary: AppColors.dark.accent,
    ),
    textTheme: _buildTextTheme(base.textTheme, AppColors.dark.text, AppColors.dark.muted),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark.bg,
      elevation: 0,
      centerTitle: false,
      foregroundColor: AppColors.dark.text,
    ),
  );
}
