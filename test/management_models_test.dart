import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/core/rbac/module_access.dart';
import 'package:alkheir_mosque/core/rbac/permissions.dart';
import 'package:alkheir_mosque/data/models/auth_token.dart';
import 'package:alkheir_mosque/data/models/finance_model.dart';
import 'package:alkheir_mosque/data/models/group_student_model.dart';
import 'package:alkheir_mosque/data/models/json_helpers.dart';
import 'package:alkheir_mosque/data/models/management_model.dart';
import 'package:alkheir_mosque/data/models/quran_test_model.dart';
import 'package:alkheir_mosque/data/models/student_progress_model.dart';

AuthToken tokenWith(List<String> permissions, {List<String> roles = const []}) {
  return AuthToken.fromJson({
    'token': 'plain-text-token',
    'token_type': 'Bearer',
    'abilities': permissions,
    'user': {
      'id': 1,
      'name': 'Tester',
      'username': 'tester',
      'roles': roles,
      'permissions': permissions,
    },
  });
}

void main() {
  group('ModuleAccess', () {
    test('a token without module permissions sees no management module', () {
      final t = tokenWith(const []);
      expect(ModuleAccess.hasAnyModule(t), isFalse);
      expect(ModuleAccess.canViewFinance(t), isFalse);
      expect(ModuleAccess.canViewQuranTests(t), isFalse);
    });

    test('gates follow permission names, not role names', () {
      // دور "مشرف" بدون أي صلاحية مالية لا يرى المالية.
      final supervisor = tokenWith(
        const [Permissions.groupsView, Permissions.quranFinalTestsView],
        roles: const ['supervisor'],
      );
      expect(ModuleAccess.canViewFinance(supervisor), isFalse);
      expect(ModuleAccess.canViewGroups(supervisor), isTrue);
      expect(ModuleAccess.canViewQuranTests(supervisor), isTrue);
      expect(ModuleAccess.canRecordFinalTests(supervisor), isFalse);
      expect(ModuleAccess.hasAnyModule(supervisor), isTrue);
    });

    test('finance tabs need their own permission', () {
      final reportsOnly = tokenWith(const [Permissions.financeReportsView]);
      expect(ModuleAccess.canViewFinanceSummary(reportsOnly), isTrue);
      expect(ModuleAccess.canViewCashBoxes(reportsOnly), isFalse);
      expect(ModuleAccess.canAdjustCash(reportsOnly), isFalse);

      final requestsOnly =
          tokenWith(const [Permissions.financeExpenseRequestsView]);
      expect(ModuleAccess.canViewFinanceRequests(requestsOnly), isTrue);
      expect(ModuleAccess.canViewFinance(requestsOnly), isTrue);
    });

    test('course lifecycle and record writes map to their permissions', () {
      final t = tokenWith(const [
        Permissions.coursesView,
        Permissions.coursesUpdate,
        Permissions.parentsView,
      ]);
      expect(ModuleAccess.canViewCourses(t), isTrue);
      expect(ModuleAccess.canUpdateCourses(t), isTrue);
      expect(ModuleAccess.canDeleteCourses(t), isFalse);
      expect(ModuleAccess.canCreateParents(t), isFalse);
      expect(ModuleAccess.canViewParents(t), isTrue);
    });
  });

  group('JSON helpers', () {
    test('tolerate strings, nulls and numeric strings', () {
      expect(jsonInt('12'), 12);
      expect(jsonInt(null), 0);
      expect(jsonDouble('3.5'), 3.5);
      expect(jsonDoubleOrNull(null), isNull);
      expect(jsonStringOrNull('   '), isNull);
      expect(jsonBool(1), isTrue);
      expect(jsonBool('0'), isFalse);
    });

    test('PagedResult reads Laravel paginator keys', () {
      final page = PagedResult.fromJson(
        {
          'current_page': 1,
          'last_page': 3,
          'total': 41,
          'data': [
            {'id': 1, 'name': 'A'},
            {'id': 2, 'name': 'B'},
          ],
        },
        RefItem.fromJson,
      );
      expect(page.items.map((e) => e.name), ['A', 'B']);
      expect(page.hasMore, isTrue);
      expect(page.total, 41);
    });
  });

  group('finance models', () {
    test('summary accepts an empty list for pending requests', () {
      final summary = FinanceSummary.fromJson({
        'cash_boxes': [],
        'pending_requests': [],
        'totals': [],
      });
      expect(summary.pendingRequests, isEmpty);
      expect(summary.pendingTotal, 0);
    });

    test('summary maps pending counts by request type', () {
      final summary = FinanceSummary.fromJson({
        'cash_boxes': [
          {
            'id': 4,
            'name': 'Main',
            'code': 'MAIN',
            'is_active': true,
            'local_total': 1200.5,
            'currencies': [
              {
                'balance': 300,
                'local_equivalent': 300,
                'currency': {
                  'id': 1,
                  'code': 'SAR',
                  'name': 'Riyal',
                  'symbol': 'ر.س'
                },
              },
            ],
          },
        ],
        'pending_requests': {'pull': 2, 'expense': 1},
        'totals': [],
      });
      expect(summary.pendingRequests, {'pull': 2, 'expense': 1});
      expect(summary.pendingTotal, 3);
      final box = summary.cashBoxes.single;
      expect(box.localTotal, 1200.5);
      expect(box.currencyOptions.single.label, 'ر.س');
    });

    test('ledger entry reads direction and nested references', () {
      final entry = LedgerEntry.fromJson({
        'id': 9,
        'transaction_no': 'TX-9',
        'type': 'manual_adjustment',
        'direction': 'out',
        'status': 'posted',
        'transaction_date': '2026-10-10',
        'amount': 45,
        'signed_amount': -45,
        'local_amount': 45,
        'base_amount': 45,
        'currency': {'id': 1, 'code': 'SAR', 'name': 'Riyal', 'symbol': ''},
        'cash_box': {'id': 4, 'name': 'Main', 'code': 'MAIN'},
        'category': null,
        'description': 'Bus rental',
        'entered_by': {'id': 1, 'name': 'Admin'},
        'finance_request_id': null,
      });
      expect(entry.isIncoming, isFalse);
      expect(entry.cashBox?.name, 'Main');
      expect(entry.categoryName, isNull);
      expect(entry.currency?.label, 'SAR');
      expect(entry.enteredByName, 'Admin');
    });
  });

  group('management models', () {
    test('teacher reads course reference and derives status', () {
      final teacher = TeacherItem.fromJson({
        'id': 7,
        'first_name': 'Yaman',
        'last_name': 'Al-Faisal',
        'phone': '0500000000',
        'status': 'inactive',
        'is_helping': true,
        'course': {'id': 2, 'name': 'Quran Course'},
        'job_title': 'Imam',
        'assigned_groups_count': 2,
        'assisted_groups_count': 0,
      });
      expect(teacher.fullName, 'Yaman Al-Faisal');
      expect(teacher.courseId, 2);
      expect(teacher.courseName, 'Quran Course');
      expect(teacher.isActive, isFalse);
      expect(teacher.isHelping, isTrue);
    });

    test('course finished state comes from is_active', () {
      final course = CourseItem.fromJson({
        'id': 3,
        'name': 'Spring',
        'academic_year': '2026',
        'academic_year_id': 1,
        'is_active': false,
        'finished_at': '2026-09-30T10:00:00+03:00',
        'groups_count': 4,
        'enrollments_count': 60,
      });
      expect(course.isFinished, isTrue);
      expect(course.groupsCount, 4);
    });

    test('schedule slot falls back to its key when no label is sent', () {
      final slot = GroupScheduleSlot.fromJson({
        'id': 5,
        'day_of_week': 0,
        'time_slot': 'morning',
        'starts_at': '08:00',
        'ends_at': '10:00',
        'is_active': true,
      });
      expect(slot.timeSlotLabel, 'morning');
      expect(slot.dayOfWeek, 0);
    });

    test('student list item joins first and last name', () {
      final student = StudentListItem.fromJson({
        'id': 9,
        'first_name': 'Ahmad',
        'last_name': 'Ali',
        'student_number': 'STU-000009',
        'status': 'active',
        'parent': 'Samer Ali',
        'grade_level': 'Grade 4',
      });
      expect(student.fullName, 'Ahmad Ali');
      expect(student.parentName, 'Samer Ali');
    });
  });

  group('Quran test models', () {
    test('partial cycle exposes parts and passed state', () {
      final cycle = QuranPartialCycle.fromJson({
        'id': 12,
        'enrollment_id': 8,
        'status': 'in_progress',
        'passed_on': null,
        'juz': {'id': 3, 'juz_number': 3, 'from_page': 42, 'to_page': 61},
        'student': {'id': 1, 'name': 'Ahmad Ali'},
        'group': {
          'id': 4,
          'name': 'Boys Hifz Circle',
          'course_name': 'Quran Course'
        },
        'parts': [
          {
            'id': 100,
            'part_number': 1,
            'status': 'passed',
            'passed_on': '2026-10-02',
            'attempts': [
              {
                'id': 1,
                'attempt_no': 1,
                'mistake_count': 2,
                'status': 'passed',
                'tested_on': '2026-10-02',
                'notes': null,
                'teacher': {'id': 7, 'name': 'Yaman'},
              },
            ],
          },
          {
            'id': 101,
            'part_number': 2,
            'status': 'in_progress',
            'attempts': []
          },
        ],
      });
      expect(cycle.isPassed, isFalse);
      expect(cycle.juz?.juzNumber, 3);
      expect(cycle.parts.first.isPassed, isTrue);
      expect(cycle.parts.first.attempts.single.teacher?.name, 'Yaman');
      expect(cycle.parts.last.attempts, isEmpty);
    });

    test('final attempt reads score as a double', () {
      final attempt = QuranFinalAttempt.fromJson({
        'id': 2,
        'attempt_no': 1,
        'score': '95.5',
        'status': 'passed',
        'tested_on': '2026-10-07',
        'notes': 'Excellent',
        'teacher': null,
      });
      expect(attempt.score, 95.5);
      expect(attempt.teacher, isNull);
    });
  });

  group('student progress models', () {
    test('null stats mean the viewer lacks that module permission', () {
      final progress = StudentProgress.fromJson({
        'profile': {
          'id': 1,
          'name': 'Ahmad Ali',
          'student_number': 'STU-000001',
          'status': 'active',
          'grade_level': {'id': 2, 'name': 'Grade 4'},
          'parent': null,
          'photo_endpoint': null,
          'quran_current_juz': 3,
        },
        'enrollments': [
          {
            'id': 8,
            'status': 'active',
            'enrolled_at': '2026-09-01',
            'left_at': null,
            'group': {'id': 4, 'name': 'Boys Hifz Circle'},
            'course': {'id': 2, 'name': 'Quran Course'},
            'teacher': {'id': 7, 'name': 'Yaman'},
          },
        ],
        'stats': {
          'assessment_average': null,
          'attendance_days': null,
          'files': 2,
          'memorized_pages': 44,
          'notes': null,
          'passed_final_tests': null,
          'passed_partial_tests': 1,
          'points': null,
        },
      });
      expect(progress.profile.hasPhoto, isFalse);
      expect(progress.profile.quranCurrentJuz, 3);
      expect(progress.enrollments.single.isActive, isTrue);
      expect(progress.stats.points, isNull);
      expect(progress.stats.passedPartialTests, 1);
      expect(progress.stats.memorizedPages, 44);
    });

    test('file item reads uploader and timestamps', () {
      final file = StudentFileItem.fromJson({
        'id': 5,
        'file_type': 'certificate',
        'original_name': 'birth.pdf',
        'uploaded_at': '2026-10-01T09:00:00+00:00',
        'uploaded_by': {'id': 1, 'name': 'Admin'},
      });
      expect(file.originalName, 'birth.pdf');
      expect(file.uploadedByName, 'Admin');
    });
  });
}
