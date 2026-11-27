// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaveCourseParamsImpl _$$SaveCourseParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveCourseParamsImpl(
      name: json['name'] as String?,
      academicYearId: (json['academic_year_id'] as num?)?.toInt(),
      startsOn: json['starts_on'] as String?,
      endsOn: json['ends_on'] as String?,
      description: json['description'] as String?,
      awardsPoints: json['awards_points'] as bool?,
      isDefault: json['is_default'] as bool?,
    );

Map<String, dynamic> _$$SaveCourseParamsImplToJson(
        _$SaveCourseParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_year_id': instance.academicYearId,
      'starts_on': instance.startsOn,
      'ends_on': instance.endsOn,
      'description': instance.description,
      'awards_points': instance.awardsPoints,
      'is_default': instance.isDefault,
    };

_$SaveParentParamsImpl _$$SaveParentParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveParentParamsImpl(
      fatherName: json['father_name'] as String?,
      fatherWork: json['father_work'] as String?,
      fatherPhone: json['father_phone'] as String?,
      motherName: json['mother_name'] as String?,
      motherPhone: json['mother_phone'] as String?,
      homePhone: json['home_phone'] as String?,
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$SaveParentParamsImplToJson(
        _$SaveParentParamsImpl instance) =>
    <String, dynamic>{
      'father_name': instance.fatherName,
      'father_work': instance.fatherWork,
      'father_phone': instance.fatherPhone,
      'mother_name': instance.motherName,
      'mother_phone': instance.motherPhone,
      'home_phone': instance.homePhone,
      'address': instance.address,
      'notes': instance.notes,
      'is_active': instance.isActive,
    };

_$SaveScheduleParamsImpl _$$SaveScheduleParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveScheduleParamsImpl(
      dayOfWeek: (json['day_of_week'] as num?)?.toInt(),
      timeSlot: json['time_slot'] as String?,
    );

Map<String, dynamic> _$$SaveScheduleParamsImplToJson(
        _$SaveScheduleParamsImpl instance) =>
    <String, dynamic>{
      'day_of_week': instance.dayOfWeek,
      'time_slot': instance.timeSlot,
    };

_$SaveTeacherParamsImpl _$$SaveTeacherParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SaveTeacherParamsImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      courseId: (json['course_id'] as num?)?.toInt(),
      teacherJobTitleId: (json['teacher_job_title_id'] as num?)?.toInt(),
      hiredAt: json['hired_at'] as String?,
      isHelping: json['is_helping'] as bool?,
      notes: json['notes'] as String?,
      accountUsername: json['account_username'] as String?,
      accountPassword: json['account_password'],
      accountIsActive: json['account_is_active'] as bool?,
    );

Map<String, dynamic> _$$SaveTeacherParamsImplToJson(
        _$SaveTeacherParamsImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'course_id': instance.courseId,
      'teacher_job_title_id': instance.teacherJobTitleId,
      'hired_at': instance.hiredAt,
      'is_helping': instance.isHelping,
      'notes': instance.notes,
      'account_username': instance.accountUsername,
      if (instance.accountPassword case final value?) 'account_password': value,
      'account_is_active': instance.accountIsActive,
    };
