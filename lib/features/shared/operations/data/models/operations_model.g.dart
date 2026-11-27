// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceDaySummaryModelImpl _$$AttendanceDaySummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDaySummaryModelImpl(
      id: jsonIntLenient(json['id']),
      attendanceDate: jsonStringValue(json['attendance_date']),
      courseName: _attendanceDaySummaryCourseNameValue(
          _attendanceDaySummaryCourseName(json, 'courseName')),
      courseId: _attendanceDaySummaryCourseIdValue(
          _attendanceDaySummaryCourseId(json, 'courseId')),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
      groupsCount: jsonIntLenient(json['groups_count']),
      recordsCount: jsonIntLenient(json['records_count']),
      courseFinished: _attendanceDaySummaryCourseFinishedValue(
          _attendanceDaySummaryCourseFinished(json, 'courseFinished')),
    );

_$AttendanceRecordItemModelImpl _$$AttendanceRecordItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRecordItemModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      studentName: _attendanceRecordItemStudentNameValue(
          _attendanceRecordItemStudentName(json, 'studentName')),
      statusName: _attendanceRecordItemStatusNameValue(
          _attendanceRecordItemStatusName(json, 'statusName')),
      statusCode: _attendanceRecordItemStatusCodeValue(
          _attendanceRecordItemStatusCode(json, 'statusCode')),
      notes: jsonStringLenient(json['notes']),
    );

_$AttendanceDayDetailModelImpl _$$AttendanceDayDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDayDetailModelImpl(
      id: jsonIntLenient(json['id']),
      attendanceDate: jsonStringValue(json['attendance_date']),
      courseName: _attendanceDayDetailCourseNameValue(
          _attendanceDayDetailCourseName(json, 'courseName')),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
      courseFinished: _attendanceDayDetailCourseFinishedValue(
          _attendanceDayDetailCourseFinished(json, 'courseFinished')),
      groups: (readJsonList(json, 'groups') as List<dynamic>?)
          ?.map((e) =>
              AttendanceGroupDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$AttendanceGroupDayModelImpl _$$AttendanceGroupDayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceGroupDayModelImpl(
      id: jsonIntLenient(json['id']),
      groupName: _attendanceGroupDayGroupNameValue(
          _attendanceGroupDayGroupName(json, 'groupName')),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
      records: (readJsonList(json, 'records') as List<dynamic>?)
          ?.map((e) =>
              AttendanceRecordItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$TeacherAttendanceRecordModelImpl _$$TeacherAttendanceRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherAttendanceRecordModelImpl(
      id: jsonIntLenient(json['id']),
      teacherId: _teacherAttendanceRecordTeacherIdValue(
          _teacherAttendanceRecordTeacherId(json, 'teacherId')),
      teacherName: _teacherAttendanceRecordTeacherNameValue(
          _teacherAttendanceRecordTeacherName(json, 'teacherName')),
      statusId: _teacherAttendanceRecordStatusIdValue(
          _teacherAttendanceRecordStatusId(json, 'statusId')),
      statusName: _teacherAttendanceRecordStatusNameValue(
          _teacherAttendanceRecordStatusName(json, 'statusName')),
      statusCode: _teacherAttendanceRecordStatusCodeValue(
          _teacherAttendanceRecordStatusCode(json, 'statusCode')),
      notes: jsonStringLenient(json['notes']),
    );

_$TeacherAttendanceDayModelImpl _$$TeacherAttendanceDayModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TeacherAttendanceDayModelImpl(
      id: jsonIntLenient(json['id']),
      attendanceDate: jsonStringValue(json['attendance_date']),
      courseName: _teacherAttendanceDayCourseNameValue(
          _teacherAttendanceDayCourseName(json, 'courseName')),
      courseId: _teacherAttendanceDayCourseIdValue(
          _teacherAttendanceDayCourseId(json, 'courseId')),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
      recordsCount: _teacherAttendanceDayRecordsCountValue(
          _teacherAttendanceDayRecordsCount(json, 'recordsCount')),
      records: (readJsonList(json, 'records') as List<dynamic>?)
          ?.map((e) =>
              TeacherAttendanceRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$MemorizationEntryModelImpl _$$MemorizationEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MemorizationEntryModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      entryType: jsonStringValue(json['entry_type']),
      fromPage: jsonIntLenient(json['from_page']),
      toPage: jsonIntLenient(json['to_page']),
      pagesCount: jsonIntLenient(json['pages_count']),
      recordedOn: jsonStringValue(json['recorded_on']),
      notes: jsonStringLenient(json['notes']),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      groupName: jsonStringLenient(json['group_name']),
      courseName: jsonStringLenient(json['course_name']),
      teacher: readJsonMap(json, 'teacher') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'teacher') as Map<String, dynamic>),
    );

_$AwqafTestModelImpl _$$AwqafTestModelImplFromJson(Map<String, dynamic> json) =>
    _$AwqafTestModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      attemptNo: jsonIntLenient(json['attempt_no']),
      status: jsonStringValue(json['status']),
      score: jsonDoubleLenient(json['score']),
      testedOn: jsonStringValue(json['tested_on']),
      notes: jsonStringLenient(json['notes']),
      typeName: _awqafTestTypeNameValue(_awqafTestTypeName(json, 'typeName')),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      groupName: jsonStringLenient(json['group_name']),
      teacher: readJsonMap(json, 'teacher') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'teacher') as Map<String, dynamic>),
      juz: readJsonMap(json, 'juz') as Map<String, dynamic>?,
    );

