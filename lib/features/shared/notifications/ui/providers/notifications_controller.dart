import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alkheir_mosque/features/shared/students/di/students_providers.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_entity.dart';

part 'notifications_controller.g.dart';

/// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  Future<List<NoteMessage>> build(int? studentId) async {
    if (studentId == null) return const [];
    final entries =
        await ref.read(studentRepositoryProvider).fetchNotes(studentId);
    return entries.map((e) => e.toNoteMessage()).toList()
      ..sort((a, b) => b.dateTime.compareTo(a.dateTime));
  }
}
