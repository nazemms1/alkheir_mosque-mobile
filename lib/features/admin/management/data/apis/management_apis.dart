import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:alkheir_mosque/features/admin/management/data/params/management_params.dart';

import 'package:alkheir_mosque/app/core/http/data/models/base_api_model.dart';

import '../models/group_student_model.dart';
import '../models/management_model.dart';

part 'management_apis.g.dart';

@RestApi()
abstract class ManagementApis {
  factory ManagementApis(Dio dio) = _ManagementApis;

  // ─── الأولياء ───────────────────────────────────────────────────────────────
  @GET('parents')
  Future<BaseApiModel<List<ParentItemModel>>> parents(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('search') String? search,
    @Query('is_active') int? isActive,
  });

  @GET('parents/{id}')
  Future<BaseApiModel<ParentItemModel>> parent(@Path('id') int id);

  @POST('parents')
  Future<BaseApiModel<ParentItemModel>> createParent(
      @Body() SaveParentParams params);

  @PATCH('parents/{id}')
  Future<BaseApiModel<ParentItemModel>> updateParent(
      @Path('id') int id, @Body() SaveParentParams params);

  @DELETE('parents/{id}')
  Future<void> deleteParent(@Path('id') int id);

  // ─── المعلمون ───────────────────────────────────────────────────────────────
  @GET('teachers')
  Future<BaseApiModel<List<TeacherItemModel>>> teachers(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('course_id') int? courseId,
  });

  @GET('teachers/{id}')
  Future<BaseApiModel<TeacherItemModel>> teacher(@Path('id') int id);

  @POST('teachers')
  Future<BaseApiModel<TeacherItemModel>> createTeacher(
      @Body() SaveTeacherParams params);

  @PATCH('teachers/{id}')
  Future<BaseApiModel<TeacherItemModel>> updateTeacher(
      @Path('id') int id, @Body() SaveTeacherParams params);

  @DELETE('teachers/{id}')
  Future<void> deleteTeacher(@Path('id') int id);

  // ─── الكورسات ───────────────────────────────────────────────────────────────
  @GET('courses')
  Future<BaseApiModel<List<CourseItemModel>>> courses(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('search') String? search,
    @Query('is_active') int? isActive,
  });

  @GET('courses/{id}')
  Future<BaseApiModel<CourseItemModel>> course(@Path('id') int id);

  @POST('courses')
  Future<BaseApiModel<CourseItemModel>> createCourse(
      @Body() SaveCourseParams params);

  @PATCH('courses/{id}')
  Future<BaseApiModel<CourseItemModel>> updateCourse(
      @Path('id') int id, @Body() SaveCourseParams params);

  @DELETE('courses/{id}')
  Future<void> deleteCourse(@Path('id') int id);

  @POST('courses/{id}/finish')
  Future<BaseApiModel<CourseItemModel>> finishCourse(@Path('id') int id);

  @POST('courses/{id}/reactivate')
  Future<BaseApiModel<CourseItemModel>> reactivateCourse(@Path('id') int id);

  // ─── جداول الحلقات ─────────────────────────────────────────────────────────
  @GET('groups/{groupId}/schedules')
  Future<BaseApiModel<List<GroupScheduleSlotModel>>> schedules(
      @Path('groupId') int groupId);

  @POST('groups/{groupId}/schedules')
  Future<BaseApiModel<GroupScheduleSlotModel>> createSchedule(
      @Path('groupId') int groupId, @Body() SaveScheduleParams params);

  @PATCH('groups/{groupId}/schedules/{scheduleId}')
  Future<BaseApiModel<GroupScheduleSlotModel>> updateSchedule(
    @Path('groupId') int groupId,
    @Path('scheduleId') int scheduleId,
    @Body() SaveScheduleParams params,
  );

  @DELETE('groups/{groupId}/schedules/{scheduleId}')
  Future<void> deleteSchedule(
      @Path('groupId') int groupId, @Path('scheduleId') int scheduleId);

  @GET('groups')
  Future<BaseApiModel<List<GroupItemModel>>> groups(
      @Query('page') int page, @Query('per_page') int perPage);

  @GET('students')
  Future<BaseApiModel<List<StudentListItemModel>>> students(
    @Query('page') int page,
    @Query('per_page') int perPage, {
    @Query('search') String? search,
  });

  // ─── الكتالوجات المرجعية ───────────────────────────────────────────────────
  @GET('reference/{path}')
  Future<BaseApiModel<List<RefItemModel>>> reference(
    @Path('path') String path, {
    @Query('q') String? search,
    @Query('include_inactive') int? includeInactive,
  });
}
