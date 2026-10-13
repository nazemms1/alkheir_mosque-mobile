import 'json_helpers.dart';

/// عنصر حلقة في قوائم الاختيار (الجداول).
class GroupItem {
  final int id;
  final String name;
  final String? courseName;
  final String? teacherName;
  final bool isActive;
  final int enrollmentsCount;

  const GroupItem({
    required this.id,
    required this.name,
    required this.courseName,
    required this.teacherName,
    required this.isActive,
    required this.enrollmentsCount,
  });

  factory GroupItem.fromJson(Map<String, dynamic> json) {
    return GroupItem(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      courseName: jsonStringOrNull(json['course']),
      teacherName: jsonStringOrNull(json['teacher']),
      isActive: jsonBool(json['is_active']),
      enrollmentsCount: jsonInt(json['enrollments_count']),
    );
  }
}

/// عنصر طالب في قوائم الاختيار (تقدّم الطالب، اختبارات القرآن).
class StudentListItem {
  final int id;
  final String firstName;
  final String lastName;
  final String? studentNumber;
  final String status;
  final String? parentName;
  final String? gradeLevel;

  const StudentListItem({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.studentNumber,
    required this.status,
    required this.parentName,
    required this.gradeLevel,
  });

  factory StudentListItem.fromJson(Map<String, dynamic> json) {
    return StudentListItem(
      id: jsonInt(json['id']),
      firstName: jsonString(json['first_name']),
      lastName: jsonString(json['last_name']),
      studentNumber: jsonStringOrNull(json['student_number']),
      status: jsonString(json['status']),
      parentName: jsonStringOrNull(json['parent']),
      gradeLevel: jsonStringOrNull(json['grade_level']),
    );
  }

  String get fullName => '$firstName $lastName'.trim();
}
