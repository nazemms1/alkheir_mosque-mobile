import 'json_helpers.dart';

/// نماذج السجلات الأكاديمية الكاملة (طالب، تسجيل، حلقة) — لشاشات الإنشاء والتعديل.
/// الحقول تطابق استجابات `RecordsController` و`WriteRecordsController`.

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

  factory StudentRecord.fromJson(Map<String, dynamic> json) {
    return StudentRecord(
      id: jsonInt(json['id']),
      firstName: jsonString(json['first_name']),
      lastName: jsonString(json['last_name']),
      studentNumber: jsonStringOrNull(json['student_number']),
      birthDate: jsonStringOrNull(json['birth_date']),
      gender: jsonStringOrNull(json['gender']),
      status: jsonString(json['status']),
      parentId: jsonIntOrNull(json['parent_id']),
      parentName: jsonStringOrNull(json['parent']),
      gradeLevelId: jsonIntOrNull(json['grade_level_id']),
      gradeLevelName: jsonStringOrNull(json['grade_level']),
      joinedAt: jsonStringOrNull(json['joined_at']),
      notes: jsonStringOrNull(json['notes']),
      quranCurrentJuzId: jsonIntOrNull(json['quran_current_juz_id']),
      quranCurrentJuz: jsonIntOrNull(json['quran_current_juz']),
      schoolName: jsonStringOrNull(json['school_name']),
      hasPhoto: jsonStringOrNull(json['photo_path']) != null,
    );
  }

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

  factory EnrollmentRecord.fromJson(Map<String, dynamic> json) {
    final group = jsonMap(json['group']);
    final student = jsonMap(json['student']);
    return EnrollmentRecord(
      id: jsonInt(json['id']),
      status: jsonString(json['status']),
      enrolledAt: jsonStringOrNull(json['enrolled_at']),
      leftAt: jsonStringOrNull(json['left_at']),
      notes: jsonStringOrNull(json['notes']),
      finalPoints: jsonInt(json['final_points']),
      memorizedPages: jsonInt(json['memorized_pages']),
      groupId: jsonInt(group?['id']),
      groupName: jsonStringOrNull(group?['name']),
      courseName: jsonStringOrNull(group?['course_name']),
      studentId: jsonInt(student?['id']),
      studentName: jsonString(student?['full_name']),
      parentName: jsonStringOrNull(student?['parent_name']),
    );
  }

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

  factory GroupRecord.fromJson(Map<String, dynamic> json) {
    return GroupRecord(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      academicYearId: jsonIntOrNull(json['academic_year_id']),
      courseId: jsonIntOrNull(json['course_id']),
      teacherId: jsonIntOrNull(json['teacher_id']),
      assistantTeacherId: jsonIntOrNull(json['assistant_teacher_id']),
      gradeLevelId: jsonIntOrNull(json['grade_level_id']),
      capacity: jsonInt(json['capacity']),
      monthlyFee: jsonDouble(json['monthly_fee']),
      startsOn: jsonStringOrNull(json['starts_on']),
      endsOn: jsonStringOrNull(json['ends_on']),
      isActive: jsonBool(json['is_active']),
    );
  }
}
