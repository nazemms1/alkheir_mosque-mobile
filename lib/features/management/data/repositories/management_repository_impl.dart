import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import '../../domain/repositories/management_repository.dart';
import '../models/group_student_model.dart';
import '../models/management_model.dart';

class ManagementRepositoryImpl implements ManagementRepository {
  final ApiService _api;

  ManagementRepositoryImpl({ApiService? api}) : _api = api ?? ApiService();

  // ─── الأولياء ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<ParentItem>> parents({
    int page = 1,
    String? search,
    bool? isActive,
  }) async {
    final json = await _api.get('parents', query: {
      'page': page,
      'per_page': 20,
      if (search != null && search.isNotEmpty) 'search': search,
      if (isActive != null) 'is_active': isActive ? 1 : 0,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, ParentItem.fromJson);
  }

  @override
  Future<ParentItem> parent(int id) async {
    final json = await _api.get('parents/$id') as Map<String, dynamic>;
    return ParentItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  @override
  Future<ParentItem> saveParent(int? id, Map<String, dynamic> body) async {
    final json = id == null
        ? await _api.post('parents', body: body)
        : await _api.patch('parents/$id', body: body);
    return ParentItem.fromJson(
        (json as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> deleteParent(int id) => _api.delete('parents/$id');

  // ─── المعلمون ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<TeacherItem>> teachers({
    int page = 1,
    String? search,
    String? status,
    int? courseId,
    int perPage = 20,
  }) async {
    final json = await _api.get('teachers', query: {
      'page': page,
      'per_page': perPage,
      if (search != null && search.isNotEmpty) 'search': search,
      if (status != null) 'status': status,
      if (courseId != null) 'course_id': courseId,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, TeacherItem.fromJson);
  }

  @override
  Future<TeacherItem> teacher(int id) async {
    final json = await _api.get('teachers/$id') as Map<String, dynamic>;
    return TeacherItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  @override
  Future<TeacherItem> saveTeacher(int? id, Map<String, dynamic> body) async {
    final json = id == null
        ? await _api.post('teachers', body: body)
        : await _api.patch('teachers/$id', body: body);
    return TeacherItem.fromJson(
        (json as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> deleteTeacher(int id) => _api.delete('teachers/$id');

  // ─── الكورسات ───────────────────────────────────────────────────────────────
  @override
  Future<PagedResult<CourseItem>> courses({
    int page = 1,
    String? search,
    bool? isActive,
    int perPage = 20,
  }) async {
    final json = await _api.get('courses', query: {
      'page': page,
      'per_page': perPage,
      if (search != null && search.isNotEmpty) 'search': search,
      if (isActive != null) 'is_active': isActive ? 1 : 0,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, CourseItem.fromJson);
  }

  @override
  Future<CourseItem> course(int id) async {
    final json = await _api.get('courses/$id') as Map<String, dynamic>;
    return CourseItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  @override
  Future<CourseItem> saveCourse(int? id, Map<String, dynamic> body) async {
    final json = id == null
        ? await _api.post('courses', body: body)
        : await _api.patch('courses/$id', body: body);
    return CourseItem.fromJson(
        (json as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> deleteCourse(int id) => _api.delete('courses/$id');

  /// إنهاء الكورس يشغّل دورة الإنهاء الكاملة في الخادم (الحلقات والتسجيلات).
  @override
  Future<CourseItem> finishCourse(int id) async {
    final json = await _api.post('courses/$id/finish') as Map<String, dynamic>;
    return CourseItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  @override
  Future<CourseItem> reactivateCourse(int id) async {
    final json =
        await _api.post('courses/$id/reactivate') as Map<String, dynamic>;
    return CourseItem.fromJson(json['data'] as Map<String, dynamic>);
  }

  // ─── جداول الحلقات ─────────────────────────────────────────────────────────
  @override
  Future<List<GroupScheduleSlot>> schedules(int groupId) async {
    final json =
        await _api.get('groups/$groupId/schedules') as Map<String, dynamic>;
    return jsonList(json['data'], GroupScheduleSlot.fromJson);
  }

  @override
  Future<GroupScheduleSlot> saveSchedule(
    int groupId,
    int? scheduleId, {
    required int dayOfWeek,
    required String timeSlot,
  }) async {
    final body = {'day_of_week': dayOfWeek, 'time_slot': timeSlot};
    final json = scheduleId == null
        ? await _api.post('groups/$groupId/schedules', body: body)
        : await _api.patch('groups/$groupId/schedules/$scheduleId', body: body);
    return GroupScheduleSlot.fromJson(
        (json as Map<String, dynamic>)['data'] as Map<String, dynamic>);
  }

  @override
  Future<void> deleteSchedule(int groupId, int scheduleId) =>
      _api.delete('groups/$groupId/schedules/$scheduleId');

  /// قائمة الحلقات لاختيار حلقة قبل إدارة جدولها.
  @override
  Future<PagedResult<GroupItem>> groups({int page = 1}) async {
    final json = await _api.get('groups', query: {
      'page': page,
      'per_page': 20,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, GroupItem.fromJson);
  }

  /// بحث الطلاب بالاسم أو الرقم (للاختيار قبل عرض الملف أو الاختبارات).
  @override
  Future<PagedResult<StudentListItem>> students({
    int page = 1,
    String? search,
  }) async {
    final json = await _api.get('students', query: {
      'page': page,
      'per_page': 20,
      if (search != null && search.isNotEmpty) 'search': search,
    }) as Map<String, dynamic>;
    return PagedResult.fromJson(json, StudentListItem.fromJson);
  }

  // ─── الكتالوجات المرجعية ───────────────────────────────────────────────────
  @override
  Future<List<RefItem>> reference(
    String path, {
    String? search,
    bool includeInactive = false,
  }) async {
    final json = await _api.get(
      'reference/$path',
      query: {
        if (search != null && search.isNotEmpty) 'q': search,
        if (includeInactive) 'include_inactive': 1,
      },
    ) as Map<String, dynamic>;
    return jsonList(json['data'], RefItem.fromJson);
  }
}
