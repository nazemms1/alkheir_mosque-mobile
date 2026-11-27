import 'package:alkheir_mosque/app/core/http/domain/entities/base_api_entity.dart';
import 'package:alkheir_mosque/app/core/http/domain/entities/meta_entity.dart';
import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/app/core/http/data/models/meta_model.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

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

extension PagedApiModelMapper<T> on BaseApiModel<List<T>> {
  /// ورقة صفحات Laravel (`data` + `current_page` + `last_page` + `total`).
  PagedResult<R> toPaged<R>(R Function(T model) toDomain) {
    final items = [for (final e in data ?? <T>[]) toDomain(e)];
    return PagedResult(
      items: items,
      currentPage: currentPage ?? 1,
      lastPage: lastPage ?? 1,
      total: total ?? items.length,
    );
  }
}
