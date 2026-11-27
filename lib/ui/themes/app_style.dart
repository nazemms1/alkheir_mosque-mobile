import 'package:flutter/material.dart';

/// اسم خط الهوية (Dubai) — مرفق داخل التطبيق في assets/fonts ويُفعَّل من pubspec.
const kAppFontFamily = 'Dubai';

/// نمط نص بخط الهوية. استخدمه بدل أي خط آخر.
TextStyle appTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontFamily: kAppFontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
  );
}

/// لوحة ألوان ثابتة (غير متبدّلة مع المظهر) — للألوان المتبدّلة استخدم `context.appColors`.
/// ألوان مسجد الخير — مأخوذة من توكنات الموقع (resources/css/app.css) وهوية الشعار.
abstract final class AppPalette {
  // الأخضر الأساسي للهوية (شعار الجامع)
  static const primary = Color(0xFF006B2D);
  static const primaryMid = Color(0xFF0B8F43);
  static const primaryLight = Color(0xFF0B8F43);
  static const primaryGlow = Color(0xFF4CC97E);

  // الذهبي المساعد
  static const gold = Color(0xFFA9823F);
  static const goldLight = Color(0xFFC2A05F);
  static const goldGlow = Color(0xFFE9D9B0);

  // طبقات الخلفية — الداكن من الموقع (#04160B / #072714 / #0A3119)
  static const bgDeep = Color(0xFF04160B);
  static const bgDark = Color(0xFF051C0E);
  static const bgCard = Color(0xFF072714);
  static const bgCardLight = Color(0xFF0A3119);
  // الفاتح من الموقع (#E8EBDF خلفية، #FBFAF4 لوحات)
  static const bgSurface = Color(0xFFE8EBDF);
  static const bgWhiteCard = Color(0xFFFBFAF4);

  // زجاج / طبقات شفافة
  static const glassWhite = Color(0x1AFFFFFF);
  static const glassBorder = Color(0x33FFFFFF);
  static const glassGreen = Color(0x1A0B8F43);

  /// لون خلفية الحقول والقوائم الجديد (#0F0C09B3)
  static const fieldDark = Color(0xB30F0C09);
  static const inputBgDark = Color(0xB30F0C09);

  // النصوص
  static const textOnDark = Color(0xFFF3FFF6);
  static const textOnDarkSub = Color(0xFFACCDB5);
  static const textOnDarkMute = Color(0x80ACCDB5);
  static const textPrimary = Color(0xFF112B1C);
  static const textSecondary = Color(0xFF48614F);
  static const textMuted = Color(0xFF7F9A87);

  // الحالات
  static const success = Color(0xFF22C55E);
  static const successBg = Color(0x1A22C55E);
  static const warning = Color(0xFFF59E0B);
  static const warningBg = Color(0x1AF59E0B);
  static const error = Color(0xFFEF4444);
  static const errorBg = Color(0x1AEF4444);
  static const info = Color(0xFF3B82F6);
  static const infoBg = Color(0x1A3B82F6);

  // الحضور
  static const attPresent = Color(0xFF22C55E);
  static const attAbsent = Color(0xFFEF4444);
  static const attLate = Color(0xFFF59E0B);
  static const attExcused = Color(0xFF3B82F6);
  static const attExcusedEarlyDep = Color(0xFF8B5CF6); // بنفسجي
  static const attExcusedAbsence = Color(0xFF06B6D4); // سماوي

  // ─── ألوان مشتركة كانت مكتوبة يدوياً في الشاشات (توحيد التصميم) ───────────
  // الأسماء تقريبية حسب الاستخدام الغالب؛ القيم مطابقة للقيم السابقة تماماً.
  static const brandDeep = Color(0xFF0D5016);
  static const brandGreen = Color(0xFF1A7A26);
  static const brandMid = Color(0xFF0D4515);
  static const accentOrange = Color(0xFFE67E22);
  static const successGreen = Color(0xFF2EA043);
  static const whatsapp = Color(0xFF25D366);
  static const neonGreen = Color(0xFF00E676);
  static const dangerRed = Color(0xFFE53935);
  static const mintLight = Color(0xFFB5D7C3);
  static const textSoftSage = Color(0xFF88AB98);
  static const surfaceDeepGreen = Color(0xFF071A0A);
  static const surfaceBlackGreen = Color(0xFF060E08);
  static const darkCardGreen = Color(0xFF1B4931);
  static const darkBorderGreen = Color(0xFF1E3A24);

  // التدرجات
  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFF006B2D), Color(0xFF0B8F43)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientHero = LinearGradient(
    colors: [Color(0xFF04160B), Color(0xFF006B2D), Color(0xFF0A3119)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientGold = LinearGradient(
    colors: [Color(0xFFA9823F), Color(0xFFC2A05F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientCard = LinearGradient(
    colors: [Color(0xFF072714), Color(0xFF0A3119)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientSurface = LinearGradient(
    colors: [Color(0xFFE8EBDF), Color(0xFFE8EEE2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientEmerald = LinearGradient(
    colors: [Color(0xFF04160B), Color(0xFF006B2D), Color(0xFF0B8F43)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const gradientTeal = LinearGradient(
    colors: [Color(0xFF0D3B3B), Color(0xFF0E6C5E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientSapphire = LinearGradient(
    colors: [Color(0xFF0D3B6E), Color(0xFF1565C0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // الظلال
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: primary.withValues(alpha: 0.08),
          blurRadius: 24,
          spreadRadius: -2,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get heroShadow => [
        BoxShadow(
          color: primary.withValues(alpha: 0.4),
          blurRadius: 32,
          spreadRadius: -4,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> coloredShadow(Color color, {double opacity = 0.3}) => [
        BoxShadow(
          color: color.withValues(alpha: opacity),
          blurRadius: 20,
          spreadRadius: -2,
          offset: const Offset(0, 8),
        ),
      ];
}

/// أيقونات اتجاهية تتوافق تلقائياً مع اللغتين العربية والإنجليزية
abstract final class AppIcons {
  static IconData chevronForward(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl
          ? Icons.chevron_left_rounded
          : Icons.chevron_right_rounded;

  static IconData chevronBack(BuildContext context) =>
      Directionality.of(context) == TextDirection.rtl
          ? Icons.chevron_right_rounded
          : Icons.chevron_left_rounded;
}
