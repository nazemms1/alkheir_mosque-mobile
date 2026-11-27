// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddManualPointsParamsImpl _$$AddManualPointsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddManualPointsParamsImpl(
      pointTypeId: (json['point_type_id'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$AddManualPointsParamsImplToJson(
        _$AddManualPointsParamsImpl instance) =>
    <String, dynamic>{
      'point_type_id': instance.pointTypeId,
      'points': instance.points,
      if (instance.notes case final value?) 'notes': value,
    };

_$CreateStudentNoteParamsImpl _$$CreateStudentNoteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateStudentNoteParamsImpl(
      studentId: (json['student_id'] as num?)?.toInt(),
      body: json['body'] as String?,
      notedAt: json['noted_at'] as String?,
      source: json['source'] as String?,
      visibility: json['visibility'] as String?,
      enrollmentId: (json['enrollment_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CreateStudentNoteParamsImplToJson(
        _$CreateStudentNoteParamsImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'body': instance.body,
      'noted_at': instance.notedAt,
      'source': instance.source,
      'visibility': instance.visibility,
      if (instance.enrollmentId case final value?) 'enrollment_id': value,
    };

_$RecordAwqafTestParamsImpl _$$RecordAwqafTestParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordAwqafTestParamsImpl(
      juzId: (json['juz_id'] as num?)?.toInt(),
      quranTestTypeId: (json['quran_test_type_id'] as num?)?.toInt(),
      testedOn: json['tested_on'] as String?,
      status: json['status'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$RecordAwqafTestParamsImplToJson(
        _$RecordAwqafTestParamsImpl instance) =>
    <String, dynamic>{
      'juz_id': instance.juzId,
      'quran_test_type_id': instance.quranTestTypeId,
      'tested_on': instance.testedOn,
      'status': instance.status,
      if (instance.score case final value?) 'score': value,
      if (instance.teacherId case final value?) 'teacher_id': value,
      if (instance.notes case final value?) 'notes': value,
    };

_$RecordMemorizationParamsImpl _$$RecordMemorizationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordMemorizationParamsImpl(
      entryType: json['entry_type'] as String?,
      fromPage: (json['from_page'] as num?)?.toInt(),
      toPage: (json['to_page'] as num?)?.toInt(),
      recordedOn: json['recorded_on'] as String?,
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$RecordMemorizationParamsImplToJson(
        _$RecordMemorizationParamsImpl instance) =>
    <String, dynamic>{
      'entry_type': instance.entryType,
      'from_page': instance.fromPage,
      'to_page': instance.toPage,
      'recorded_on': instance.recordedOn,
      if (instance.teacherId case final value?) 'teacher_id': value,
      if (instance.notes case final value?) 'notes': value,
    };

_$RecordTeacherAttendanceParamsImpl
    _$$RecordTeacherAttendanceParamsImplFromJson(Map<String, dynamic> json) =>
        _$RecordTeacherAttendanceParamsImpl(
          attendanceDate: json['attendance_date'] as String?,
          courseId: (json['course_id'] as num?)?.toInt(),
          records: json['records'],
          notes: json['notes'] as String?,
        );

Map<String, dynamic> _$$RecordTeacherAttendanceParamsImplToJson(
        _$RecordTeacherAttendanceParamsImpl instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate,
      'course_id': instance.courseId,
      'records': instance.records,
      if (instance.notes case final value?) 'notes': value,
    };

_$SaveAssessmentResultsParamsImpl _$$SaveAssessmentResultsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveAssessmentResultsParamsImpl(
      results: json['results'],
    );

Map<String, dynamic> _$$SaveAssessmentResultsParamsImplToJson(
        _$SaveAssessmentResultsParamsImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$SaveEnrollmentParamsImpl _$$SaveEnrollmentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveEnrollmentParamsImpl(
      studentId: (json['student_id'] as num?)?.toInt(),
      groupId: (json['group_id'] as num?)?.toInt(),
      enrolledAt: json['enrolled_at'] as String?,
      status: json['status'] as String?,
      leftAt: json['left_at'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SaveEnrollmentParamsImplToJson(
        _$SaveEnrollmentParamsImpl instance) =>
    <String, dynamic>{
      'student_id': instance.studentId,
      'group_id': instance.groupId,
      'enrolled_at': instance.enrolledAt,
      'status': instance.status,
      'left_at': instance.leftAt,
      'notes': instance.notes,
    };

_$SaveGroupParamsImpl _$$SaveGroupParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveGroupParamsImpl(
      name: json['name'] as String?,
      academicYearId: (json['academic_year_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      assistantTeacherId: (json['assistant_teacher_id'] as num?)?.toInt(),
      gradeLevelId: (json['grade_level_id'] as num?)?.toInt(),
      capacity: json['capacity'],
      monthlyFee: (json['monthly_fee'] as num?)?.toDouble(),
      startsOn: json['starts_on'] as String?,
      endsOn: json['ends_on'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$SaveGroupParamsImplToJson(
        _$SaveGroupParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_year_id': instance.academicYearId,
      'course_id': instance.courseId,
      'teacher_id': instance.teacherId,
      'assistant_teacher_id': instance.assistantTeacherId,
      'grade_level_id': instance.gradeLevelId,
      'capacity': instance.capacity,
      'monthly_fee': instance.monthlyFee,
      'starts_on': instance.startsOn,
      'ends_on': instance.endsOn,
      'is_active': instance.isActive,
    };

_$SaveStudentParamsImpl _$$SaveStudentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveStudentParamsImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      birthDate: json['birth_date'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      status: json['status'] as String?,
      gradeLevelId: (json['grade_level_id'] as num?)?.toInt(),
      joinedAt: json['joined_at'] as String?,
      quranCurrentJuzId: (json['quran_current_juz_id'] as num?)?.toInt(),
      schoolName: json['school_name'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$SaveStudentParamsImplToJson(
        _$SaveStudentParamsImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'parent_id': instance.parentId,
      'gender': instance.gender,
      'status': instance.status,
      'grade_level_id': instance.gradeLevelId,
      'joined_at': instance.joinedAt,
      'quran_current_juz_id': instance.quranCurrentJuzId,
      'school_name': instance.schoolName,
      'notes': instance.notes,
    };

_$SetStudentAttendanceDayStatusParamsImpl
    _$$SetStudentAttendanceDayStatusParamsImplFromJson(
            Map<String, dynamic> json) =>
        _$SetStudentAttendanceDayStatusParamsImpl(
          status: json['status'] as String?,
        );

Map<String, dynamic> _$$SetStudentAttendanceDayStatusParamsImplToJson(
        _$SetStudentAttendanceDayStatusParamsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

_$TakeGroupAttendanceParamsImpl _$$TakeGroupAttendanceParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$TakeGroupAttendanceParamsImpl(
      attendanceDate: json['attendance_date'] as String?,
      records: json['records'],
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$TakeGroupAttendanceParamsImplToJson(
        _$TakeGroupAttendanceParamsImpl instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate,
      'records': instance.records,
      if (instance.notes case final value?) 'notes': value,
    };

_$UpdateLessonTaughtParamsImpl _$$UpdateLessonTaughtParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateLessonTaughtParamsImpl(
      status: json['status'] as String?,
      isTaught: json['is_taught'] as bool?,
    );

Map<String, dynamic> _$$UpdateLessonTaughtParamsImplToJson(
        _$UpdateLessonTaughtParamsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'is_taught': instance.isTaught,
    };

_$UpdateStudentNoteParamsImpl _$$UpdateStudentNoteParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateStudentNoteParamsImpl(
      body: json['body'] as String?,
      notedAt: json['noted_at'] as String?,
      source: json['source'] as String?,
      visibility: json['visibility'] as String?,
    );

Map<String, dynamic> _$$UpdateStudentNoteParamsImplToJson(
        _$UpdateStudentNoteParamsImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'noted_at': instance.notedAt,
      'source': instance.source,
      'visibility': instance.visibility,
    };

_$PatchLessonTaughtParamsImpl _$$PatchLessonTaughtParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchLessonTaughtParamsImpl(
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PatchLessonTaughtParamsImplToJson(
        _$PatchLessonTaughtParamsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
