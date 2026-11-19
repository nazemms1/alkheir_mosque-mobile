/// سلّم الخطوط الموحّد — كل أحجام النصوص في التطبيق تأتي من هنا،
/// وهو نفسه الذي يبني textTheme في app_theme_builder.dart. لا نص أقل من 12.
abstract final class FontSize {
  static const double caption = 12; // bodySmall / labelSmall
  static const double label = 13; // labelMedium
  static const double body = 14; // bodyMedium
  static const double bodyLarge = 15; // bodyLarge / titleMedium
  static const double title = 16; // titleLarge
  static const double headlineSmall = 18;
  static const double headline = 20;
  static const double headlineLarge = 22;
  static const double displaySmall = 24;
  static const double display = 28;
  static const double displayLarge = 34;

  /// أرقام العرض الكبيرة فقط (نتيجة، عدّاد).
  static const double hero = 52;
}
