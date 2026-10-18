enum ApiErrorType {
  network,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  requestTimeout,
  conflict,
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

  @override
  String toString() => 'ApiError(type: $type, message: $message, statusCode: $statusCode)';
}
