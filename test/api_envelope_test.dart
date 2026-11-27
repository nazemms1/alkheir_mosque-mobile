import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/features/admin/dashboard/data/apis/admin_apis.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/repository/admin_repository.dart';
import 'package:alkheir_mosque/features/shared/operations/data/apis/operations_apis.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/repository/operations_repository.dart';
import 'package:alkheir_mosque/features/shared/students/data/apis/student_apis.dart';
import 'package:alkheir_mosque/features/shared/students/domain/repository/student_repository.dart';

/// Answers each request path with canned JSON, so the generated Retrofit
/// clients and `BaseApiModel` envelopes run for real.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this.routes);

  final Map<String, Object Function(RequestOptions)> routes;
  final List<String> calls = [];

  @override
  Future<ResponseBody> fetch(
      RequestOptions options, Stream<Uint8List>? _, Future<void>? __) async {
    calls.add('${options.path}?${options.queryParameters}');
    final body = routes[options.path]!(options);
    return ResponseBody.fromString(jsonEncode(body), 200, headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    });
  }

  @override
  void close({bool force = false}) {}
}

Dio _dio(_FakeAdapter adapter) =>
    Dio(BaseOptions(baseUrl: 'https://test.local/api/v1/'))
      ..httpClientAdapter = adapter;

void main() {
  test('Laravel paging at the top level (operations)', () async {
    final adapter = _FakeAdapter({
      'student-attendance/days': (_) => {
            'data': [
              {'id': '4', 'attendance_date': '2025-03-04', 'status': 'open'},
            ],
            'current_page': 1,
            'last_page': '3',
            'total': 41,
          },
    });
    final repo = OperationsRepositoryImpl(OperationsApis(_dio(adapter)));

    final page = await repo.studentAttendanceDays(status: 'open');

    expect(page.items.single.id, 4);
    expect(page.items.single.status, 'open');
    expect(page.lastPage, 3);
    expect(page.total, 41);
    expect(page.hasMore, isTrue);
  });

  test('paging through meta.last_page fetches every page (students)', () async {
    final adapter = _FakeAdapter({
      'parent/children/9/memorization': (o) {
        final page = int.parse('${o.queryParameters['page']}');
        return {
          'data': [
            {
              'id': page,
              'entry_type': 'new',
              'from_page': 1,
              'to_page': 2,
              'date': '2025-03-04',
            },
          ],
          'meta': {'current_page': page, 'last_page': 2},
        };
      },
    });
    final repo = StudentRepositoryImpl(StudentApis(_dio(adapter)));

    final entries = await repo.fetchMemorization(9);

    expect(entries.map((e) => e.id), [1, 2]);
    expect(adapter.calls, hasLength(2));
  });

  test('records with top-level total and last_page (admin)', () async {
    final adapter = _FakeAdapter({
      'groups': (_) => {
            'data': [
              {'id': 2, 'name': 'حلقة'},
            ],
            'total': 7,
            'last_page': 2,
          },
    });
    final repo = AdminRepositoryImpl(AdminApis(_dio(adapter)));

    final result = await repo.fetchGroups(isActive: true);

    expect(result.items.single.name, 'حلقة');
    expect(result.total, 7);
    expect(result.lastPage, 2);
    expect(adapter.calls.single, contains('is_active: 1'));
  });
}
