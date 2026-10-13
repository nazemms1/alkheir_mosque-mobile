import 'package:shared_preferences/shared_preferences.dart';

/// عنوان خادم الـ API.
///
/// الافتراضي هو خادم الإنتاج لمسجد الخير: `https://www.alkheir-mosque.com`.
/// يمكن تغييره من شاشة تسجيل الدخول (زر الخادم) إلى عنوان آخر، مثل خادم
/// التطوير المحلي `http://10.0.2.2:8000` (محاكي Android) أو `http://127.0.0.1:8000`.
///
/// يُقبل إدخال العنوان بصيغة الجذر أو بصيغة `/api/v1` كاملة؛ يُنظَّف تلقائياً.
abstract final class ServerConfig {
  static const _prefsKey = 'server_base_url';
  static const _productionBaseUrl = 'https://www.alkheir-mosque.com';

  // يمكن تجاوز الافتراضي عند البناء، مثل:
  // flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
  static const _envBaseUrl = String.fromEnvironment('API_BASE_URL');

  static String _baseUrl = defaultBaseUrl;

  /// العنوان الأساسي للخادم بدون `/api/v1`.
  static String get baseUrl => _baseUrl;

  /// عنوان الـ API الكامل، مثل `https://www.alkheir-mosque.com/api/v1`.
  static String get apiBaseUrl => '$_baseUrl/api/v1';

  /// الافتراضي الذي يُستعاد من شاشة الإعدادات.
  static String get defaultBaseUrl => _envBaseUrl.isNotEmpty
      ? (normalize(_envBaseUrl) ?? _productionBaseUrl)
      : _productionBaseUrl;

  /// يُستدعى مرة واحدة في `main()` بعد تهيئة SharedPreferences.
  static void load(SharedPreferences prefs) {
    _baseUrl = prefs.getString(_prefsKey) ?? defaultBaseUrl;
  }

  /// يتحقق من صيغة العنوان ويحفظه. يُعيد `false` إن كانت الصيغة غير صالحة.
  static Future<bool> save(SharedPreferences prefs, String value) async {
    final normalized = normalize(value);
    if (normalized == null) return false;
    _baseUrl = normalized;
    await prefs.setString(_prefsKey, normalized);
    return true;
  }

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
