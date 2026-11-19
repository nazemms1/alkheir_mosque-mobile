import 'package:flutter/material.dart';
import 'app_color.dart';

extension BuildContextThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColors get appColors => theme.extension<AppColors>() ?? AppColors.light();
  bool get isDarkTheme => theme.brightness == Brightness.dark;
}
