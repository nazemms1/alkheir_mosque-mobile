import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final MaterialColor primary;
  final MaterialColor secondary;
  final Color background;
  final Color surface;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color divider;
  final Color error;
  final Color success;
  final Color warning;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.divider,
    required this.error,
    required this.success,
    required this.warning,
  });

  static const MaterialColor primaryLight = MaterialColor(0xFF135D54, <int, Color>{
    50: Color(0xFFE2F3F0),
    100: Color(0xFFB8E0DA),
    200: Color(0xFF8ACBCC),
    300: Color(0xFF5CB5BD),
    400: Color(0xFF3AA4B3),
    500: Color(0xFF135D54),
    600: Color(0xFF10534B),
    700: Color(0xFF0D4740),
    800: Color(0xFF093C35),
    900: Color(0xFF042923),
  });

  static const MaterialColor secondaryLight = MaterialColor(0xFFC08A3E, <int, Color>{
    50: Color(0xFFF9F5EB),
    100: Color(0xFFEFE4CC),
    200: Color(0xFFE4D2AA),
    300: Color(0xFFD9BF87),
    400: Color(0xFFD1B16F),
    500: Color(0xFFC08A3E),
    600: Color(0xFFB47C37),
    700: Color(0xFFA56B2F),
    800: Color(0xFF965B27),
    900: Color(0xFF7E3D1A),
  });

  static const MaterialColor primaryDark = MaterialColor(0xFF4DB6AC, <int, Color>{
    50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(0xFF009688),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  });

  static const MaterialColor secondaryDark = MaterialColor(0xFFFFB74D, <int, Color>{
    50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(0xFFFF9800),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  });

  /// لون الحقول والقوائم الجديد (#0F0C09B3)
  static const Color fieldDark = Color(0xB30F0C09);

  factory AppColors.light() {
    return const AppColors(
      primary: primaryLight,
      secondary: secondaryLight,
      background: Color(0xFFF6F8F5),
      surface: Color(0xFFFFFFFF),
      card: Color(0xFFFFFFFF),
      textPrimary: Color(0xFF112B1C),
      textSecondary: Color(0xFF48614F),
      border: Color(0xFFDCE4D8),
      divider: Color(0xFFE8EFE5),
      error: Color(0xFFDC2626),
      success: Color(0xFF16A34A),
      warning: Color(0xFFD97706),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: primaryDark,
      secondary: secondaryDark,
      background: Color(0xFF04160B),
      surface: Color(0xFF072714),
      card: Color(0xFF072714),
      textPrimary: Color(0xFFF3FFF6),
      textSecondary: Color(0xFFACCDB5),
      border: Color(0xFF193222),
      divider: Color(0xFF193222),
      error: Color(0xFFEF4444),
      success: Color(0xFF22C55E),
      warning: Color(0xFFF59E0B),
    );
  }

  @override
  ThemeExtension<AppColors> copyWith({
    MaterialColor? primary,
    MaterialColor? secondary,
    Color? background,
    Color? surface,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? divider,
    Color? error,
    Color? success,
    Color? warning,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primary: t < 0.5 ? primary : other.primary,
      secondary: t < 0.5 ? secondary : other.secondary,
      background: Color.lerp(background, other.background, t) ?? background,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      card: Color.lerp(card, other.card, t) ?? card,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      border: Color.lerp(border, other.border, t) ?? border,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      error: Color.lerp(error, other.error, t) ?? error,
      success: Color.lerp(success, other.success, t) ?? success,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
    );
  }
}
