import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart'
    show NamedRef;

/// ملف تقدّم الطالب ومرفقاته — مطابقة لـ `StudentProgressFilesController`.

class StudentProfileInfo {
  final int id;
  final String name;
  final String? studentNumber;
  final String status;
  final String? birthDate;
  final NamedRef? gradeLevel;
  final NamedRef? parent;
  final int? quranCurrentJuz;
  final bool hasPhoto;

  const StudentProfileInfo({
    required this.id,
    required this.name,
    required this.studentNumber,
    required this.status,
    required this.birthDate,
    required this.gradeLevel,
    required this.parent,
    required this.quranCurrentJuz,
    required this.hasPhoto,
  });
}

class StudentEnrollmentInfo {
  final int id;
  final String status;
  final String? enrolledAt;
  final String? leftAt;
  final NamedRef? group;
  final NamedRef? course;
  final NamedRef? teacher;

  const StudentEnrollmentInfo({
    required this.id,
    required this.status,
    required this.enrolledAt,
    required this.leftAt,
    required this.group,
    required this.course,
    required this.teacher,
  });

  bool get isActive => status == 'active';
}

/// إحصاءات التقدم — `null` تعني أن المستخدم لا يملك صلاحية الوحدة المقابلة.
class StudentProgressStats {
  final double? assessmentAverage;
  final int? attendanceDays;
  final int? files;
  final int memorizedPages;
  final int? notes;
  final int? passedFinalTests;
  final int? passedPartialTests;
  final int? points;

  const StudentProgressStats({
    required this.assessmentAverage,
    required this.attendanceDays,
    required this.files,
    required this.memorizedPages,
    required this.notes,
    required this.passedFinalTests,
    required this.passedPartialTests,
    required this.points,
  });
}

class StudentProgress {
  final StudentProfileInfo profile;
  final List<StudentEnrollmentInfo> enrollments;
  final StudentProgressStats stats;

  const StudentProgress({
    required this.profile,
    required this.enrollments,
    required this.stats,
  });
}

class StudentFileItem {
  final int id;
  final String fileType;
  final String originalName;
  final String? uploadedAt;
  final String? uploadedByName;

  const StudentFileItem({
    required this.id,
    required this.fileType,
    required this.originalName,
    required this.uploadedAt,
    required this.uploadedByName,
  });
}
