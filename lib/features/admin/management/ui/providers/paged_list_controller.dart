import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/api_helper_mixin.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

class PagedListState<T> {
  const PagedListState({
    this.items = const [],
    this.currentPage = 0,
    this.lastPage = 1,
    this.total = 0,
    this.isLoading = true,
    this.error,
  });

  final List<T> items;
  final int currentPage;
  final int lastPage;
  final int total;
  final bool isLoading;
  final ApiError? error;

  bool get hasMore => currentPage < lastPage;

  /// أول تحميل (لا عناصر بعد) مقابل تحميل صفحة إضافية.
  bool get isFirstLoad => isLoading && items.isEmpty;
  bool get isLoadingMore => isLoading && items.isNotEmpty;
}

/// حالة [PagedList]: الصفحات المحمّلة، والتحميل، والخطأ.
///
/// riverpod_generator لا يدعم الأنواع العامة، لذا يُنشئ كل [PagedList] مزوّده
/// الخاص عبر [pagedListProvider].
class PagedListController<T> extends AutoDisposeNotifier<PagedListState<T>>
    with ApiHelperMixin {
  PagedListController(this._fetch);

  final Future<PagedResult<T>> Function(int page) Function() _fetch;

  @override
  PagedListState<T> build() {
    Future.microtask(() => _load(1));
    return PagedListState<T>();
  }

  Future<void> reset() {
    state = PagedListState<T>();
    return _load(1);
  }

  Future<void> loadMore() {
    final s = state;
    state = PagedListState<T>(
      items: s.items,
      currentPage: s.currentPage,
      lastPage: s.lastPage,
      total: s.total,
    );
    return _load(s.currentPage + 1);
  }

  Future<void> _load(int page) async {
    final result = await executeApi(
      action: () => _fetch()(page),
      errorHandler: (e) {
        final s = state;
        state = PagedListState<T>(
          items: s.items,
          currentPage: s.currentPage,
          lastPage: s.lastPage,
          total: s.total,
          isLoading: false,
          error: e,
        );
      },
    );
    if (result == null) return;
    state = PagedListState<T>(
      items: [...state.items, ...result.items],
      currentPage: page,
      lastPage: result.lastPage,
      total: result.total,
      isLoading: false,
    );
  }
}

/// [fetch] يُقرأ عند كل طلب حتى تستعمل الصفحة دائماً أحدث فلاترها.
AutoDisposeNotifierProvider<PagedListController<T>, PagedListState<T>>
    pagedListProvider<T>(
  Future<PagedResult<T>> Function(int page) Function() fetch,
) =>
        NotifierProvider.autoDispose<PagedListController<T>, PagedListState<T>>(
          () => PagedListController<T>(fetch),
        );
