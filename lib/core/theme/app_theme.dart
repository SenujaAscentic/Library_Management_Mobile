import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF2F6A43),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFB2F1C0),
    onPrimaryContainer: Color(0xFF13512D),
    secondary: Color(0xFF4F6353),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD2E8D4),
    onSecondaryContainer: Color(0xFF384B3C),
    tertiary: Color(0xFF3A646F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFBEEAF6),
    onTertiaryContainer: Color(0xFF214D57),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF93000A),
    surface: Color(0xFFF6FBF3),
    onSurface: Color(0xFF181D18),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF0F5ED),
    surfaceContainer: Color(0xFFEBEFE8),
    surfaceContainerHigh: Color(0xFFE5EAE2),
    surfaceContainerHighest: Color(0xFFDFE4DC),
    surfaceDim: Color(0xFFD7DBD4),
    surfaceBright: Color(0xFFF6FBF3),
    onSurfaceVariant: Color(0xFF414941),
    outline: Color(0xFF717971),
    outlineVariant: Color(0xFFC1C9BF),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF2D322D),
    onInverseSurface: Color(0xFFEDF2EA),
    inversePrimary: Color(0xFF96D5A6),
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF96D5A6),
    onPrimary: Color(0xFF00391B),
    primaryContainer: Color(0xFF13512D),
    onPrimaryContainer: Color(0xFFB2F1C0),
    secondary: Color(0xFFB6CCB8),
    onSecondary: Color(0xFF223527),
    secondaryContainer: Color(0xFF384B3C),
    onSecondaryContainer: Color(0xFFD2E8D4),
    tertiary: Color(0xFFA2CED9),
    onTertiary: Color(0xFF02363F),
    tertiaryContainer: Color(0xFF214D57),
    onTertiaryContainer: Color(0xFFBEEAF6),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF101510),
    onSurface: Color(0xFFDFE4DC),
    surfaceContainerLowest: Color(0xFF0A0F0B),
    surfaceContainerLow: Color(0xFF181D18),
    surfaceContainer: Color(0xFF1C211C),
    surfaceContainerHigh: Color(0xFF262B26),
    surfaceContainerHighest: Color(0xFF313631),
    surfaceDim: Color(0xFF101510),
    surfaceBright: Color(0xFF353A35),
    onSurfaceVariant: Color(0xFFC1C9BF),
    outline: Color(0xFF8B938A),
    outlineVariant: Color(0xFF414941),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFFDFE4DC),
    onInverseSurface: Color(0xFF2D322D),
    inversePrimary: Color(0xFF2F6A43),
  );

  static TextTheme _textTheme(ColorScheme scheme) {
    final base = GoogleFonts.manropeTextTheme();
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(fontWeight: FontWeight.w800),
      displayMedium: base.displayMedium?.copyWith(fontWeight: FontWeight.w800),
      displaySmall: base.displaySmall?.copyWith(fontWeight: FontWeight.w800),
      headlineLarge: base.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
      headlineMedium: base.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
      headlineSmall: base.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      titleSmall: base.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      bodyLarge: base.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
      bodyMedium: base.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
      bodySmall: base.bodySmall?.copyWith(fontWeight: FontWeight.w500),
      labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w500),
      labelMedium: base.labelMedium?.copyWith(fontWeight: FontWeight.w500),
      labelSmall: base.labelSmall?.copyWith(fontWeight: FontWeight.w500),
    ).apply(bodyColor: scheme.onSurface, displayColor: scheme.onSurface);
  }

  static ThemeData get light => _build(_lightScheme);
  static ThemeData get dark => _build(_darkScheme);

  static ThemeData _build(ColorScheme scheme) {
    final textTheme = _textTheme(scheme);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge,
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}