import 'package:alkheir_mosque/features/shared/quran_tests/domain/entities/quran_test_entity.dart'
    show NamedRef;

/// نماذج العمليات اليومية: الحضور، الحفظ، اختبارات الأوقاف، النقاط،
/// التقييمات، الملاحظات، والمناهج — مطابقة لاستجابات الباك إند.

class AttendanceDaySummary {
  final int id;
  final String attendanceDate;
  final String? courseName;
  final int? courseId;
  final String status;
  final String? notes;
  final int groupsCount;
  final int recordsCount;
  final bool courseFinished;

  const AttendanceDaySummary({
    required this.id,
    required this.attendanceDate,
    required this.courseName,
    this.courseId,
    required this.status,
    required this.notes,
    required this.groupsCount,
    required this.recordsCount,
    required this.courseFinished,
  });
}

class AttendanceRecordItem {
  final int id;
  final int enrollmentId;
  final String studentName;
  final String statusName;
  final String statusCode;
  final String? notes;

  const AttendanceRecordItem({
    required this.id,
    required this.enrollmentId,
    required this.studentName,
    required this.statusName,
    required this.statusCode,
    required this.notes,
  });
}

/// تفاصيل يوم حضور الطلاب: كل حلقة ويومها وسجلات طلابها.
class AttendanceDayDetail {
  final int id;
  final String attendanceDate;
  final String? courseName;
  final String status;
  final String? notes;
  final bool courseFinished;
  final List<AttendanceGroupDay> groups;

  const AttendanceDayDetail({
    required this.id,
    required this.attendanceDate,
    required this.courseName,
    required this.status,
    required this.notes,
    required this.courseFinished,
    required this.groups,
  });
}

class AttendanceGroupDay {
  final int id;
  final String groupName;
  final String status;
  final String? notes;
  final List<AttendanceRecordItem> records;

  const AttendanceGroupDay({
    required this.id,
    required this.groupName,
    required this.status,
    required this.notes,
    required this.records,
  });
}

class TeacherAttendanceRecord {
  final int id;
  final int? teacherId;
  final String teacherName;
  final int? statusId;
  final String statusName;
  final String statusCode;
  final String? notes;

  const TeacherAttendanceRecord({
    required this.id,
    this.teacherId,
    required this.teacherName,
    this.statusId,
    required this.statusName,
    required this.statusCode,
    required this.notes,
  });
}

class TeacherAttendanceDay {
  final int id;
  final String attendanceDate;
  final String? courseName;
  final int? courseId;
  final String status;
  final String? notes;
  final int recordsCount;
  final List<TeacherAttendanceRecord> records;

  const TeacherAttendanceDay({
    required this.id,
    required this.attendanceDate,
    required this.courseName,
    this.courseId,
    required this.status,
    required this.notes,
    required this.recordsCount,
    required this.records,
  });
}

class MemorizationEntry {
  final int id;
  final int enrollmentId;
  final String entryType;
  final int fromPage;
  final int toPage;
  final int pagesCount;
  final String recordedOn;
  final String? notes;
  final NamedRef? student;
  final String? groupName;
  final String? courseName;
  final NamedRef? teacher;

  const MemorizationEntry({
    required this.id,
    required this.enrollmentId,
    required this.entryType,
    required this.fromPage,
    required this.toPage,
    required this.pagesCount,
    required this.recordedOn,
    required this.notes,
    required this.student,
    required this.groupName,
    required this.courseName,
    required this.teacher,
  });
}

class AwqafTest {
  final int id;
  final int enrollmentId;
  final int attemptNo;
  final String status;
  final double? score;
  final String testedOn;
  final String? notes;
  final NamedRef? juz;
  final String? typeName;
  final NamedRef? student;
  final String? groupName;
  final NamedRef? teacher;

  const AwqafTest({
    required this.id,
    required this.enrollmentId,
    required this.attemptNo,
    required this.status,
    required this.score,
    required this.testedOn,
    required this.notes,
    required this.juz,
    required this.typeName,
    required this.student,
    required this.groupName,
    required this.teacher,
  });
}

class PointEntry {
  final int id;
  final int enrollmentId;
  final int points;
  final String? pointTypeName;
  final int? pointTypeId;
  final String enteredAt;
  final String effectiveState;
  final String? voidedAt;
  final String? voidReason;
  final String? notes;
  final String sourceType;
  final NamedRef? student;
  final String? groupName;

  const PointEntry({
    required this.id,
    required this.enrollmentId,
    required this.points,
    required this.pointTypeName,
    required this.pointTypeId,
    required this.enteredAt,
    required this.effectiveState,
    required this.voidedAt,
    required this.voidReason,
    required this.notes,
    required this.sourceType,
    required this.student,
    required this.groupName,
  });

