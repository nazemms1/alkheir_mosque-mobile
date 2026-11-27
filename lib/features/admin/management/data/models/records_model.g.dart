// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentRecordModelImpl _$$StudentRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentRecordModelImpl(
      id: jsonIntLenient(json['id']),
      firstName: jsonStringValue(json['first_name']),
      lastName: jsonStringValue(json['last_name']),
      studentNumber: jsonStringLenient(json['student_number']),
      birthDate: jsonStringLenient(json['birth_date']),
      gender: jsonStringLenient(json['gender']),
      status: _studentRecordStatusValue(_studentRecordStatus(json, 'status')),
      parentId:
          _studentRecordParentIdValue(_studentRecordParentId(json, 'parentId')),
      parentName: _studentRecordParentNameValue(
          _studentRecordParentName(json, 'parentName')),
      gradeLevelId: _studentRecordGradeLevelIdValue(
          _studentRecordGradeLevelId(json, 'gradeLevelId')),
      gradeLevelName: _studentRecordGradeLevelNameValue(
          _studentRecordGradeLevelName(json, 'gradeLevelName')),
      joinedAt: jsonStringLenient(json['joined_at']),
      notes: jsonStringLenient(json['notes']),
      quranCurrentJuzId: _studentRecordQuranCurrentJuzIdValue(
          _studentRecordQuranCurrentJuzId(json, 'quranCurrentJuzId')),
      quranCurrentJuz: _studentRecordQuranCurrentJuzValue(
          _studentRecordQuranCurrentJuz(json, 'quranCurrentJuz')),
      schoolName: jsonStringLenient(json['school_name']),
      hasPhoto:
          _studentRecordHasPhotoValue(_studentRecordHasPhoto(json, 'hasPhoto')),
    );

_$EnrollmentRecordModelImpl _$$EnrollmentRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnrollmentRecordModelImpl(
      id: jsonIntLenient(json['id']),
      status: jsonStringValue(json['status']),
      enrolledAt: jsonStringLenient(json['enrolled_at']),
      leftAt: jsonStringLenient(json['left_at']),
      notes: jsonStringLenient(json['notes']),
      finalPoints: jsonIntLenient(json['final_points']),
      memorizedPages: jsonIntLenient(json['memorized_pages']),
      groupId: _enrollmentRecordGroupIdValue(
          _enrollmentRecordGroupId(json, 'groupId')),
      groupName: _enrollmentRecordGroupNameValue(
          _enrollmentRecordGroupName(json, 'groupName')),
      courseName: _enrollmentRecordCourseNameValue(
          _enrollmentRecordCourseName(json, 'courseName')),
      studentId: _enrollmentRecordStudentIdValue(
          _enrollmentRecordStudentId(json, 'studentId')),
      studentName: _enrollmentRecordStudentNameValue(
          _enrollmentRecordStudentName(json, 'studentName')),
      parentName: _enrollmentRecordParentNameValue(
          _enrollmentRecordParentName(json, 'parentName')),
    );

_$GroupRecordModelImpl _$$GroupRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupRecordModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      academicYearId: jsonIntLenient(json['academic_year_id']),
      courseId: jsonIntLenient(json['course_id']),
      teacherId: jsonIntLenient(json['teacher_id']),
      assistantTeacherId: jsonIntLenient(json['assistant_teacher_id']),
      gradeLevelId: jsonIntLenient(json['grade_level_id']),
      capacity: jsonIntLenient(json['capacity']),
      monthlyFee: jsonDoubleLenient(json['monthly_fee']),
      startsOn: jsonStringLenient(json['starts_on']),
      endsOn: jsonStringLenient(json['ends_on']),
      isActive: jsonBoolLenient(json['is_active']),
    );
