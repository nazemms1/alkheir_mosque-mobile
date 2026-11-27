enum ApiErrorType {
  network,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  requestTimeout,
  conflict,
  validation,
  internalServer,
  badGateway,
  cancelled,
  unexpected,
  custom,
}

class ApiError implements Exception {
  final ApiErrorType type;
  final String? message;
  final int? statusCode;
  final dynamic data;

  const ApiError({
    required this.type,
    this.message,
    this.statusCode,
    this.data,
  });

  bool get isForbidden => statusCode == 403;
  bool get isUnauthorized => statusCode == 401;

  /// صفحات مسمّعة مسبقاً يعيدها الخادم عند رفض تسجيل حفظ مكرّر.
  List<int>? get duplicatePages {
    final raw = data is Map ? (data as Map)['duplicates'] : null;
    return raw is List
        ? [
            for (final e in raw)
              if (e is num) e.toInt()
          ]
        : null;
  }

  bool get hasDuplicatePages => duplicatePages?.isNotEmpty ?? false;

  // Screens render errors with '$e', so this must stay the user-facing text.
  @override
  String toString() => message ?? '';
}
