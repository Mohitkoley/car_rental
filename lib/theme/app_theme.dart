import 'package:flutter/material.dart';
import 'color_palette.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorPalette.primary,
        brightness: Brightness.light,
        surface: ColorPalette.surface,
        error: ColorPalette.error,
      ),
      useMaterial3: true,
      fontFamily: AppTypography.fontFamily,
      scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
      cardTheme: CardThemeData(
        elevation: 4,
        color: ColorPalette.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: ColorPalette.surface,
      ),
      textTheme: const TextTheme(
        headlineMedium: AppTypography.headlineMedium,
        titleMedium: AppTypography.titleMedium,
        bodyLarge: AppTypography.bodyLarge,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
      ),
    );
  }
}
