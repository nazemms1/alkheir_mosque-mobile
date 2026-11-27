import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/features/admin/dashboard/data/params/admin_params.dart';
import 'package:alkheir_mosque/features/shared/operations/data/params/operations_params.dart';

void main() {
  test('unconditional fields are sent even when null (clears the field)', () {
    final json = const CreateGroupParams(
      name: 'حلقة',
      academicYearId: 1,
      courseId: 2,
      teacherId: 3,
      gradeLevelId: 4,
      capacity: 20,
      monthlyFee: 0,
      startsOn: '2025-01-01',
      endsOn: '2025-06-01',
      isActive: true,
    ).toJson();

    expect(json.containsKey('assistant_teacher_id'), isTrue);
    expect(json['assistant_teacher_id'], isNull);
    expect(json['academic_year_id'], 1);
  });

  test('conditional fields are omitted when their condition failed', () {
    expect(
      const AddManualPointsParams(pointTypeId: 5, points: 10).toJson(),
      {'point_type_id': 5, 'points': 10},
    );
    expect(
      const AddManualPointsParams(pointTypeId: 5, points: 10, notes: 'x')
          .toJson(),
      {'point_type_id': 5, 'points': 10, 'notes': 'x'},
    );
  });
}
