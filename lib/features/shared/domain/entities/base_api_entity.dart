import 'meta_entity.dart';

class BaseApiEntity<T> {
  final T data;
  final bool success;
  final String message;
  final int code;
  final MetaEntity meta;

  const BaseApiEntity({
    required this.data,
    required this.success,
    required this.message,
    required this.code,
    required this.meta,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseApiEntity<T> &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          success == other.success &&
          message == other.message &&
          code == other.code &&
          meta == other.meta;

  @override
  int get hashCode =>
      data.hashCode ^
      success.hashCode ^
      message.hashCode ^
      code.hashCode ^
      meta.hashCode;

  @override
  String toString() =>
      'BaseApiEntity(data: $data, success: $success, message: $message, code: $code, meta: $meta)';
}
