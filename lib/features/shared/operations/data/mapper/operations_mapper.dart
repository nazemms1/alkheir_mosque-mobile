import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/shared/operations/data/models/operations_model.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/mapper/quran_test_mapper.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/data/models/quran_test_model.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart';

extension AttendanceDaySummaryModelMapper on AttendanceDaySummaryModel? {
  AttendanceDaySummary toDomain() {
    return AttendanceDaySummary(
      id: this?.id ?? 0,
      attendanceDate: this?.attendanceDate ?? '',
      courseName: this?.courseName,
      courseId: this?.courseId,
      status: this?.status ?? '',
      notes: this?.notes,
      groupsCount: this?.groupsCount ?? 0,
      recordsCount: this?.recordsCount ?? 0,
      courseFinished: this?.courseFinished ?? false,
    );
  }
}

extension AttendanceRecordItemModelMapper on AttendanceRecordItemModel? {
  AttendanceRecordItem toDomain() {
    return AttendanceRecordItem(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId ?? 0,
      studentName: this?.studentName ?? '',
      statusName: this?.statusName ?? '',
      statusCode: this?.statusCode ?? '',
      notes: this?.notes,
    );
  }
}

extension AttendanceDayDetailModelMapper on AttendanceDayDetailModel? {
  AttendanceDayDetail toDomain() {
    return AttendanceDayDetail(
      id: this?.id ?? 0,
      attendanceDate: this?.attendanceDate ?? '',
      courseName: this?.courseName,
      status: this?.status ?? '',
      notes: this?.notes,
      courseFinished: this?.courseFinished ?? false,
      groups: [
        for (final e in this?.groups ?? const <AttendanceGroupDayModel>[])
          e.toDomain()
      ],
    );
  }
}

extension AttendanceGroupDayModelMapper on AttendanceGroupDayModel? {
  AttendanceGroupDay toDomain() {
    return AttendanceGroupDay(
      id: this?.id ?? 0,
      groupName: this?.groupName ?? '',
      status: this?.status ?? '',
      notes: this?.notes,
      records: [
        for (final e in this?.records ?? const <AttendanceRecordItemModel>[])
          e.toDomain()
      ],
    );
  }
}

extension TeacherAttendanceRecordModelMapper on TeacherAttendanceRecordModel? {
  TeacherAttendanceRecord toDomain() {
    return TeacherAttendanceRecord(
      id: this?.id ?? 0,
      teacherId: this?.teacherId,
      teacherName: this?.teacherName ?? '',
      statusId: this?.statusId,
      statusName: this?.statusName ?? '',
      statusCode: this?.statusCode ?? '',
      notes: this?.notes,
    );
  }
}

extension TeacherAttendanceDayModelMapper on TeacherAttendanceDayModel? {
  TeacherAttendanceDay toDomain() {
    return TeacherAttendanceDay(
      id: this?.id ?? 0,
      attendanceDate: this?.attendanceDate ?? '',
      courseName: this?.courseName,
      courseId: this?.courseId,
      status: this?.status ?? '',
      notes: this?.notes,
      recordsCount: this?.recordsCount ?? 0,
      records: [
        for (final e in this?.records ?? const <TeacherAttendanceRecordModel>[])
          e.toDomain()
      ],
    );
  }
}

extension MemorizationEntryModelMapper on MemorizationEntryModel? {
  MemorizationEntry toDomain() {
    return MemorizationEntry(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId ?? 0,
      entryType: this?.entryType ?? '',
      fromPage: this?.fromPage ?? 0,
      toPage: this?.toPage ?? 0,
      pagesCount: this?.pagesCount ?? 0,
      recordedOn: this?.recordedOn ?? '',
      notes: this?.notes,
      student: (this?.student).toDomain(),
      groupName: this?.groupName,
      courseName: this?.courseName,
      teacher: (this?.teacher).toDomain(),
    );
  }
}

extension AwqafTestModelMapper on AwqafTestModel? {
  AwqafTest toDomain() {
    return AwqafTest(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId ?? 0,
      attemptNo: this?.attemptNo ?? 0,
      status: this?.status ?? '',
      score: this?.score,
      testedOn: this?.testedOn ?? '',
      notes: this?.notes,
      typeName: this?.typeName,
      student: (this?.student).toDomain(),
      groupName: this?.groupName,
      teacher: (this?.teacher).toDomain(),
      juz: _awqafJuz(this?.juz),
    );
  }
}

extension PointEntryModelMapper on PointEntryModel? {
  PointEntry toDomain() {
    return PointEntry(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId ?? 0,
      points: this?.points ?? 0,
      pointTypeName: this?.pointTypeName,
      pointTypeId: this?.pointTypeId,
      enteredAt: this?.enteredAt ?? '',
      effectiveState: this?.effectiveState ?? '',
      voidedAt: this?.voidedAt,
      voidReason: this?.voidReason,
      notes: this?.notes,
      sourceType: this?.sourceType ?? '',
      student: (this?.student).toDomain(),
      groupName: this?.groupName,
    );
  }
}

extension AssessmentSummaryModelMapper on AssessmentSummaryModel? {
  AssessmentSummary toDomain() {
    return AssessmentSummary(
      id: this?.id ?? 0,
      title: this?.title ?? '',
      typeName: this?.typeName,
      groupName: this?.groupName,
      courseName: this?.courseName,
      scheduledAt: this?.scheduledAt,
      dueAt: this?.dueAt,
      totalMark: this?.totalMark,
      passMark: this?.passMark,
      isActive: this?.isActive ?? false,
      resultsCount: this?.resultsCount ?? 0,
    );
  }
}

