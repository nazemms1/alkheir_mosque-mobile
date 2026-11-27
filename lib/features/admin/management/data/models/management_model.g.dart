// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParentItemModelImpl _$$ParentItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParentItemModelImpl(
      id: jsonIntLenient(json['id']),
      parentNumber: jsonStringValue(json['parent_number']),
      fatherName: jsonStringValue(json['father_name']),
      fatherWork: jsonStringLenient(json['father_work']),
      fatherPhone: jsonStringLenient(json['father_phone']),
      motherName: jsonStringLenient(json['mother_name']),
      motherPhone: jsonStringLenient(json['mother_phone']),
      homePhone: jsonStringLenient(json['home_phone']),
      address: jsonStringLenient(json['address']),
      notes: jsonStringLenient(json['notes']),
      isActive: jsonBoolLenient(json['is_active']),
      studentsCount: jsonIntLenient(json['students_count']),
    );

_$TeacherItemModelImpl _$$TeacherItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherItemModelImpl(
      id: jsonIntLenient(json['id']),
      firstName: jsonStringValue(json['first_name']),
      lastName: jsonStringValue(json['last_name']),
      phone: jsonStringValue(json['phone']),
      status: jsonStringValue(json['status']),
      isHelping: jsonBoolLenient(json['is_helping']),
      hiredAt: jsonStringLenient(json['hired_at']),
      notes: jsonStringLenient(json['notes']),
      jobTitle: jsonStringLenient(json['job_title']),
      teacherJobTitleId: jsonIntLenient(json['teacher_job_title_id']),
      courseId:
          _teacherItemCourseIdValue(_teacherItemCourseId(json, 'courseId')),
      courseName: _teacherItemCourseNameValue(
          _teacherItemCourseName(json, 'courseName')),
      assignedGroupsCount: jsonIntLenient(json['assigned_groups_count']),
      assistedGroupsCount: jsonIntLenient(json['assisted_groups_count']),
    );

_$CourseItemModelImpl _$$CourseItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseItemModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      academicYear: jsonStringLenient(json['academic_year']),
      academicYearId: jsonIntLenient(json['academic_year_id']),
      startsOn: jsonStringLenient(json['starts_on']),
      endsOn: jsonStringLenient(json['ends_on']),
      description: jsonStringLenient(json['description']),
      awardsPoints: jsonBoolLenient(json['awards_points']),
      isActive: jsonBoolLenient(json['is_active']),
      isDefault: jsonBoolLenient(json['is_default']),
      finishedAt: jsonStringLenient(json['finished_at']),
      groupsCount: jsonIntLenient(json['groups_count']),
      enrollmentsCount: jsonIntLenient(json['enrollments_count']),
    );

_$GroupScheduleSlotModelImpl _$$GroupScheduleSlotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupScheduleSlotModelImpl(
      id: jsonIntLenient(json['id']),
      dayOfWeek: jsonIntLenient(json['day_of_week']),
      timeSlot: _groupScheduleSlotTimeSlotValue(
          _groupScheduleSlotTimeSlot(json, 'timeSlot')),
      timeSlotLabel: _groupScheduleSlotTimeSlotLabelValue(
          _groupScheduleSlotTimeSlotLabel(json, 'timeSlotLabel')),
      startsAt: jsonStringValue(json['starts_at']),
      endsAt: jsonStringValue(json['ends_at']),
      isActive: jsonBoolLenient(json['is_active']),
    );

_$RefItemModelImpl _$$RefItemModelImplFromJson(Map<String, dynamic> json) =>
    _$RefItemModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      code: jsonStringLenient(json['code']),
      isActive: _refItemIsActiveValue(_refItemIsActive(json, 'isActive')),
      isCurrent: jsonBoolLenient(json['is_current']),
    );