_$PointEntryModelImpl _$$PointEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PointEntryModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      points: jsonIntLenient(json['points']),
      pointTypeName: _pointEntryPointTypeNameValue(
          _pointEntryPointTypeName(json, 'pointTypeName')),
      pointTypeId: _pointEntryPointTypeIdValue(
          _pointEntryPointTypeId(json, 'pointTypeId')),
      enteredAt: jsonStringValue(json['entered_at']),
      effectiveState: jsonStringValue(json['effective_state']),
      voidedAt: jsonStringLenient(json['voided_at']),
      voidReason: jsonStringLenient(json['void_reason']),
      notes: jsonStringLenient(json['notes']),
      sourceType: jsonStringValue(json['source_type']),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      groupName: jsonStringLenient(json['group_name']),
    );

_$AssessmentSummaryModelImpl _$$AssessmentSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentSummaryModelImpl(
      id: jsonIntLenient(json['id']),
      title: jsonStringValue(json['title']),
      typeName: _assessmentSummaryTypeNameValue(
          _assessmentSummaryTypeName(json, 'typeName')),
      groupName: _assessmentSummaryGroupNameValue(
          _assessmentSummaryGroupName(json, 'groupName')),
      courseName: _assessmentSummaryCourseNameValue(
          _assessmentSummaryCourseName(json, 'courseName')),
      scheduledAt: jsonStringLenient(json['scheduled_at']),
      dueAt: jsonStringLenient(json['due_at']),
      totalMark: jsonDoubleLenient(json['total_mark']),
      passMark: jsonDoubleLenient(json['pass_mark']),
      isActive: jsonBoolLenient(json['is_active']),
      resultsCount: jsonIntLenient(json['results_count']),
    );

