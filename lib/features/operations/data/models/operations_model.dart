import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';
import 'package:alkheir_mosque/features/quran_tests/data/models/quran_test_model.dart' show NamedRef;

/// نماذج العمليات اليومية: الحضور، الحفظ، اختبارات الأوقاف، النقاط،
/// التقييمات، الملاحظات، والمناهج — مطابقة لاستجابات الباك إند.

String? _nameOf(Object? json) => jsonStringOrNull(jsonMap(json)?['name']);

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

  factory AttendanceDaySummary.fromJson(Map<String, dynamic> json) {
    return AttendanceDaySummary(
      id: jsonInt(json['id']),
      attendanceDate: jsonString(json['attendance_date']),
      courseName: _nameOf(json['course']),
      courseId:
          jsonIntOrNull(json['course_id'] ?? jsonMap(json['course'])?['id']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
      groupsCount: jsonInt(json['groups_count']),
      recordsCount: jsonInt(json['records_count']),
      courseFinished: jsonStringOrNull(json['course_finished_at']) != null,
    );
  }
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

  factory AttendanceRecordItem.fromJson(Map<String, dynamic> json) {
    final status = jsonMap(json['attendance_status']);
    return AttendanceRecordItem(
      id: jsonInt(json['id']),
      enrollmentId: jsonInt(json['enrollment_id']),
      studentName: jsonString(jsonMap(json['student'])?['name']),
      statusName: jsonString(status?['name']),
      statusCode: jsonString(status?['code']),
      notes: jsonStringOrNull(json['notes']),
    );
  }
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

  factory AttendanceDayDetail.fromJson(Map<String, dynamic> json) {
    return AttendanceDayDetail(
      id: jsonInt(json['id']),
      attendanceDate: jsonString(json['attendance_date']),
      courseName: _nameOf(json['course']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
      courseFinished: jsonStringOrNull(json['course_finished_at']) != null,
      groups: jsonList(json['groups'], AttendanceGroupDay.fromJson),
    );
  }
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

  factory AttendanceGroupDay.fromJson(Map<String, dynamic> json) {
    return AttendanceGroupDay(
      id: jsonInt(json['id']),
      groupName: jsonString(jsonMap(json['group'])?['name']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
      records: jsonList(json['records'], AttendanceRecordItem.fromJson),
    );
  }
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

  factory TeacherAttendanceRecord.fromJson(Map<String, dynamic> json) {
    final status = jsonMap(json['attendance_status']);
    final teacher = jsonMap(json['teacher']);
    return TeacherAttendanceRecord(
      id: jsonInt(json['id']),
      teacherId: jsonIntOrNull(json['teacher_id']) ??
          (teacher != null ? jsonIntOrNull(teacher['id']) : null),
      teacherName: jsonString(teacher?['name'] ?? json['teacher_name']),
      statusId: jsonIntOrNull(json['attendance_status_id']) ??
          (status != null ? jsonIntOrNull(status['id']) : null),
      statusName: jsonString(status?['name'] ?? json['status_name']),
      statusCode: jsonString(status?['code'] ?? json['status_code']),
      notes: jsonStringOrNull(json['notes']),
    );
  }
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

  factory TeacherAttendanceDay.fromJson(Map<String, dynamic> json) {
    return TeacherAttendanceDay(
      id: jsonInt(json['id']),
      attendanceDate: jsonString(json['attendance_date']),
      courseName: _nameOf(json['course']),
      courseId:
          jsonIntOrNull(json['course_id'] ?? jsonMap(json['course'])?['id']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
      recordsCount: jsonInt(json['records_count'] ?? 0),
      records: jsonList(json['records'], TeacherAttendanceRecord.fromJson),
    );
  }
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

  factory MemorizationEntry.fromJson(Map<String, dynamic> json) {
    return MemorizationEntry(
      id: jsonInt(json['id']),
      enrollmentId: jsonInt(json['enrollment_id']),
      entryType: jsonString(json['entry_type']),
      fromPage: jsonInt(json['from_page']),
      toPage: jsonInt(json['to_page']),
      pagesCount: jsonInt(json['pages_count']),
      recordedOn: jsonString(json['recorded_on']),
      notes: jsonStringOrNull(json['notes']),
      student: NamedRef.fromJson(json['student']),
      groupName: jsonStringOrNull(json['group_name']),
      courseName: jsonStringOrNull(json['course_name']),
      teacher: NamedRef.fromJson(json['teacher']),
    );
  }
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

  factory AwqafTest.fromJson(Map<String, dynamic> json) {
    final juz = jsonMap(json['juz']);
    return AwqafTest(
      id: jsonInt(json['id']),
      enrollmentId: jsonInt(json['enrollment_id']),
      attemptNo: jsonInt(json['attempt_no']),
      status: jsonString(json['status']),
      score: jsonDoubleOrNull(json['score']),
      testedOn: jsonString(json['tested_on']),
      notes: jsonStringOrNull(json['notes']),
      juz: juz == null
          ? null
          : NamedRef(
              id: jsonInt(juz['id']),
              name: 'Juz ${jsonInt(juz['juz_number'])}',
            ),
      typeName: _nameOf(json['type']),
      student: NamedRef.fromJson(json['student']),
      groupName: jsonStringOrNull(json['group_name']),
      teacher: NamedRef.fromJson(json['teacher']),
    );
  }
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

  factory PointEntry.fromJson(Map<String, dynamic> json) {
    final type = jsonMap(json['point_type']);
    return PointEntry(
      id: jsonInt(json['id']),
      enrollmentId: jsonInt(json['enrollment_id']),
      points: jsonInt(json['points']),
      pointTypeName: jsonStringOrNull(type?['name']),
      pointTypeId: jsonIntOrNull(type?['id']),
      enteredAt: jsonString(json['entered_at']),
      effectiveState: jsonString(json['effective_state']),
      voidedAt: jsonStringOrNull(json['voided_at']),
      voidReason: jsonStringOrNull(json['void_reason']),
      notes: jsonStringOrNull(json['notes']),
      sourceType: jsonString(json['source_type']),
      student: NamedRef.fromJson(json['student']),
      groupName: jsonStringOrNull(json['group_name']),
    );
  }

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

  factory AssessmentSummary.fromJson(Map<String, dynamic> json) {
    final group = jsonMap(json['group']);
    // القائمة ترسل النوع نصاً، والتفاصيل ترسله كائناً {id, name}.
    final rawType = json['type'];
    return AssessmentSummary(
      id: jsonInt(json['id']),
      title: jsonString(json['title']),
      typeName: rawType is Map
          ? jsonStringOrNull(rawType['name'])
          : jsonStringOrNull(rawType),
      groupName: jsonStringOrNull(group?['name']),
      courseName: jsonStringOrNull(group?['course_name']),
      scheduledAt: jsonStringOrNull(json['scheduled_at']),
      dueAt: jsonStringOrNull(json['due_at']),
      totalMark: jsonDoubleOrNull(json['total_mark']),
      passMark: jsonDoubleOrNull(json['pass_mark']),
      isActive: jsonBool(json['is_active']),
      resultsCount: jsonInt(json['results_count']),
    );
  }
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

  factory AssessmentResultItem.fromJson(Map<String, dynamic> json) {
    return AssessmentResultItem(
      id: jsonInt(json['id']),
      enrollmentId: jsonInt(json['enrollment_id']),
      studentId: jsonIntOrNull(json['student_id']),
      studentName: jsonString(json['student_name']),
      attemptNo: jsonInt(json['attempt_no']),
      score: jsonDoubleOrNull(json['score']),
      status: jsonString(json['status']),
      notes: jsonStringOrNull(json['notes']),
      teacherName: jsonStringOrNull(json['teacher_name']),
    );
  }
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

  factory AssessmentDetail.fromJson(Map<String, dynamic> json) {
    return AssessmentDetail(
      summary: AssessmentSummary.fromJson(json),
      description: jsonStringOrNull(json['description']),
      groups: [
        for (final g in (json['groups'] as List? ?? const []))
          if (NamedRef.fromJson(g) != null) NamedRef.fromJson(g)!,
      ],
      results: jsonList(json['results'], AssessmentResultItem.fromJson),
    );
  }
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

  factory StudentNoteItem.fromJson(Map<String, dynamic> json) {
    return StudentNoteItem(
      id: jsonInt(json['id']),
      body: jsonString(json['body']),
      notedAt: jsonString(json['noted_at']),
      source: jsonString(json['source']),
      visibility: jsonString(json['visibility']),
      enrollmentId: jsonIntOrNull(json['enrollment_id']),
      groupName: jsonStringOrNull(json['group_name']),
      student: NamedRef.fromJson(json['student']),
      author: NamedRef.fromJson(json['author']),
    );
  }
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

  factory CurriculumResource.fromJson(Map<String, dynamic> json) {
    return CurriculumResource(
      id: jsonInt(json['id']),
      bookName: jsonString(json['book_name']),
      author: jsonStringOrNull(json['author']),
      publisher: jsonStringOrNull(json['publisher']),
      editionNumber: jsonStringOrNull(json['edition_number']),
      publishedOn: jsonStringOrNull(json['published_on']),
      downloadable: jsonStringOrNull(json['download_endpoint']) != null,
    );
  }
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

  factory CurriculumSummary.fromJson(Map<String, dynamic> json) {
    return CurriculumSummary(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      isActive: jsonBool(json['is_active']),
      courseName: _nameOf(json['course']),
      gradeLevelName: _nameOf(json['grade_level']),
      groupsCount: jsonInt(json['groups_count']),
      subjectsCount: jsonInt(json['subjects_count']),
    );
  }
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

  factory CurriculumLesson.fromJson(Map<String, dynamic> json) {
    final resource = jsonMap(json['resource']);
    return CurriculumLesson(
      id: jsonInt(json['id']),
      chapterNumber: jsonIntOrNull(json['chapter_number']),
      name: jsonString(json['name']),
      importance: jsonString(json['importance']),
      pageCount: jsonIntOrNull(json['page_count']),
      topics: [
        for (final t in (json['topics'] as List? ?? const []))
          if (NamedRef.fromJson(t) != null) NamedRef.fromJson(t)!,
      ],
      resource: resource == null ? null : CurriculumResource.fromJson(resource),
    );
  }
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

  factory CurriculumSubject.fromJson(Map<String, dynamic> json) {
    return CurriculumSubject(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      lessons: jsonList(json['lessons'], CurriculumLesson.fromJson),
    );
  }
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

  factory CurriculumDetail.fromJson(Map<String, dynamic> json) {
    return CurriculumDetail(
      summary: CurriculumSummary.fromJson(json),
      standaloneResources: jsonList(
        json['standalone_resources'],
        CurriculumResource.fromJson,
      ),
      subjects: jsonList(json['subjects'], CurriculumSubject.fromJson),
    );
  }
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

  factory GroupCurriculumLesson.fromJson(Map<String, dynamic> json) {
    return GroupCurriculumLesson(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      status: jsonString(json['status']),
      taughtOn: jsonStringOrNull(json['taught_on']),
      teacher: jsonStringOrNull(json['teacher']),
      pageCount: jsonIntOrNull(json['page_count']),
    );
  }
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

  factory GroupCurriculumSubject.fromJson(Map<String, dynamic> json) {
    return GroupCurriculumSubject(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      percentage: jsonDouble(json['percentage']),
      lessons: jsonList(json['lessons'], GroupCurriculumLesson.fromJson),
    );
  }
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

  factory GroupCurriculum.fromJson(Map<String, dynamic> json) {
    final summary = jsonMap(json['summary']) ?? const <String, dynamic>{};
    return GroupCurriculum(
      curriculumName: jsonStringOrNull(jsonMap(json['curriculum'])?['name']),
      groupName: jsonString(jsonMap(json['group'])?['name']),
      percentage: jsonDouble(summary['percentage']),
      total: jsonInt(summary['total']),
      completed: jsonDouble(summary['completed']),
      subjects: jsonList(json['subjects'], GroupCurriculumSubject.fromJson),
    );
  }
}
