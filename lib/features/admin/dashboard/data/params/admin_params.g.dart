// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateGroupParamsImpl _$$CreateGroupParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateGroupParamsImpl(
      name: json['name'] as String?,
      academicYearId: (json['academic_year_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      assistantTeacherId: (json['assistant_teacher_id'] as num?)?.toInt(),
      gradeLevelId: (json['grade_level_id'] as num?)?.toInt(),
      capacity: (json['capacity'] as num?)?.toInt(),
      monthlyFee: (json['monthly_fee'] as num?)?.toInt(),
      startsOn: json['starts_on'] as String?,
      endsOn: json['ends_on'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$CreateGroupParamsImplToJson(
        _$CreateGroupParamsImpl instance) =>
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

_$OpenStudentAttendanceDayParamsImpl
    _$$OpenStudentAttendanceDayParamsImplFromJson(Map<String, dynamic> json) =>
        _$OpenStudentAttendanceDayParamsImpl(
          groupId: (json['group_id'] as num?)?.toInt(),
          attendanceDate: json['attendance_date'] as String?,
        );

Map<String, dynamic> _$$OpenStudentAttendanceDayParamsImplToJson(
        _$OpenStudentAttendanceDayParamsImpl instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      'attendance_date': instance.attendanceDate,
    };

_$QuickScanStudentAttendanceParamsImpl
    _$$QuickScanStudentAttendanceParamsImplFromJson(
            Map<String, dynamic> json) =>
        _$QuickScanStudentAttendanceParamsImpl(
          scanValue: json['scan_value'] as String?,
          attendanceStatusId: (json['attendance_status_id'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$QuickScanStudentAttendanceParamsImplToJson(
        _$QuickScanStudentAttendanceParamsImpl instance) =>
    <String, dynamic>{
      'scan_value': instance.scanValue,
      'attendance_status_id': instance.attendanceStatusId,
    };

_$RecordGroupAttendanceParamsImpl _$$RecordGroupAttendanceParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordGroupAttendanceParamsImpl(
      attendanceDate: json['attendance_date'] as String?,
      notes: json['notes'] as String?,
      records: json['records'],
    );

Map<String, dynamic> _$$RecordGroupAttendanceParamsImplToJson(
        _$RecordGroupAttendanceParamsImpl instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate,
      'notes': instance.notes,
      'records': instance.records,
    };

_$RecordMemorizationParamsImpl _$$RecordMemorizationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordMemorizationParamsImpl(
      entryType: json['entry_type'] as String?,
      fromPage: (json['from_page'] as num?)?.toInt(),
      toPage: (json['to_page'] as num?)?.toInt(),
      recordedOn: json['recorded_on'] as String?,
      teacherId: json['teacher_id'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$RecordMemorizationParamsImplToJson(
        _$RecordMemorizationParamsImpl instance) =>
    <String, dynamic>{
      'entry_type': instance.entryType,
      'from_page': instance.fromPage,
      'to_page': instance.toPage,
      'recorded_on': instance.recordedOn,
      'teacher_id': instance.teacherId,
      'notes': instance.notes,
    };

_$ScanStudentAttendanceParamsImpl _$$ScanStudentAttendanceParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ScanStudentAttendanceParamsImpl(
      scanValue: json['scan_value'] as String?,
      attendanceStatusId: (json['attendance_status_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ScanStudentAttendanceParamsImplToJson(
        _$ScanStudentAttendanceParamsImpl instance) =>
    <String, dynamic>{
      'scan_value': instance.scanValue,
      'attendance_status_id': instance.attendanceStatusId,
    };

_$UpdateGroupParamsImpl _$$UpdateGroupParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateGroupParamsImpl(
      name: json['name'] as String?,
      academicYearId: (json['academic_year_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      teacherId: (json['teacher_id'] as num?)?.toInt(),
      assistantTeacherId: (json['assistant_teacher_id'] as num?)?.toInt(),
      gradeLevelId: (json['grade_level_id'] as num?)?.toInt(),
      capacity: (json['capacity'] as num?)?.toInt(),
      monthlyFee: (json['monthly_fee'] as num?)?.toInt(),
      startsOn: json['starts_on'] as String?,
      endsOn: json['ends_on'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$UpdateGroupParamsImplToJson(
        _$UpdateGroupParamsImpl instance) =>
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
