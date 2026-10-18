import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/quran_tests/data/models/quran_test_model.dart' show NamedRef;

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

  factory StudentProfileInfo.fromJson(Map<String, dynamic> json) {
    return StudentProfileInfo(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      studentNumber: jsonStringOrNull(json['student_number']),
      status: jsonString(json['status']),
      birthDate: jsonStringOrNull(json['birth_date']),
      gradeLevel: NamedRef.fromJson(json['grade_level']),
      parent: NamedRef.fromJson(json['parent']),
      quranCurrentJuz: jsonIntOrNull(json['quran_current_juz']),
      hasPhoto: jsonStringOrNull(json['photo_endpoint']) != null,
    );
  }
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

  factory StudentEnrollmentInfo.fromJson(Map<String, dynamic> json) {
    return StudentEnrollmentInfo(
      id: jsonInt(json['id']),
      status: jsonString(json['status']),
      enrolledAt: jsonStringOrNull(json['enrolled_at']),
      leftAt: jsonStringOrNull(json['left_at']),
      group: NamedRef.fromJson(json['group']),
      course: NamedRef.fromJson(json['course']),
      teacher: NamedRef.fromJson(json['teacher']),
    );
  }

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

  factory StudentProgressStats.fromJson(Map<String, dynamic> json) {
    return StudentProgressStats(
      assessmentAverage: jsonDoubleOrNull(json['assessment_average']),
      attendanceDays: jsonIntOrNull(json['attendance_days']),
      files: jsonIntOrNull(json['files']),
      memorizedPages: jsonInt(json['memorized_pages']),
      notes: jsonIntOrNull(json['notes']),
      passedFinalTests: jsonIntOrNull(json['passed_final_tests']),
      passedPartialTests: jsonIntOrNull(json['passed_partial_tests']),
      points: jsonIntOrNull(json['points']),
    );
  }
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

  factory StudentProgress.fromJson(Map<String, dynamic> json) {
    final profile = jsonMap(json['profile']) ?? const <String, dynamic>{};
    final stats = jsonMap(json['stats']) ?? const <String, dynamic>{};
    return StudentProgress(
      profile: StudentProfileInfo.fromJson(profile),
      enrollments:
          jsonList(json['enrollments'], StudentEnrollmentInfo.fromJson),
      stats: StudentProgressStats.fromJson(stats),
    );
  }
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

  factory StudentFileItem.fromJson(Map<String, dynamic> json) {
    return StudentFileItem(
      id: jsonInt(json['id']),
      fileType: jsonString(json['file_type']),
      originalName: jsonString(json['original_name']),
      uploadedAt: jsonStringOrNull(json['uploaded_at']),
      uploadedByName: jsonStringOrNull(jsonMap(json['uploaded_by'])?['name']),
    );
  }
}
