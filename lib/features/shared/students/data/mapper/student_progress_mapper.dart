import 'package:alkheir_mosque/features/shared/quran_tests/data/mapper/quran_test_mapper.dart';
import 'package:alkheir_mosque/features/shared/students/data/models/student_progress_model.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_progress_entity.dart';

extension StudentProfileInfoModelMapper on StudentProfileInfoModel? {
  StudentProfileInfo toDomain() {
    return StudentProfileInfo(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      studentNumber: this?.studentNumber,
      status: this?.status ?? '',
      birthDate: this?.birthDate,
      gradeLevel: (this?.gradeLevel).toDomain(),
      parent: (this?.parent).toDomain(),
      quranCurrentJuz: this?.quranCurrentJuz,
      hasPhoto: this?.hasPhoto ?? false,
    );
  }
}

extension StudentEnrollmentInfoModelMapper on StudentEnrollmentInfoModel? {
  StudentEnrollmentInfo toDomain() {
    return StudentEnrollmentInfo(
      id: this?.id ?? 0,
      status: this?.status ?? '',
      enrolledAt: this?.enrolledAt,
      leftAt: this?.leftAt,
      group: (this?.group).toDomain(),
      course: (this?.course).toDomain(),
      teacher: (this?.teacher).toDomain(),
    );
  }
}

extension StudentProgressStatsModelMapper on StudentProgressStatsModel? {
  StudentProgressStats toDomain() {
    return StudentProgressStats(
      assessmentAverage: this?.assessmentAverage,
      attendanceDays: this?.attendanceDays,
      files: this?.files,
      memorizedPages: this?.memorizedPages ?? 0,
      notes: this?.notes,
      passedFinalTests: this?.passedFinalTests,
      passedPartialTests: this?.passedPartialTests,
      points: this?.points,
    );
  }
}

extension StudentProgressModelMapper on StudentProgressModel? {
  StudentProgress toDomain() {
    return StudentProgress(
      profile: (this?.profile).toDomain(),
      enrollments: [
        for (final e
            in this?.enrollments ?? const <StudentEnrollmentInfoModel>[])
          e.toDomain()
      ],
      stats: (this?.stats).toDomain(),
    );
  }
}

extension StudentFileItemModelMapper on StudentFileItemModel? {
  StudentFileItem toDomain() {
    return StudentFileItem(
      id: this?.id ?? 0,
      fileType: this?.fileType ?? '',
      originalName: this?.originalName ?? '',
      uploadedAt: this?.uploadedAt,
      uploadedByName: this?.uploadedByName,
    );
  }
}
