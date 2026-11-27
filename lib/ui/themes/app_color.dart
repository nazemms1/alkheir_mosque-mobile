import 'package:flutter/material.dart';

import 'app_style.dart';

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

  /// خلفية الحقول والقوائم داخل البطاقات.
  final Color field;
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

  // Brand palette (same in light and dark; was AppPalette). Prefer the
  // semantic tokens above for new UI.
  final Color brandPrimary;
  final Color primaryLight;
  final Color primaryMid;
  final Color primaryGlow;
  final Color gold;
  final Color goldLight;
  final Color goldGlow;
  final Color bgDeep;
  final Color bgDark;
  final Color bgWhiteCard;
  final Color glassWhite;
  final Color glassBorder;
  final Color glassGreen;
  final Color textOnDark;
  final Color textOnDarkSub;
  final Color textOnDarkMute;
  final Color attPresent;
  final Color attAbsent;
  final Color attLate;
  final Color attExcused;
  final Color attExcusedEarlyDep;
  final Color attExcusedAbsence;
  final Color brandDeep;
  final Color brandGreen;
  final Color brandMid;
  final Color accentOrange;
  final Color successGreen;
  final Color whatsapp;
  final Color dangerRed;
  final Color surfaceDeepGreen;
  final Color surfaceBlackGreen;
  final LinearGradient gradientPrimary;
  final LinearGradient gradientHero;
  final LinearGradient gradientGold;
  final LinearGradient gradientEmerald;
  final LinearGradient gradientTeal;
  final LinearGradient gradientSapphire;

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
    required this.field,
    required this.error,
    required this.success,
    required this.warning,
    required this.info,
    required this.errorText,
    required this.successText,
    required this.warningText,
    required this.infoText,
    required this.goldText,
    required this.brandPrimary,
    required this.primaryLight,
    required this.primaryMid,
    required this.primaryGlow,
    required this.gold,
    required this.goldLight,
    required this.goldGlow,
    required this.bgDeep,
    required this.bgDark,
    required this.bgWhiteCard,
    required this.glassWhite,
    required this.glassBorder,
    required this.glassGreen,
    required this.textOnDark,
    required this.textOnDarkSub,
    required this.textOnDarkMute,
    required this.attPresent,
    required this.attAbsent,
    required this.attLate,
    required this.attExcused,
    required this.attExcusedEarlyDep,
    required this.attExcusedAbsence,
    required this.brandDeep,
    required this.brandGreen,
    required this.brandMid,
    required this.accentOrange,
    required this.successGreen,
    required this.whatsapp,
    required this.dangerRed,
    required this.surfaceDeepGreen,
    required this.surfaceBlackGreen,
    required this.gradientPrimary,
    required this.gradientHero,
    required this.gradientGold,
    required this.gradientEmerald,
    required this.gradientTeal,
    required this.gradientSapphire,
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
        field: Color(0xFFF1F5EF),
        error: Color(0xFFEF4444),
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF3B82F6),
        errorText: Color(0xFFDC2626),
        successText: Color(0xFF15803D),
        warningText: Color(0xFFB45309),
        infoText: Color(0xFF1D4ED8),
        goldText: Color(0xFF8A6A2E),
        brandPrimary: AppPalette.primary,
        primaryLight: AppPalette.primaryLight,
        primaryMid: AppPalette.primaryMid,
        primaryGlow: AppPalette.primaryGlow,
        gold: AppPalette.gold,
        goldLight: AppPalette.goldLight,
        goldGlow: AppPalette.goldGlow,
        bgDeep: AppPalette.bgDeep,
        bgDark: AppPalette.bgDark,
        bgWhiteCard: AppPalette.bgWhiteCard,
        glassWhite: AppPalette.glassWhite,
        glassBorder: AppPalette.glassBorder,
        glassGreen: AppPalette.glassGreen,
        textOnDark: AppPalette.textOnDark,
        textOnDarkSub: AppPalette.textOnDarkSub,
        textOnDarkMute: AppPalette.textOnDarkMute,
        attPresent: AppPalette.attPresent,
        attAbsent: AppPalette.attAbsent,
        attLate: AppPalette.attLate,
        attExcused: AppPalette.attExcused,
        attExcusedEarlyDep: AppPalette.attExcusedEarlyDep,
        attExcusedAbsence: AppPalette.attExcusedAbsence,
        brandDeep: AppPalette.brandDeep,
        brandGreen: AppPalette.brandGreen,
        brandMid: AppPalette.brandMid,
        accentOrange: AppPalette.accentOrange,
        successGreen: AppPalette.successGreen,
        whatsapp: AppPalette.whatsapp,
        dangerRed: AppPalette.dangerRed,
        surfaceDeepGreen: AppPalette.surfaceDeepGreen,
        surfaceBlackGreen: AppPalette.surfaceBlackGreen,
        gradientPrimary: AppPalette.gradientPrimary,
        gradientHero: AppPalette.gradientHero,
        gradientGold: AppPalette.gradientGold,
        gradientEmerald: AppPalette.gradientEmerald,
        gradientTeal: AppPalette.gradientTeal,
        gradientSapphire: AppPalette.gradientSapphire,
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
        field: Color(0xB30F0C09),
        error: Color(0xFFEF4444),
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF3B82F6),
        errorText: Color(0xFFF87171),
        successText: Color(0xFF22C55E),
        warningText: Color(0xFFF59E0B),
        infoText: Color(0xFF60A5FA),
        goldText: Color(0xFFC2A05F),
        brandPrimary: AppPalette.primary,
        primaryLight: AppPalette.primaryLight,
        primaryMid: AppPalette.primaryMid,
        primaryGlow: AppPalette.primaryGlow,
        gold: AppPalette.gold,
        goldLight: AppPalette.goldLight,
        goldGlow: AppPalette.goldGlow,
        bgDeep: AppPalette.bgDeep,
        bgDark: AppPalette.bgDark,
        bgWhiteCard: AppPalette.bgWhiteCard,
        glassWhite: AppPalette.glassWhite,
        glassBorder: AppPalette.glassBorder,
        glassGreen: AppPalette.glassGreen,
        textOnDark: AppPalette.textOnDark,
        textOnDarkSub: AppPalette.textOnDarkSub,
        textOnDarkMute: AppPalette.textOnDarkMute,
        attPresent: AppPalette.attPresent,
        attAbsent: AppPalette.attAbsent,
        attLate: AppPalette.attLate,
        attExcused: AppPalette.attExcused,
        attExcusedEarlyDep: AppPalette.attExcusedEarlyDep,
        attExcusedAbsence: AppPalette.attExcusedAbsence,
        brandDeep: AppPalette.brandDeep,
        brandGreen: AppPalette.brandGreen,
        brandMid: AppPalette.brandMid,
        accentOrange: AppPalette.accentOrange,
        successGreen: AppPalette.successGreen,
        whatsapp: AppPalette.whatsapp,
        dangerRed: AppPalette.dangerRed,
        surfaceDeepGreen: AppPalette.surfaceDeepGreen,
        surfaceBlackGreen: AppPalette.surfaceBlackGreen,
        gradientPrimary: AppPalette.gradientPrimary,
        gradientHero: AppPalette.gradientHero,
        gradientGold: AppPalette.gradientGold,
        gradientEmerald: AppPalette.gradientEmerald,
        gradientTeal: AppPalette.gradientTeal,
        gradientSapphire: AppPalette.gradientSapphire,
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
      field: l(field, other.field),
      error: l(error, other.error),
      success: l(success, other.success),
      warning: l(warning, other.warning),
      info: l(info, other.info),
      errorText: l(errorText, other.errorText),
      successText: l(successText, other.successText),
      warningText: l(warningText, other.warningText),
      infoText: l(infoText, other.infoText),
      goldText: l(goldText, other.goldText),
      brandPrimary: l(brandPrimary, other.brandPrimary),
      primaryLight: l(primaryLight, other.primaryLight),
      primaryMid: l(primaryMid, other.primaryMid),
      primaryGlow: l(primaryGlow, other.primaryGlow),
      gold: l(gold, other.gold),
      goldLight: l(goldLight, other.goldLight),
      goldGlow: l(goldGlow, other.goldGlow),
      bgDeep: l(bgDeep, other.bgDeep),
      bgDark: l(bgDark, other.bgDark),
      bgWhiteCard: l(bgWhiteCard, other.bgWhiteCard),
      glassWhite: l(glassWhite, other.glassWhite),
      glassBorder: l(glassBorder, other.glassBorder),
      glassGreen: l(glassGreen, other.glassGreen),
      textOnDark: l(textOnDark, other.textOnDark),
      textOnDarkSub: l(textOnDarkSub, other.textOnDarkSub),
      textOnDarkMute: l(textOnDarkMute, other.textOnDarkMute),
      attPresent: l(attPresent, other.attPresent),
      attAbsent: l(attAbsent, other.attAbsent),
      attLate: l(attLate, other.attLate),
      attExcused: l(attExcused, other.attExcused),
      attExcusedEarlyDep: l(attExcusedEarlyDep, other.attExcusedEarlyDep),
      attExcusedAbsence: l(attExcusedAbsence, other.attExcusedAbsence),
      brandDeep: l(brandDeep, other.brandDeep),
      brandGreen: l(brandGreen, other.brandGreen),
      brandMid: l(brandMid, other.brandMid),
      accentOrange: l(accentOrange, other.accentOrange),
      successGreen: l(successGreen, other.successGreen),
      whatsapp: l(whatsapp, other.whatsapp),
      dangerRed: l(dangerRed, other.dangerRed),
      surfaceDeepGreen: l(surfaceDeepGreen, other.surfaceDeepGreen),
      surfaceBlackGreen: l(surfaceBlackGreen, other.surfaceBlackGreen),
      gradientPrimary:
          LinearGradient.lerp(gradientPrimary, other.gradientPrimary, t)!,
      gradientHero: LinearGradient.lerp(gradientHero, other.gradientHero, t)!,
      gradientGold: LinearGradient.lerp(gradientGold, other.gradientGold, t)!,
      gradientEmerald:
          LinearGradient.lerp(gradientEmerald, other.gradientEmerald, t)!,
      gradientTeal: LinearGradient.lerp(gradientTeal, other.gradientTeal, t)!,
      gradientSapphire:
          LinearGradient.lerp(gradientSapphire, other.gradientSapphire, t)!,
    );
  }
}
