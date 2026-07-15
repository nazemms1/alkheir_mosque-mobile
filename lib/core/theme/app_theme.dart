import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  // Primary greens — deep, rich mosque palette
  static const primary        = Color(0xFF0D5016);
  static const primaryMid     = Color(0xFF1A7A26);
  static const primaryLight   = Color(0xFF2EA043);
  static const primaryGlow    = Color(0xFF3DD68C);

  // Accent & gold
  static const gold           = Color(0xFFD4A843);
  static const goldLight      = Color(0xFFFFD97D);
  static const goldGlow       = Color(0xFFFFEDB0);

  // Background layers
  static const bgDeep         = Color(0xFF060E08);
  static const bgDark         = Color(0xFF0A1A0D);
  static const bgCard         = Color(0xFF111F14);
  static const bgCardLight    = Color(0xFF162A1A);
  static const bgSurface      = Color(0xFFF4F8F4);
  static const bgWhiteCard    = Color(0xFFFFFFFF);

  // Glass / overlay
  static const glassWhite     = Color(0x1AFFFFFF);
  static const glassBorder    = Color(0x33FFFFFF);
  static const glassGreen     = Color(0x1A2EA043);

  // Text
  static const textOnDark     = Color(0xFFFFFFFF);
  static const textOnDarkSub  = Color(0xB3FFFFFF);
  static const textOnDarkMute = Color(0x66FFFFFF);
  static const textPrimary    = Color(0xFF0D1F10);
  static const textSecondary  = Color(0xFF5A7060);
  static const textMuted      = Color(0xFF9DB5A0);

  // Semantic
  static const success        = Color(0xFF22C55E);
  static const successBg      = Color(0x1A22C55E);
  static const warning        = Color(0xFFF59E0B);
  static const warningBg      = Color(0x1AF59E0B);
  static const error          = Color(0xFFEF4444);
  static const errorBg        = Color(0x1AEF4444);
  static const info           = Color(0xFF3B82F6);
  static const infoBg         = Color(0x1A3B82F6);

  // Attendance
  static const attPresent              = Color(0xFF22C55E);
  static const attAbsent               = Color(0xFFEF4444);
  static const attLate                 = Color(0xFFF59E0B);
  static const attExcused              = Color(0xFF3B82F6);
  static const attExcusedEarlyDep     = Color(0xFF8B5CF6); // violet
  static const attExcusedAbsence      = Color(0xFF06B6D4); // cyan

  // Gradients
  static const gradientPrimary = LinearGradient(
    colors: [Color(0xFF0D5016), Color(0xFF1A7A26), Color(0xFF2EA043)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientHero = LinearGradient(
    colors: [Color(0xFF060E08), Color(0xFF0D5016), Color(0xFF1A3D1E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientGold = LinearGradient(
    colors: [Color(0xFFD4A843), Color(0xFFFFD97D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientCard = LinearGradient(
    colors: [Color(0xFF111F14), Color(0xFF1A2E1D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientSurface = LinearGradient(
    colors: [Color(0xFFF4F8F4), Color(0xFFEAF2EC)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientEmerald = LinearGradient(
    colors: [Color(0xFF071A0A), Color(0xFF0D5016), Color(0xFF1A7A26)],
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

  // Standard shadows
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: const Color(0xFF0D5016).withOpacity(0.08),
          blurRadius: 24,
          spreadRadius: -2,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get heroShadow => [
        BoxShadow(
          color: const Color(0xFF0D5016).withOpacity(0.4),
          blurRadius: 32,
          spreadRadius: -4,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> coloredShadow(Color color, {double opacity = 0.3}) => [
        BoxShadow(
          color: color.withOpacity(opacity),
          blurRadius: 20,
          spreadRadius: -2,
          offset: const Offset(0, 8),
        ),
      ];
}

abstract final class AppTheme {
  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        surface: AppColors.bgSurface,
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
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme).copyWith(
        displayLarge:  GoogleFonts.cairo(fontSize: 34, fontWeight: FontWeight.w900, color: AppColors.textPrimary, letterSpacing: -0.5),
        displayMedium: GoogleFonts.cairo(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textPrimary),
        headlineLarge: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
        headlineMedium:GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
        headlineSmall: GoogleFonts.cairo(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        titleLarge:    GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        titleMedium:   GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
        titleSmall:    GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
        bodyLarge:     GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
        bodyMedium:    GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textPrimary),
        bodySmall:     GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondary),
        labelLarge:    GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDDE8DF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDDE8DF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: GoogleFonts.cairo(color: AppColors.textSecondary, fontSize: 14),
        hintStyle: GoogleFonts.cairo(color: AppColors.textMuted, fontSize: 14),
        prefixIconColor: AppColors.textSecondary,
      ),
      cardTheme: CardTheme(
        color: AppColors.bgWhiteCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE2EDE4), width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.glassGreen,
        labelStyle: GoogleFonts.cairo(fontSize: 12, color: AppColors.primary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide.none,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFE2EDE4),
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textMuted,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.cairo(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.cairo(fontWeight: FontWeight.w400, fontSize: 14),
        dividerColor: const Color(0xFFE2EDE4),
      ),
    );
  }

  static ThemeData get dark {
    const darkSurface   = Color(0xFF0A1A0D);
    const darkCard   = Color(0xFF111F14);
    const darkBorder = Color(0xFF1E3320);

    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        primary: AppColors.primaryGlow,
        surface: darkSurface,
      ),
      scaffoldBackgroundColor: darkSurface,
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgDeep,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme).copyWith(
        displayLarge:  GoogleFonts.cairo(fontSize: 34, fontWeight: FontWeight.w900, color: AppColors.textOnDark, letterSpacing: -0.5),
        displayMedium: GoogleFonts.cairo(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textOnDark),
        headlineLarge: GoogleFonts.cairo(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textOnDark),
        headlineMedium:GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textOnDark),
        headlineSmall: GoogleFonts.cairo(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
        titleLarge:    GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textOnDark),
        titleMedium:   GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textOnDark),
        titleSmall:    GoogleFonts.cairo(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textOnDarkSub),
        bodyLarge:     GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.textOnDark),
        bodyMedium:    GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textOnDark),
        bodySmall:     GoogleFonts.cairo(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textOnDarkSub),
        labelLarge:    GoogleFonts.cairo(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          textStyle: GoogleFonts.cairo(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkCard,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primaryGlow, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelStyle: GoogleFonts.cairo(color: AppColors.textOnDarkSub, fontSize: 14),
        hintStyle: GoogleFonts.cairo(color: AppColors.textOnDarkMute, fontSize: 14),
        prefixIconColor: AppColors.textOnDarkSub,
      ),
      cardTheme: CardTheme(
        color: darkCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: darkBorder, width: 1),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.glassGreen,
        labelStyle: GoogleFonts.cairo(fontSize: 12, color: AppColors.primaryGlow),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide.none,
      ),
      dividerTheme: const DividerThemeData(
        color: darkBorder,
        thickness: 1,
        space: 1,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primaryGlow,
        unselectedLabelColor: AppColors.textOnDarkMute,
        indicatorColor: AppColors.primaryGlow,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: GoogleFonts.cairo(fontWeight: FontWeight.w700, fontSize: 14),
        unselectedLabelStyle: GoogleFonts.cairo(fontWeight: FontWeight.w400, fontSize: 14),
        dividerColor: darkBorder,
      ),
    );
  }
}

// ─── Reusable premium widgets ─────────────────────────────────────────────────

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.bgWhiteCard,
          borderRadius: borderRadius ?? BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE2EDE4)),
          boxShadow: shadows ?? [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