  bool get isVoided => voidedAt != null;
}

class AssessmentSummary {
  final int id;
  final String title;
  final String? typeName;
  final String? groupName;
  final String? courseName;
  final String? scheduledAt;
  final String? dueAt;
  final double? totalMark;
  final double? passMark;
  final bool isActive;
  final int resultsCount;

  const AssessmentSummary({
    required this.id,
    required this.title,
    required this.typeName,
    required this.groupName,
    required this.courseName,
    required this.scheduledAt,
    required this.dueAt,
    required this.totalMark,
    required this.passMark,
    required this.isActive,
    required this.resultsCount,
  });
}

class AssessmentResultItem {
  final int id;
  final int enrollmentId;
  final int? studentId;
  final String studentName;
  final int attemptNo;
  final double? score;
  final String status;
  final String? notes;
  final String? teacherName;

  const AssessmentResultItem({
    required this.id,
    required this.enrollmentId,
    required this.studentId,
    required this.studentName,
    required this.attemptNo,
    required this.score,
    required this.status,
    required this.notes,
    required this.teacherName,
  });
}

class AssessmentDetail {
  final AssessmentSummary summary;
  final String? description;
  final List<NamedRef> groups;
  final List<AssessmentResultItem> results;

  const AssessmentDetail({
    required this.summary,
    required this.description,
    required this.groups,
    required this.results,
  });
}

class StudentNoteItem {
  final int id;
  final String body;
  final String notedAt;
  final String source;
  final String visibility;
  final int? enrollmentId;
  final String? groupName;
  final NamedRef? student;
  final NamedRef? author;

  const StudentNoteItem({
    required this.id,
    required this.body,
    required this.notedAt,
    required this.source,
    required this.visibility,
    required this.enrollmentId,
    required this.groupName,
    required this.student,
    required this.author,
  });
}

class CurriculumResource {
  final int id;
  final String bookName;
  final String? author;
  final String? publisher;
  final String? editionNumber;
  final String? publishedOn;
  final bool downloadable;

  const CurriculumResource({
    required this.id,
    required this.bookName,
    required this.author,
    required this.publisher,
    required this.editionNumber,
    required this.publishedOn,
    required this.downloadable,
  });
}

class CurriculumSummary {
  final int id;
  final String name;
  final bool isActive;
  final String? courseName;
  final String? gradeLevelName;
  final int groupsCount;
  final int subjectsCount;

  const CurriculumSummary({
    required this.id,
    required this.name,
    required this.isActive,
    required this.courseName,
    required this.gradeLevelName,
    required this.groupsCount,
    required this.subjectsCount,
  });
}

class CurriculumLesson {
  final int id;
  final int? chapterNumber;
  final String name;
  final String importance;
  final int? pageCount;
  final List<NamedRef> topics;
  final CurriculumResource? resource;

  const CurriculumLesson({
    required this.id,
    required this.chapterNumber,
    required this.name,
    required this.importance,
    required this.pageCount,
    required this.topics,
    required this.resource,
  });
}

class CurriculumSubject {
  final int id;
  final String name;
  final List<CurriculumLesson> lessons;

  const CurriculumSubject({
    required this.id,
    required this.name,
    required this.lessons,
  });
}

class CurriculumDetail {
  final CurriculumSummary summary;
  final List<CurriculumResource> standaloneResources;
  final List<CurriculumSubject> subjects;

  const CurriculumDetail({
    required this.summary,
    required this.standaloneResources,
    required this.subjects,
  });
}

/// تقدّم منهج حلقة: الإجمالي والنسب والدروس المُدرَّسة.
class GroupCurriculumLesson {
  final int id;
  final String name;
  final String status;
  final String? taughtOn;
  final String? teacher;
  final int? pageCount;

  const GroupCurriculumLesson({
    required this.id,
    required this.name,
    required this.status,
    required this.taughtOn,
    required this.teacher,
    required this.pageCount,
  });
}

class GroupCurriculumSubject {
  final int id;
  final String name;
  final double percentage;
  final List<GroupCurriculumLesson> lessons;

  const GroupCurriculumSubject({
    required this.id,
    required this.name,
    required this.percentage,
    required this.lessons,
  });
}

class GroupCurriculum {
  final String? curriculumName;
  final String groupName;
  final double percentage;
  final int total;
  final double completed;
  final List<GroupCurriculumSubject> subjects;

  const GroupCurriculum({
    required this.curriculumName,
    required this.groupName,
    required this.percentage,
    required this.total,
    required this.completed,
    required this.subjects,
  });
}
