import 'package:flutter/material.dart';
import 'app_color.dart';
import 'font_size.dart';
import 'ui_constants.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: UIConstants.fontFamily,
  primaryColor: AppColors.primaryLight,
  scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryLight,
    brightness: Brightness.light,
    primary: AppColors.primaryLight,
    secondary: AppColors.secondaryLight,
    surface: const Color(0xFFFFFFFF),
    error: const Color(0xFFDC2626),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF1E293B),
    titleTextStyle: TextStyle(
      fontFamily: UIConstants.fontFamily,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF1E293B),
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusLarge),
      side: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    margin: EdgeInsets.zero,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryLight,
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
      foregroundColor: AppColors.primaryLight,
      padding: UIConstants.buttonPadding,
      side: const BorderSide(color: AppColors.primaryLight),
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
    fillColor: const Color(0xFFFFFFFF),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: AppColors.primaryLight, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFDC2626)),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFEDF2F7),
    thickness: 1,
    space: 1,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors.light(),
  ],
);
