import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/admin/management/ui/providers/paged_list_controller.dart';

void main() {
  test('loads pages in order and keeps items when a later page fails',
      () async {
    var failPage = 0;
    Future<PagedResult<int>> fetch(int page) async {
      if (page == failPage) {
        throw const ApiError(type: ApiErrorType.network, message: 'offline');
      }
      return PagedResult(
          items: [page * 10], currentPage: page, lastPage: 3, total: 3);
    }

    final container = ProviderContainer();
    addTearDown(container.dispose);
    final provider = pagedListProvider<int>(() => fetch);
    container.listen(provider, (_, __) {});
    await Future<void>.delayed(Duration.zero);

    expect(container.read(provider).items, [10]);
    expect(container.read(provider).hasMore, isTrue);

    await container.read(provider.notifier).loadMore();
    expect(container.read(provider).items, [10, 20]);

    failPage = 3;
    await container.read(provider.notifier).loadMore();
    final state = container.read(provider);
    expect(state.items, [10, 20]);
    expect(state.isLoading, isFalse);
    expect('${state.error}', 'offline');

    failPage = 0;
    await container.read(provider.notifier).reset();
    expect(container.read(provider).items, [10]);
    expect(container.read(provider).error, isNull);
  });
}
