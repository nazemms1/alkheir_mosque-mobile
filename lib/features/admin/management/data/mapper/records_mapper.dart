import 'package:alkheir_mosque/features/admin/management/data/models/records_model.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';

extension StudentRecordModelMapper on StudentRecordModel? {
  StudentRecord toDomain() {
    return StudentRecord(
      id: this?.id ?? 0,
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      studentNumber: this?.studentNumber,
      birthDate: this?.birthDate,
      gender: this?.gender,
      status: this?.status ?? '',
      parentId: this?.parentId,
      parentName: this?.parentName,
      gradeLevelId: this?.gradeLevelId,
      gradeLevelName: this?.gradeLevelName,
      joinedAt: this?.joinedAt,
      notes: this?.notes,
      quranCurrentJuzId: this?.quranCurrentJuzId,
      quranCurrentJuz: this?.quranCurrentJuz,
      schoolName: this?.schoolName,
      hasPhoto: this?.hasPhoto ?? false,
    );
  }
}

extension EnrollmentRecordModelMapper on EnrollmentRecordModel? {
  EnrollmentRecord toDomain() {
    return EnrollmentRecord(
      id: this?.id ?? 0,
      status: this?.status ?? '',
      enrolledAt: this?.enrolledAt,
      leftAt: this?.leftAt,
      notes: this?.notes,
      finalPoints: this?.finalPoints ?? 0,
      memorizedPages: this?.memorizedPages ?? 0,
      groupId: this?.groupId ?? 0,
      groupName: this?.groupName,
      courseName: this?.courseName,
      studentId: this?.studentId ?? 0,
      studentName: this?.studentName ?? '',
      parentName: this?.parentName,
    );
  }
}

extension GroupRecordModelMapper on GroupRecordModel? {
  GroupRecord toDomain() {
    return GroupRecord(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      academicYearId: this?.academicYearId,
      courseId: this?.courseId,
      teacherId: this?.teacherId,
      assistantTeacherId: this?.assistantTeacherId,
      gradeLevelId: this?.gradeLevelId,
      capacity: this?.capacity ?? 0,
      monthlyFee: this?.monthlyFee ?? 0.0,
      startsOn: this?.startsOn,
      endsOn: this?.endsOn,
      isActive: this?.isActive ?? false,
    );
  }
}
