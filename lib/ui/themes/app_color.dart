import 'package:flutter/material.dart';

/// ألوان دلالية تتبدّل مع المظهر. استخدمها عبر `context.appColors`.
/// ألوان *Text مخصّصة للنص والأيقونات (تحقق 4.5:1 على السطح)،
/// والألوان الزاهية (success/warning/error/info) للتعبئة والنقاط فقط.
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color border;
  final Color divider;
  final Color error;
  final Color success;
  final Color warning;
  final Color info;
  final Color errorText;
  final Color successText;
  final Color warningText;
  final Color infoText;

  /// الذهبي مخصّص للإنجاز (النقاط، الحفظ، التقييم) — لون نص مقروء.
  final Color goldText;

  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.border,
    required this.divider,
    required this.error,
    required this.success,
    required this.warning,
    required this.info,
    required this.errorText,
    required this.successText,
    required this.warningText,
    required this.infoText,
    required this.goldText,
  });

  // Contrast on surface (#FFFFFF): textMuted 5.4, *Text ≥4.8, goldText 5.0.
  factory AppColors.light() => const AppColors(
        primary: Color(0xFF006B2D),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFA9823F),
        background: Color(0xFFF6F8F5),
        surface: Color(0xFFFFFFFF),
        card: Color(0xFFFFFFFF),
        textPrimary: Color(0xFF112B1C),
        textSecondary: Color(0xFF48614F),
        textMuted: Color(0xFF56705E),
        border: Color(0xFFDCE4D8),
        divider: Color(0xFFE8EFE5),
        error: Color(0xFFEF4444),
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF3B82F6),
        errorText: Color(0xFFDC2626),
        successText: Color(0xFF15803D),
        warningText: Color(0xFFB45309),
        infoText: Color(0xFF1D4ED8),
        goldText: Color(0xFF8A6A2E),
      );

  // Contrast on card (#072714): textMuted 5.3, *Text ≥5.8, goldText 6.5, onPrimary 7.6.
  factory AppColors.dark() => const AppColors(
        primary: Color(0xFF4CC97E),
        onPrimary: Color(0xFF04160B),
        secondary: Color(0xFFC2A05F),
        background: Color(0xFF04160B),
        surface: Color(0xFF072714),
        card: Color(0xFF072714),
        textPrimary: Color(0xFFF3FFF6),
        textSecondary: Color(0xFFACCDB5),
        textMuted: Color(0xFF7F9A87),
        border: Color(0xFF193222),
        divider: Color(0xFF193222),
        error: Color(0xFFEF4444),
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF3B82F6),
        errorText: Color(0xFFF87171),
        successText: Color(0xFF22C55E),
        warningText: Color(0xFFF59E0B),
        infoText: Color(0xFF60A5FA),
        goldText: Color(0xFFC2A05F),
      );

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      primary: l(primary, other.primary),
      onPrimary: l(onPrimary, other.onPrimary),
      secondary: l(secondary, other.secondary),
      background: l(background, other.background),
      surface: l(surface, other.surface),
      card: l(card, other.card),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textMuted: l(textMuted, other.textMuted),
      border: l(border, other.border),
      divider: l(divider, other.divider),
      error: l(error, other.error),
      success: l(success, other.success),
      warning: l(warning, other.warning),
      info: l(info, other.info),
      errorText: l(errorText, other.errorText),
      successText: l(successText, other.successText),
      warningText: l(warningText, other.warningText),
      infoText: l(infoText, other.infoText),
      goldText: l(goldText, other.goldText),
    );
  }
}
