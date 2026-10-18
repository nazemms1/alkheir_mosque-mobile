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
