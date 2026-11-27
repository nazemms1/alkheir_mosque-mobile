/// نماذج السجلات الأكاديمية الكاملة (طالب، تسجيل، حلقة) — لشاشات الإنشاء والتعديل.
/// الحقول تطابق استجابات `RecordsController` و`WriteRecordsController`.
library;

class StudentRecord {
  final int id;
  final String firstName;
  final String lastName;
  final String? studentNumber;
  final String? birthDate;
  final String? gender;
  final String status;
  final int? parentId;
  final String? parentName;
  final int? gradeLevelId;
  final String? gradeLevelName;
  final String? joinedAt;
  final String? notes;
  final int? quranCurrentJuzId;
  final int? quranCurrentJuz;
  final String? schoolName;
  final bool hasPhoto;

  const StudentRecord({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.studentNumber,
    required this.birthDate,
    required this.gender,
    required this.status,
    required this.parentId,
    required this.parentName,
    required this.gradeLevelId,
    required this.gradeLevelName,
    required this.joinedAt,
    required this.notes,
    required this.quranCurrentJuzId,
    required this.quranCurrentJuz,
    required this.schoolName,
    required this.hasPhoto,
  });

  String get fullName => '$firstName $lastName'.trim();
}

class EnrollmentRecord {
  final int id;
  final String status;
  final String? enrolledAt;
  final String? leftAt;
  final String? notes;
  final int finalPoints;
  final int memorizedPages;
  final int groupId;
  final String? groupName;
  final String? courseName;
  final int studentId;
  final String studentName;
  final String? parentName;

  const EnrollmentRecord({
    required this.id,
    required this.status,
    required this.enrolledAt,
    required this.leftAt,
    required this.notes,
    required this.finalPoints,
    required this.memorizedPages,
    required this.groupId,
    required this.groupName,
    required this.courseName,
    required this.studentId,
    required this.studentName,
    required this.parentName,
  });

  bool get isActive => status == 'active';
}

class GroupRecord {
  final int id;
  final String name;
  final int? academicYearId;
  final int? courseId;
  final int? teacherId;
  final int? assistantTeacherId;
  final int? gradeLevelId;
  final int capacity;
  final double monthlyFee;
  final String? startsOn;
  final String? endsOn;
  final bool isActive;

  const GroupRecord({
    required this.id,
    required this.name,
    required this.academicYearId,
    required this.courseId,
    required this.teacherId,
    required this.assistantTeacherId,
    required this.gradeLevelId,
    required this.capacity,
    required this.monthlyFee,
    required this.startsOn,
    required this.endsOn,
    required this.isActive,
  });
}