extension AssessmentResultItemModelMapper on AssessmentResultItemModel? {
  AssessmentResultItem toDomain() {
    return AssessmentResultItem(
      id: this?.id ?? 0,
      enrollmentId: this?.enrollmentId ?? 0,
      studentId: this?.studentId,
      studentName: this?.studentName ?? '',
      attemptNo: this?.attemptNo ?? 0,
      score: this?.score,
      status: this?.status ?? '',
      notes: this?.notes,
      teacherName: this?.teacherName,
    );
  }
}

extension AssessmentDetailModelMapper on AssessmentDetailModel? {
  AssessmentDetail toDomain() {
    return AssessmentDetail(
      summary: (this?.summary).toDomain(),
      description: this?.description,
      groups: [
        for (final e in this?.groups ?? const <NamedRefModel>[])
          if (e.toDomain() case final v?) v
      ],
      results: [
        for (final e in this?.results ?? const <AssessmentResultItemModel>[])
          e.toDomain()
      ],
    );
  }
}

extension StudentNoteItemModelMapper on StudentNoteItemModel? {
  StudentNoteItem toDomain() {
    return StudentNoteItem(
      id: this?.id ?? 0,
      body: this?.body ?? '',
      notedAt: this?.notedAt ?? '',
      source: this?.source ?? '',
      visibility: this?.visibility ?? '',
      enrollmentId: this?.enrollmentId,
      groupName: this?.groupName,
      student: (this?.student).toDomain(),
      author: (this?.author).toDomain(),
    );
  }
}

extension CurriculumResourceModelMapper on CurriculumResourceModel? {
  CurriculumResource toDomain() {
    return CurriculumResource(
      id: this?.id ?? 0,
      bookName: this?.bookName ?? '',
      author: this?.author,
      publisher: this?.publisher,
      editionNumber: this?.editionNumber,
      publishedOn: this?.publishedOn,
      downloadable: this?.downloadable ?? false,
    );
  }
}

extension CurriculumSummaryModelMapper on CurriculumSummaryModel? {
  CurriculumSummary toDomain() {
    return CurriculumSummary(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      isActive: this?.isActive ?? false,
      courseName: this?.courseName,
      gradeLevelName: this?.gradeLevelName,
      groupsCount: this?.groupsCount ?? 0,
      subjectsCount: this?.subjectsCount ?? 0,
    );
  }
}

extension CurriculumLessonModelMapper on CurriculumLessonModel? {
  CurriculumLesson toDomain() {
    return CurriculumLesson(
      id: this?.id ?? 0,
      chapterNumber: this?.chapterNumber,
      name: this?.name ?? '',
      importance: this?.importance ?? '',
      pageCount: this?.pageCount,
      topics: [
        for (final e in this?.topics ?? const <NamedRefModel>[])
          if (e.toDomain() case final v?) v
      ],
      resource: this?.resource?.toDomain(),
    );
  }
}

extension CurriculumSubjectModelMapper on CurriculumSubjectModel? {
  CurriculumSubject toDomain() {
    return CurriculumSubject(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      lessons: [
        for (final e in this?.lessons ?? const <CurriculumLessonModel>[])
          e.toDomain()
      ],
    );
  }
}

extension CurriculumDetailModelMapper on CurriculumDetailModel? {
  CurriculumDetail toDomain() {
    return CurriculumDetail(
      summary: (this?.summary).toDomain(),
      standaloneResources: [
        for (final e
            in this?.standaloneResources ?? const <CurriculumResourceModel>[])
          e.toDomain()
      ],
      subjects: [
        for (final e in this?.subjects ?? const <CurriculumSubjectModel>[])
          e.toDomain()
      ],
    );
  }
}

extension GroupCurriculumLessonModelMapper on GroupCurriculumLessonModel? {
  GroupCurriculumLesson toDomain() {
    return GroupCurriculumLesson(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      status: this?.status ?? '',
      taughtOn: this?.taughtOn,
      teacher: this?.teacher,
      pageCount: this?.pageCount,
    );
  }
}

extension GroupCurriculumSubjectModelMapper on GroupCurriculumSubjectModel? {
  GroupCurriculumSubject toDomain() {
    return GroupCurriculumSubject(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      percentage: this?.percentage ?? 0.0,
      lessons: [
        for (final e in this?.lessons ?? const <GroupCurriculumLessonModel>[])
          e.toDomain()
      ],
    );
  }
}

extension GroupCurriculumModelMapper on GroupCurriculumModel? {
  GroupCurriculum toDomain() {
    return GroupCurriculum(
      curriculumName: this?.curriculumName,
      groupName: this?.groupName ?? '',
      percentage: this?.percentage ?? 0.0,
      total: this?.total ?? 0,
      completed: this?.completed ?? 0.0,
      subjects: [
        for (final e in this?.subjects ?? const <GroupCurriculumSubjectModel>[])
          e.toDomain()
      ],
    );
  }
}

/// الجزء يُعرض برقمه («Juz 5») لا باسمه كما في الموقع.
NamedRef? _awqafJuz(Map<String, dynamic>? juz) => juz == null
    ? null
    : NamedRef(
        id: jsonInt(juz['id']),
        name: 'Juz ${jsonInt(juz['juz_number'])}',
      );