_$AssessmentResultItemModelImpl _$$AssessmentResultItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentResultItemModelImpl(
      id: jsonIntLenient(json['id']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      studentId: jsonIntLenient(json['student_id']),
      studentName: jsonStringValue(json['student_name']),
      attemptNo: jsonIntLenient(json['attempt_no']),
      score: jsonDoubleLenient(json['score']),
      status: jsonStringValue(json['status']),
      notes: jsonStringLenient(json['notes']),
      teacherName: jsonStringLenient(json['teacher_name']),
    );

_$AssessmentDetailModelImpl _$$AssessmentDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AssessmentDetailModelImpl(
      summary: _assessmentDetailSummary(json, 'summary') == null
          ? null
          : AssessmentSummaryModel.fromJson(
              _assessmentDetailSummary(json, 'summary')
                  as Map<String, dynamic>),
      description: jsonStringLenient(json['description']),
      groups: (readJsonList(json, 'groups') as List<dynamic>?)
          ?.map((e) => NamedRefModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      results: (readJsonList(json, 'results') as List<dynamic>?)
          ?.map((e) =>
              AssessmentResultItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$StudentNoteItemModelImpl _$$StudentNoteItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentNoteItemModelImpl(
      id: jsonIntLenient(json['id']),
      body: jsonStringValue(json['body']),
      notedAt: jsonStringValue(json['noted_at']),
      source: jsonStringValue(json['source']),
      visibility: jsonStringValue(json['visibility']),
      enrollmentId: jsonIntLenient(json['enrollment_id']),
      groupName: jsonStringLenient(json['group_name']),
      student: readJsonMap(json, 'student') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'student') as Map<String, dynamic>),
      author: readJsonMap(json, 'author') == null
          ? null
          : NamedRefModel.fromJson(
              readJsonMap(json, 'author') as Map<String, dynamic>),
    );

_$CurriculumResourceModelImpl _$$CurriculumResourceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumResourceModelImpl(
      id: jsonIntLenient(json['id']),
      bookName: jsonStringValue(json['book_name']),
      author: jsonStringLenient(json['author']),
      publisher: jsonStringLenient(json['publisher']),
      editionNumber: jsonStringLenient(json['edition_number']),
      publishedOn: jsonStringLenient(json['published_on']),
      downloadable: _curriculumResourceDownloadableValue(
          _curriculumResourceDownloadable(json, 'downloadable')),
    );

_$CurriculumSummaryModelImpl _$$CurriculumSummaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumSummaryModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      isActive: jsonBoolLenient(json['is_active']),
      courseName: _curriculumSummaryCourseNameValue(
          _curriculumSummaryCourseName(json, 'courseName')),
      gradeLevelName: _curriculumSummaryGradeLevelNameValue(
          _curriculumSummaryGradeLevelName(json, 'gradeLevelName')),
      groupsCount: jsonIntLenient(json['groups_count']),
      subjectsCount: jsonIntLenient(json['subjects_count']),
    );

_$CurriculumLessonModelImpl _$$CurriculumLessonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumLessonModelImpl(
      id: jsonIntLenient(json['id']),
      chapterNumber: jsonIntLenient(json['chapter_number']),
      name: jsonStringValue(json['name']),
      importance: jsonStringValue(json['importance']),
      pageCount: jsonIntLenient(json['page_count']),
      topics: (readJsonList(json, 'topics') as List<dynamic>?)
          ?.map((e) => NamedRefModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      resource: readJsonMap(json, 'resource') == null
          ? null
          : CurriculumResourceModel.fromJson(
              readJsonMap(json, 'resource') as Map<String, dynamic>),
    );

_$CurriculumSubjectModelImpl _$$CurriculumSubjectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumSubjectModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      lessons: (readJsonList(json, 'lessons') as List<dynamic>?)
          ?.map(
              (e) => CurriculumLessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$CurriculumDetailModelImpl _$$CurriculumDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CurriculumDetailModelImpl(
      summary: _curriculumDetailSummary(json, 'summary') == null
          ? null
          : CurriculumSummaryModel.fromJson(
              _curriculumDetailSummary(json, 'summary')
                  as Map<String, dynamic>),
      standaloneResources:
          (readJsonList(json, 'standalone_resources') as List<dynamic>?)
              ?.map((e) =>
                  CurriculumResourceModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      subjects: (readJsonList(json, 'subjects') as List<dynamic>?)
          ?.map(
              (e) => CurriculumSubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$GroupCurriculumLessonModelImpl _$$GroupCurriculumLessonModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupCurriculumLessonModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      status: jsonStringValue(json['status']),
      taughtOn: jsonStringLenient(json['taught_on']),
      teacher: jsonStringLenient(json['teacher']),
      pageCount: jsonIntLenient(json['page_count']),
    );

_$GroupCurriculumSubjectModelImpl _$$GroupCurriculumSubjectModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupCurriculumSubjectModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringValue(json['name']),
      percentage: jsonDoubleLenient(json['percentage']),
      lessons: (readJsonList(json, 'lessons') as List<dynamic>?)
          ?.map((e) =>
              GroupCurriculumLessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$GroupCurriculumModelImpl _$$GroupCurriculumModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupCurriculumModelImpl(
      curriculumName: _groupCurriculumCurriculumNameValue(
          _groupCurriculumCurriculumName(json, 'curriculumName')),
      groupName: _groupCurriculumGroupNameValue(
          _groupCurriculumGroupName(json, 'groupName')),
      percentage: _groupCurriculumPercentageValue(
          _groupCurriculumPercentage(json, 'percentage')),
      total: _groupCurriculumTotalValue(_groupCurriculumTotal(json, 'total')),
      completed: _groupCurriculumCompletedValue(
          _groupCurriculumCompleted(json, 'completed')),
      subjects: (readJsonList(json, 'subjects') as List<dynamic>?)
          ?.map((e) =>
              GroupCurriculumSubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
