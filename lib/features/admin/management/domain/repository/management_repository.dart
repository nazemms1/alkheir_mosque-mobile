import 'package:alkheir_mosque/features/admin/management/data/params/management_params.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/admin/management/data/mapper/group_student_mapper.dart';
import 'package:alkheir_mosque/features/admin/management/data/mapper/management_mapper.dart';
import 'package:alkheir_mosque/app/core/function/function.dart';
import 'package:alkheir_mosque/app/core/http/data/mapper/shared_mapper.dart';
import '../../data/apis/management_apis.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

abstract class ManagementRepository {
  Future<PagedResult<ParentItem>> parents({
    int page = 1,
    String? search,
    bool? isActive,
  });

  Future<ParentItem> parent(int id);

  Future<ParentItem> saveParent(int? id, SaveParentParams body);

  Future<void> deleteParent(int id);

  Future<PagedResult<TeacherItem>> teachers({
    int page = 1,
    String? search,
    String? status,
    int? courseId,
    int perPage = 20,
  });

  Future<TeacherItem> teacher(int id);

  Future<TeacherItem> saveTeacher(int? id, SaveTeacherParams body);

  Future<void> deleteTeacher(int id);

  Future<PagedResult<CourseItem>> courses({
    int page = 1,
    String? search,
    bool? isActive,
    int perPage = 20,
  });

  Future<CourseItem> course(int id);

  Future<CourseItem> saveCourse(int? id, SaveCourseParams body);

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

class ManagementRepositoryImpl implements ManagementRepository {
  static const _perPage = 20;

  final ManagementApis api;

  ManagementRepositoryImpl(this.api);

  // ─── الأولياء ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<ParentItem>> parents({
    int page = 1,
    String? search,
    bool? isActive,
  }) async {
    final result = await handleRepoData(() => api.parents(page, _perPage,
        search: queryText(search), isActive: queryFlag(isActive)));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<ParentItem> parent(int id) async =>
      (await handleRepoData(() => api.parent(id))).data.toDomain();

  @override
  Future<ParentItem> saveParent(int? id, SaveParentParams body) async {
    final result = await handleRepoData(
        () => id == null ? api.createParent(body) : api.updateParent(id, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteParent(int id) =>
      handleRepoData(() => api.deleteParent(id));

  // ─── المعلمون ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<TeacherItem>> teachers({
    int page = 1,
    String? search,
    String? status,
    int? courseId,
    int perPage = 20,
  }) async {
    final result = await handleRepoData(() => api.teachers(page, perPage,
        search: queryText(search), status: status, courseId: courseId));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<TeacherItem> teacher(int id) async =>
      (await handleRepoData(() => api.teacher(id))).data.toDomain();

  @override
  Future<TeacherItem> saveTeacher(int? id, SaveTeacherParams body) async {
    final result = await handleRepoData(() =>
        id == null ? api.createTeacher(body) : api.updateTeacher(id, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteTeacher(int id) =>
      handleRepoData(() => api.deleteTeacher(id));

  // ─── الكورسات ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<CourseItem>> courses({
    int page = 1,
    String? search,
    bool? isActive,
    int perPage = 20,
  }) async {
    final result = await handleRepoData(() => api.courses(page, perPage,
        search: queryText(search), isActive: queryFlag(isActive)));
    return result.toPaged((e) => e.toDomain());
  }

  @override
  Future<CourseItem> course(int id) async =>
      (await handleRepoData(() => api.course(id))).data.toDomain();

  @override
  Future<CourseItem> saveCourse(int? id, SaveCourseParams body) async {
    final result = await handleRepoData(
        () => id == null ? api.createCourse(body) : api.updateCourse(id, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteCourse(int id) =>
      handleRepoData(() => api.deleteCourse(id));

  /// إنهاء الكورس يشغّل دورة الإنهاء الكاملة في الخادم (الحلقات والتسجيلات).
  @override
  Future<CourseItem> finishCourse(int id) async =>
      (await handleRepoData(() => api.finishCourse(id))).data.toDomain();

  @override
  Future<CourseItem> reactivateCourse(int id) async =>
      (await handleRepoData(() => api.reactivateCourse(id))).data.toDomain();

  // ─── جداول الحلقات ─────────────────────────────────────────────────────────
  @override
  Future<List<GroupScheduleSlot>> schedules(int groupId) async =>
      (await handleRepoData(() => api.schedules(groupId)))
          .data
          ?.map((e) => e.toDomain())
          .toList() ??
      const [];

  @override
  Future<GroupScheduleSlot> saveSchedule(
    int groupId,
    int? scheduleId, {
    required int dayOfWeek,
    required String timeSlot,
  }) async {
    final body = SaveScheduleParams(dayOfWeek: dayOfWeek, timeSlot: timeSlot);
    final result = await handleRepoData(() => scheduleId == null
        ? api.createSchedule(groupId, body)
        : api.updateSchedule(groupId, scheduleId, body));
    return result.data.toDomain();
  }

  @override
  Future<void> deleteSchedule(int groupId, int scheduleId) =>
      handleRepoData(() => api.deleteSchedule(groupId, scheduleId));

  /// قائمة الحلقات لاختيار حلقة قبل إدارة جدولها.
  @override
  Future<PagedResult<GroupItem>> groups({int page = 1}) async =>
      (await handleRepoData(() => api.groups(page, _perPage)))
          .toPaged((e) => e.toDomain());

  /// بحث الطلاب بالاسم أو الرقم (للاختيار قبل عرض الملف أو الاختبارات).
  @override
  Future<PagedResult<StudentListItem>> students({
    int page = 1,
    String? search,
  }) async {
    final result = await handleRepoData(
        () => api.students(page, _perPage, search: queryText(search)));
    return result.toPaged((e) => e.toDomain());
  }

  // ─── الكتالوجات المرجعية ───────────────────────────────────────────────────
  @override
  Future<List<RefItem>> reference(
    String path, {
    String? search,
    bool includeInactive = false,
  }) async {
    final result = await handleRepoData(() => api.reference(path,
        search: queryText(search),
        includeInactive: includeInactive ? 1 : null));
    return result.data?.map((e) => e.toDomain()).toList() ?? const [];
  }
}
