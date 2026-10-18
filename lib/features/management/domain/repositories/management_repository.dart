import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../data/models/group_student_model.dart';
import '../../data/models/management_model.dart';

abstract class ManagementRepository {
  Future<PagedResult<ParentItem>> parents({
    int page = 1,
    String? search,
    bool? isActive,
  });

  Future<ParentItem> parent(int id);

  Future<ParentItem> saveParent(int? id, Map<String, dynamic> body);

  Future<void> deleteParent(int id);

  Future<PagedResult<TeacherItem>> teachers({
    int page = 1,
    String? search,
    String? status,
    int? courseId,
    int perPage = 20,
  });

  Future<TeacherItem> teacher(int id);

  Future<TeacherItem> saveTeacher(int? id, Map<String, dynamic> body);

  Future<void> deleteTeacher(int id);

  Future<PagedResult<CourseItem>> courses({
    int page = 1,
    String? search,
    bool? isActive,
    int perPage = 20,
  });

  Future<CourseItem> course(int id);

  Future<CourseItem> saveCourse(int? id, Map<String, dynamic> body);

  Future<void> deleteCourse(int id);

  Future<CourseItem> finishCourse(int id);

  Future<CourseItem> reactivateCourse(int id);

  Future<List<GroupScheduleSlot>> schedules(int groupId);

  Future<GroupScheduleSlot> saveSchedule(
    int groupId,
    int? scheduleId, {
    required int dayOfWeek,
    required String timeSlot,
  });

  Future<void> deleteSchedule(int groupId, int scheduleId);

  Future<PagedResult<GroupItem>> groups({int page = 1});

  Future<PagedResult<StudentListItem>> students({
    int page = 1,
    String? search,
  });

  Future<List<RefItem>> reference(
    String path, {
    String? search,
    bool includeInactive = false,
  });
}
