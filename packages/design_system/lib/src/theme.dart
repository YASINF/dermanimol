import 'package:flutter/material.dart';

import 'colors.dart';

/// Üç uygulamanın ortak teması.
abstract final class AppTheme {
  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.navy,
      onPrimary: Colors.white,
      secondary: AppColors.blue,
      onSecondary: Colors.white,
      tertiary: AppColors.red,
      onTertiary: Colors.white,
      error: AppColors.red,
      onError: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.navy,
      outline: AppColors.line,
    );
    return _base(scheme, AppColors.background);
  }

  static ThemeData dark() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkBackground,
      secondary: AppColors.darkPrimary,
      onSecondary: AppColors.darkBackground,
      tertiary: AppColors.darkRed,
      onTertiary: Colors.white,
      error: AppColors.darkRed,
      onError: Colors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkInk,
      outline: Color(0xFF243650),
    );
    return _base(scheme, AppColors.darkBackground);
  }

  static ThemeData _base(ColorScheme scheme, Color background) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
