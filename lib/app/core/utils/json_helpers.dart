/// مساعدات قراءة JSON آمنة — الخادم يُرجع أرقاماً كنصوص أحياناً و null في الحقول الاختيارية.
double jsonDouble(Object? v) =>
    v is num ? v.toDouble() : double.tryParse('${v ?? ''}') ?? 0;

double? jsonDoubleOrNull(Object? v) =>
    v == null ? null : (v is num ? v.toDouble() : double.tryParse('$v'));

int jsonInt(Object? v) =>
    v is num ? v.toInt() : int.tryParse('${v ?? ''}') ?? 0;

int? jsonIntOrNull(Object? v) =>
    v == null ? null : (v is num ? v.toInt() : int.tryParse('$v'));

bool jsonBool(Object? v) => v == true || v == 1 || v == '1';

String jsonString(Object? v) => v?.toString() ?? '';

String? jsonStringOrNull(Object? v) {
  final text = v?.toString().trim();
  return (text == null || text.isEmpty) ? null : text;
}

/// خريطة JSON أو null إن لم تكن كذلك (مثل `null` أو قائمة فارغة `[]`).
Map<String, dynamic>? jsonMap(Object? v) =>
    v is Map<String, dynamic> ? v : null;

/// تحويل قائمة JSON إلى نماذج، متجاهلاً العناصر غير الصالحة.
List<T> jsonList<T>(
  Object? v,
  T Function(Map<String, dynamic> json) fromJson,
) {
  if (v is! List) return const [];
  return [
    for (final item in v)
      if (item is Map<String, dynamic>) fromJson(item),
  ];
}

/// ورقة صفحات Laravel (`data`, `current_page`, `last_page`, `total`).
class PagedResult<T> {
  final List<T> items;
  final int currentPage;
  final int lastPage;
  final int total;

  const PagedResult({
    required this.items,
    required this.currentPage,
    required this.lastPage,
    required this.total,
  });

  bool get hasMore => currentPage < lastPage;

  factory PagedResult.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final items = jsonList(json['data'], fromJson);
    return PagedResult(
      items: items,
      currentPage: jsonInt(json['current_page'] ?? 1),
      lastPage: jsonInt(json['last_page'] ?? 1),
      total: jsonInt(json['total'] ?? items.length),
    );
  }
}

// Lenient `@JsonKey(fromJson: ...)` readers for freezed models: the server
// sometimes sends numbers as strings and booleans as 0/1.
int? jsonIntLenient(Object? v) => jsonIntOrNull(v);

bool? jsonBoolLenient(Object? v) => v == null ? null : jsonBool(v);

String? jsonStringLenient(Object? v) => jsonStringOrNull(v);

List<String>? jsonStringListLenient(Object? v) =>
    v is List ? [for (final e in v) '$e'] : null;

/// قيمة استعلام نصية تُحذف من الطلب إن كانت فارغة.
String? queryText(String? v) => v == null || v.isEmpty ? null : v;

/// قيمة استعلام منطقية بصيغة 1/0 تُحذف إن كانت null.
int? queryFlag(bool? v) => v == null ? null : (v ? 1 : 0);

double? jsonDoubleLenient(Object? v) => jsonDoubleOrNull(v);

/// مثل [jsonString] لكن يُبقي `null` ليضع المُحوِّل القيمة الافتراضية.
String? jsonStringValue(Object? v) => v?.toString();

/// `readValue` لكائن متداخل: يُرجع الخريطة أو `null` (مثل `[]` بدل `{}`).
Object? readJsonMap(Map<dynamic, dynamic> json, String key) =>
    jsonMap(json[key]);

/// `readValue` لقائمة كائنات: يتجاهل العناصر غير الصالحة كما كان [jsonList].
Object? readJsonList(Map<dynamic, dynamic> json, String key) {
  final v = json[key];
  return v is List ? v.whereType<Map<String, dynamic>>().toList() : null;
}
