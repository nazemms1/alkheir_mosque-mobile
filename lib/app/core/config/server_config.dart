import 'package:shared_preferences/shared_preferences.dart';

/// عنوان خادم الـ API.
///
/// خادم الإنتاج الثابت والوحيد لمسجد الخير: `https://www.alkheir-mosque.com`.
abstract final class ServerConfig {
  static const _productionBaseUrl = 'https://www.alkheir-mosque.com';

  /// العنوان الأساسي للخادم بدون `/api/v1`.
  static String get baseUrl => _productionBaseUrl;

  /// عنوان الـ API الكامل: `https://www.alkheir-mosque.com/api/v1`.
  static String get apiBaseUrl => '$_productionBaseUrl/api/v1';

  /// الافتراضي الثابت: `https://www.alkheir-mosque.com`.
  static String get defaultBaseUrl => _productionBaseUrl;

  /// يُستدعى مرة واحدة في `main()`.
  static void load(SharedPreferences prefs) {
    // محصور حصراً على خادم الإنتاج
  }

  /// ثابت على خادم الإنتاج دائماً
  static Future<bool> save(SharedPreferences prefs, String value) async => true;

  /// يُعيد العنوان الجذر بعد إزالة المسافات والشرطات المائلة و`/api/v1`
  /// أو `/api` إن أُدخلت، أو `null` إن كانت الصيغة غير صالحة.
  static String? normalize(String value) {
    var trimmed = value.trim().replaceAll(RegExp(r'/+$'), '');
    trimmed = trimmed.replaceAll(RegExp(r'/api(/v1)?$'), '');
    trimmed = trimmed.replaceAll(RegExp(r'/+$'), '');
    final uri = Uri.tryParse(trimmed);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) return null;
    if (uri.scheme != 'http' && uri.scheme != 'https') return null;
    return trimmed;
  }
}
