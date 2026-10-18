import '../../domain/entities/base_api_entity.dart';
import '../../domain/entities/meta_entity.dart';
import '../models/base_api_model.dart';
import '../models/meta_model.dart';

extension MetaModelMapper on MetaModel? {
  MetaEntity toDomain() {
    return MetaEntity(
      total: this?.total ?? 0,
      limit: this?.limit ?? 0,
      offset: this?.offset ?? 0,
      hasMore: this?.hasMore ?? false,
    );
  }
}

extension BaseApiModelMapper<T> on BaseApiModel<T>? {
  BaseApiEntity<R> toDomain<R>(R Function(T? data) dataMapper) {
    return BaseApiEntity<R>(
      data: dataMapper(this?.data),
      success: this?.success ?? false,
      message: this?.message ?? '',
      code: this?.code ?? 0,
      meta: this?.meta?.toDomain() ??
          const MetaEntity(
            total: 0,
            limit: 0,
            offset: 0,
            hasMore: false,
          ),
    );
  }
}
