import 'package:flutter/material.dart';
import 'package:alkheir_mosque/ui/themes/app_color.dart';

extension BuildContextThemeX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  AppColors get appColors => theme.extension<AppColors>() ?? AppColors.light();
  bool get isDarkTheme => theme.brightness == Brightness.dark;
}

extension TintTextX on BuildContext {
  /// لون نص/أيقونة مقروء فوق خلفية مُلوّنة خفيفة من نفس اللون
  /// (شارات وحالات): ≥5.5:1 في الفاتح وأعلى من 4.5:1 في الداكن.
  Color onTint(Color color) => Theme.of(this).brightness == Brightness.dark
      ? Color.lerp(color, Colors.white, 0.4)!
      : Color.lerp(color, Colors.black, 0.45)!;
}
