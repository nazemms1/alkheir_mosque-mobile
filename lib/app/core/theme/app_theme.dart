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

/// ألوان مسجد الخير — مأخوذة من توكنات الموقع (resources/css/app.css) وهوية الشعار.
abstract final class AppColors {
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

abstract final class AppTheme {
  static const _lightBorder = Color(0xFFD5DECF);
  static const _darkBorder = Color(0xFF193222);
  static const _darkCard = Color(0xFF072714);

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.gold,
        surface: AppColors.bgWhiteCard,
      ),
      scaffoldBackgroundColor: AppColors.bgSurface,
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: appTextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: _textTheme(
        base.textTheme,
        primary: AppColors.textPrimary,
        muted: AppColors.textSecondary,
        labelOn: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: appTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgWhiteCard,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: _outline(_lightBorder),
        enabledBorder: _outline(_lightBorder),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryMid, width: 2),
        ),
        errorBorder: _outline(AppColors.error),
        labelStyle: appTextStyle(color: AppColors.textSecondary, fontSize: 14),
        hintStyle: appTextStyle(color: AppColors.textMuted, fontSize: 14),
        prefixIconColor: AppColors.textSecondary,
      ),
      cardTheme: CardThemeData(
        color: AppColors.bgWhiteCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: _lightBorder, width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.glassGreen,
        labelStyle: appTextStyle(fontSize: 12, color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide.none,
      ),
      dividerTheme: const DividerThemeData(
        color: _lightBorder,
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textMuted,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: appTextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle:
            appTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        dividerColor: _lightBorder,
      ),
    );
  }

  static ThemeData get dark {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryGlow,
        secondary: AppColors.goldLight,
        surface: _darkCard,
      ),
      scaffoldBackgroundColor: AppColors.bgDeep,
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgDark,
        foregroundColor: AppColors.textOnDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: appTextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textOnDark,
        ),
      ),
      textTheme: _textTheme(
        base.textTheme,
        primary: AppColors.textOnDark,
        muted: AppColors.textOnDarkSub,
        labelOn: AppColors.textOnDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryMid,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: appTextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkCard,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: _outline(_darkBorder),
        enabledBorder: _outline(_darkBorder),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryGlow, width: 2),
        ),
        errorBorder: _outline(AppColors.error),
        labelStyle: appTextStyle(color: AppColors.textOnDarkSub, fontSize: 14),
        hintStyle: appTextStyle(color: AppColors.textOnDarkMute, fontSize: 14),
        prefixIconColor: AppColors.textOnDarkSub,
      ),
      cardTheme: CardThemeData(
        color: _darkCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: _darkBorder, width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.glassGreen,
        labelStyle: appTextStyle(fontSize: 12, color: AppColors.primaryGlow),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide.none,
      ),
      dividerTheme: const DividerThemeData(
        color: _darkBorder,
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.primaryGlow,
        unselectedLabelColor: AppColors.textOnDarkMute,
        indicatorColor: AppColors.primaryGlow,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: appTextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle:
            appTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        dividerColor: _darkBorder,
      ),
    );
  }

  static OutlineInputBorder _outline(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color),
      );

  static TextTheme _textTheme(
    TextTheme base, {
    required Color primary,
    required Color muted,
    required Color labelOn,
  }) {
    return base.apply(fontFamily: kAppFontFamily).copyWith(
          displayLarge: appTextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: primary,
              letterSpacing: -0.5),
          displayMedium: appTextStyle(
              fontSize: 28, fontWeight: FontWeight.w700, color: primary),
          headlineLarge: appTextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: primary),
          headlineMedium: appTextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: primary),
          headlineSmall: appTextStyle(
              fontSize: 17, fontWeight: FontWeight.w700, color: primary),
          titleLarge: appTextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: primary),
          titleMedium: appTextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: primary),
          titleSmall: appTextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: muted),
          bodyLarge: appTextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: primary),
          bodyMedium: appTextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: primary),
          bodySmall: appTextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: muted),
          labelLarge: appTextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: labelOn),
        );
  }
}

// ─── ويدجتات مشتركة ───────────────────────────────────────────────────────────

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Border? border;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.color,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? AppColors.glassWhite,
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        border: border ?? Border.all(color: AppColors.glassBorder, width: 1),
      ),
      child: child,
    );
  }
}

class PremiumCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final List<BoxShadow>? shadows;

  const PremiumCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AppColors.bgCard : AppColors.bgWhiteCard,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          border: Border.all(
              color: isDark ? AppTheme._darkBorder : AppTheme._lightBorder),
          boxShadow: isDark
              ? const []
              : (shadows ??
                  [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ]),
        ),
        child: child,
      ),
    );
  }
}
