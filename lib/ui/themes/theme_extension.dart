import 'package:flutter/material.dart';
import 'app_color.dart';

extension BuildContextThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColors get appColors => theme.extension<AppColors>() ?? AppColors.light();
  bool get isDarkTheme => theme.brightness == Brightness.dark;
}

extension ThemeDataX on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;

  List<BoxShadow> get boxShadows => [
        BoxShadow(
          color: isDarkTheme
              ? Colors.black.withValues(alpha: 0.3)
              : const Color(0x14000000),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  LinearGradient get gradient {
    final colors = extension<AppColors>() ?? (isDarkTheme ? AppColors.dark() : AppColors.light());
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colors.primary,
        colors.secondary,
      ],
    );
  }
}
