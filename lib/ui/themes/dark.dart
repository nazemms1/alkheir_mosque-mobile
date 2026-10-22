import 'package:flutter/material.dart';
import 'app_color.dart';
import 'font_size.dart';
import 'ui_constants.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: UIConstants.fontFamily,
  primaryColor: AppColors.primaryDark,
  scaffoldBackgroundColor: const Color(0xFF04160B),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryDark,
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryDark,
    surface: const Color(0xFF072714),
    error: const Color(0xFFEF4444),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Color(0xFF051C0E),
    foregroundColor: Color(0xFFF3FFF6),
    titleTextStyle: TextStyle(
      fontFamily: UIConstants.fontFamily,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w600,
      color: Color(0xFFF3FFF6),
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    color: const Color(0xFF072714),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusLarge),
      side: const BorderSide(color: Color(0xFF193222)),
    ),
    margin: EdgeInsets.zero,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: UIConstants.buttonPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      ),
      textStyle: const TextStyle(
        fontFamily: UIConstants.fontFamily,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryDark,
      padding: UIConstants.buttonPadding,
      side: const BorderSide(color: AppColors.primaryDark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      ),
      textStyle: const TextStyle(
        fontFamily: UIConstants.fontFamily,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF072714),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFF193222)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFF193222)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: AppColors.primaryDark, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFEF4444)),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xFF193222),
    thickness: 1,
    space: 1,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors.dark(),
  ],
);
