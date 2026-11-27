import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/http/api_error.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';
import 'package:alkheir_mosque/features/shared/account/data/mapper/account_mapper.dart';
import 'package:alkheir_mosque/features/shared/account/data/models/account_model.dart';

void main() {
  test('account models parse the server\'s loose types and map to entities',
      () {
    final envelope = BaseApiModel<BootstrapModel>.fromJson(
      {
        'data': {
          'user': {
            'id': '7',
            'name': 'Ali',
            'is_active': 1,
            'roles': ['admin', 3],
            'teacher_id': '12',
          },
          'permissions': ['students.view'],
          'organization': {'name': 'Alkheir'},
          'features': {'activities': '1'},
        },
      },
      (json) => BootstrapModel.fromJson(json as Map<String, dynamic>),
    );

    final info = envelope.toDomain((data) => data.toDomain()).data;

    expect(info.user.id, 7);
    expect(info.user.isActive, isTrue);
    expect(info.user.roles, ['admin', '3']);
    expect(info.user.teacherId, 12);
    expect(info.user.usernameIsEditable, isFalse);
    expect(info.organizationName, 'Alkheir');
    expect(info.activitiesEnabled, isTrue);
    expect(info.locale, '');
  });

  test('dashboard keeps only numeric metrics', () {
    final dash = DashboardModel.fromJson({
      'metrics': {'students': 4, 'label': 'x'},
    }).toDomain();
    expect(dash.metrics, {'students': 4});
  });

  test('ApiError exposes duplicate pages and shows its message', () {
    const error = ApiError(
      type: ApiErrorType.validation,
      message: 'مكرر',
      data: {
        'duplicates': [3, 4]
      },
    );
    expect(error.duplicatePages, [3, 4]);
    expect(error.hasDuplicatePages, isTrue);
    expect('$error', 'مكرر');
  });
}
