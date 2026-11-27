// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupItemModelImpl _$$GroupItemModelImplFromJson(Map<String, dynamic> json) =>
    _$GroupItemModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      courseName: jsonStringLenient(json['course']),
      teacherName: jsonStringLenient(json['teacher']),
      isActive: jsonBoolLenient(json['is_active']),
      enrollmentsCount: jsonIntLenient(json['enrollments_count']),
    );

_$StudentListItemModelImpl _$$StudentListItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentListItemModelImpl(
      id: jsonIntLenient(json['id']),
      firstName: jsonStringValue(json['first_name']),
      lastName: jsonStringValue(json['last_name']),
      studentNumber: jsonStringLenient(json['student_number']),
      status: jsonStringValue(json['status']),
      parentName: jsonStringLenient(json['parent']),
      gradeLevel: jsonStringLenient(json['grade_level']),
    );
