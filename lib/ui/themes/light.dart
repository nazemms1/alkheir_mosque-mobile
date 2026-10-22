import 'package:flutter/material.dart';
import 'app_color.dart';
import 'font_size.dart';
import 'ui_constants.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: UIConstants.fontFamily,
  primaryColor: const Color(0xFF006B2D),
  scaffoldBackgroundColor: const Color(0xFFF6F8F5),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF006B2D),
    brightness: Brightness.light,
    primary: const Color(0xFF006B2D),
    secondary: AppColors.secondaryLight,
    surface: const Color(0xFFFFFFFF),
    error: const Color(0xFFDC2626),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Color(0xFFFFFFFF),
    foregroundColor: Color(0xFF112B1C),
    titleTextStyle: TextStyle(
      fontFamily: UIConstants.fontFamily,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w600,
      color: Color(0xFF112B1C),
    ),
  ),
  cardTheme: CardThemeData(
    elevation: 0,
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusLarge),
      side: const BorderSide(color: Color(0xFFDCE4D8)),
    ),
    margin: EdgeInsets.zero,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF006B2D),
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
      foregroundColor: const Color(0xFF006B2D),
      padding: UIConstants.buttonPadding,
      side: const BorderSide(color: Color(0xFF006B2D)),
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
      borderSide: const BorderSide(color: Color(0xFFDCE4D8)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFDCE4D8)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFF006B2D), width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UIConstants.radiusMedium),
      borderSide: const BorderSide(color: Color(0xFFDC2626)),
    ),
  ),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFE8EFE5),
    thickness: 1,
    space: 1,
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppColors.light(),
  ],
);
