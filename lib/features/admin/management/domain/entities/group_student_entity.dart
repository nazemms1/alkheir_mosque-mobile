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

  String get fullName => '$firstName $lastName'.trim();
}
