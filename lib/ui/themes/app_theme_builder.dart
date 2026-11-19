import 'package:flutter/material.dart';

import 'app_color.dart';
import 'ui_constants.dart';

/// المصدر الوحيد لـ ThemeData (فاتح وداكن) — يُبنى من رموز [AppColors].
ThemeData buildAppTheme(AppColors c, Brightness brightness) {
  TextStyle s(double size, FontWeight w, Color color, [double? height]) =>
      TextStyle(
        fontFamily: UIConstants.fontFamily,
        fontSize: size,
        fontWeight: w,
        color: color,
        height: height,
      );

  // سلّم الخطوط: لا نص أقل من 12.
  final textTheme = TextTheme(
    displayLarge: s(34, FontWeight.w700, c.textPrimary, 1.2),
    displayMedium: s(28, FontWeight.w700, c.textPrimary, 1.25),
    displaySmall: s(24, FontWeight.w700, c.textPrimary, 1.3),
    headlineLarge: s(22, FontWeight.w700, c.textPrimary, 1.3),
    headlineMedium: s(20, FontWeight.w700, c.textPrimary, 1.35),
    headlineSmall: s(18, FontWeight.w700, c.textPrimary, 1.35),
    titleLarge: s(16, FontWeight.w700, c.textPrimary, 1.4),
    titleMedium: s(15, FontWeight.w600, c.textPrimary, 1.4),
    titleSmall: s(14, FontWeight.w600, c.textSecondary, 1.4),
    bodyLarge: s(15, FontWeight.w400, c.textPrimary, 1.55),
    bodyMedium: s(14, FontWeight.w400, c.textPrimary, 1.5),
    bodySmall: s(12, FontWeight.w400, c.textMuted, 1.45),
    labelLarge: s(14, FontWeight.w700, c.textPrimary),
    labelMedium: s(13, FontWeight.w600, c.textSecondary),
    labelSmall: s(12, FontWeight.w600, c.textMuted),
  );

  final radius12 = BorderRadius.circular(UIConstants.radiusMedium);
  OutlineInputBorder outline(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: radius12,
        borderSide: BorderSide(color: color, width: width),
      );
  final buttonShape = RoundedRectangleBorder(borderRadius: radius12);
  final buttonText = s(16, FontWeight.w600, c.onPrimary);

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    fontFamily: UIConstants.fontFamily,
    primaryColor: c.primary,
    scaffoldBackgroundColor: c.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF006B2D),
      brightness: brightness,
      primary: c.primary,
      onPrimary: c.onPrimary,
      secondary: c.secondary,
      surface: c.surface,
      onSurface: c.textPrimary,
      onSurfaceVariant: c.textSecondary,
      outline: c.border,
      outlineVariant: c.divider,
      error: c.errorText,
    ),
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      backgroundColor: c.surface,
      foregroundColor: c.textPrimary,
      titleTextStyle: s(18, FontWeight.w700, c.textPrimary),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: c.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIConstants.radiusLarge),
        side: BorderSide(color: c.border),
      ),
      margin: EdgeInsets.zero,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
        elevation: 0,
        minimumSize: const Size(48, 48),
        padding: UIConstants.buttonPadding,
        shape: buttonShape,
        textStyle: buttonText,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
        minimumSize: const Size(48, 48),
        padding: UIConstants.buttonPadding,
        shape: buttonShape,
        textStyle: buttonText,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: c.primary,
        minimumSize: const Size(48, 48),
        padding: UIConstants.buttonPadding,
        side: BorderSide(color: c.primary),
        shape: buttonShape,
        textStyle: buttonText,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: c.primary,
        minimumSize: const Size(48, 48),
        textStyle: s(15, FontWeight.w600, c.primary),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(minimumSize: const Size(48, 48)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: c.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: outline(c.border),
      enabledBorder: outline(c.border),
      focusedBorder: outline(c.primary, 1.5),
      errorBorder: outline(c.errorText),
      focusedErrorBorder: outline(c.errorText, 1.5),
      labelStyle: s(14, FontWeight.w400, c.textSecondary),
      hintStyle: s(14, FontWeight.w400, c.textMuted),
      helperStyle: s(12, FontWeight.w400, c.textMuted),
      errorStyle: s(12, FontWeight.w500, c.errorText),
      prefixIconColor: c.textSecondary,
      suffixIconColor: c.textSecondary,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: c.primary.withValues(alpha: 0.10),
      selectedColor: c.primary,
      labelStyle: s(13, FontWeight.w600, c.textPrimary),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: BorderSide.none,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: c.primary,
      unselectedLabelColor: c.textMuted,
      indicatorColor: c.primary,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: s(14, FontWeight.w700, c.primary),
      unselectedLabelStyle: s(14, FontWeight.w400, c.textMuted),
      dividerColor: c.divider,
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      elevation: 0,
      backgroundColor: c.surface,
      indicatorColor: c.primary.withValues(alpha: 0.14),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) => IconThemeData(
            size: 24,
            color: states.contains(WidgetState.selected)
                ? c.primary
                : c.textMuted,
          )),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return s(12, selected ? FontWeight.w700 : FontWeight.w500,
            selected ? c.primary : c.textMuted);
      }),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: radius12),
      contentTextStyle: s(14, FontWeight.w500, Colors.white),
    ),
    dividerTheme: DividerThemeData(color: c.divider, thickness: 1, space: 1),
    extensions: <ThemeExtension<dynamic>>[c],
  );
}
