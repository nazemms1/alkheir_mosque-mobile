import 'package:flutter_test/flutter_test.dart';

import 'package:alkheir_mosque/app/core/rbac/module_access.dart';
import 'package:alkheir_mosque/app/core/rbac/permissions.dart';
import 'package:alkheir_mosque/features/account/data/models/account_model.dart';
import 'package:alkheir_mosque/features/finance_ops/data/models/activity_invoice_model.dart';
import 'package:alkheir_mosque/features/auth/data/models/auth_token.dart';
import 'package:alkheir_mosque/features/operations/data/models/operations_model.dart';

AuthToken tokenWith(List<String> permissions) {
  return AuthToken.fromJson({
    'token': 'plain-text-token',
    'token_type': 'Bearer',
    'abilities': permissions,
    'user': {
      'id': 2,
      'name': 'Tester',
      'username': 'tester',
      'roles': <String>[],
      'permissions': permissions,
    },
  });
}

void main() {
  group('bootstrap and dashboard', () {
    test('bootstrap reads organization, features and permissions', () {
      final info = BootstrapInfo.fromJson({
        'user': {
          'id': 5,
          'name': 'Admin',
          'username': 'admin',
          'is_active': true,
          'roles': ['manager'],
          'permissions': ['students.view'],
          'username_is_editable': true,
        },
        'permissions': ['students.view', 'groups.view'],
        'organization': {'name': 'Al Kheir', 'logo_url': null},
        'features': {'activities': true, 'parent_portal': false},
        'localization': {'locale': 'ar'},
      });
      expect(info.user.usernameIsEditable, isTrue);
      expect(info.permissions, ['students.view', 'groups.view']);
      expect(info.organizationName, 'Al Kheir');
      expect(info.activitiesEnabled, isTrue);
      expect(info.parentPortal, isFalse);
      expect(info.locale, 'ar');
    });

    test('dashboard keeps only numeric metrics', () {
      final dashboard = DashboardInfo.fromJson({
        'role': 'manager',
        'generated_at': '2026-10-13T10:00:00+03:00',
        'metrics': {
          'active_students': 12,
          'invoice_balance': 150.5,
          'note': 'x'
        },
      });
      expect(dashboard.metrics.keys,
          containsAll(['active_students', 'invoice_balance']));
      expect(dashboard.metrics.containsKey('note'), isFalse);
      expect(dashboard.metrics['invoice_balance'], 150.5);
    });

    test('dashboard with no visible metrics is empty', () {
      final dashboard =
          DashboardInfo.fromJson({'role': 'student', 'metrics': []});
      expect(dashboard.metrics, isEmpty);
    });
  });

  group('activity and invoice models', () {
    test('invoice parent is a string in lists and an object in details', () {
      final fromList = InvoiceSummary.fromJson({
        'id': 1,
        'invoice_no': 'INV-1',
        'invoice_type': 'student_fee',
        'issue_date': '2026-10-01',
        'status': 'unpaid',
        'total': 50,
        'parent': 'Samer Ali',
      });
      final fromDetail = InvoiceDetail.fromJson({
        'id': 1,
        'invoice_no': 'INV-1',
        'invoice_type': 'student_fee',
        'issue_date': '2026-10-01',
        'status': 'unpaid',
        'subtotal': 50,
        'discount': 0,
        'total': 50,
        'paid_total': 20,
        'balance': 30,
        'parent': {'id': 3, 'name': 'Samer Ali'},
        'items': [],
        'payments': [],
      });
      expect(fromList.parentName, 'Samer Ali');
      expect(fromDetail.parentName, 'Samer Ali');
      expect(fromDetail.balance, 30);
    });

    test('expense keeps its category id for editing', () {
      final expense = ActivityExpense.fromJson({
        'id': 6,
        'amount': 45,
        'description': 'Bus rental',
        'expense_category': {'id': 2, 'name': 'Transport'},
        'spent_on': '2026-10-08',
      });
      expect(expense.categoryId, 2);
      expect(expense.categoryName, 'Transport');
    });
  });

  group('operations models', () {
    test('assessment summary reads the type as string or object', () {
      final list = AssessmentSummary.fromJson({
        'id': 1,
        'title': 'Quiz',
        'type': 'Quiz',
        'is_active': true,
        'results_count': 3,
      });
      final detail = AssessmentSummary.fromJson({
        'id': 1,
        'title': 'Quiz',
        'type': {'id': 4, 'name': 'Quiz', 'code': 'quiz'},
        'is_active': true,
      });
      expect(list.typeName, 'Quiz');
      expect(detail.typeName, 'Quiz');
      expect(list.resultsCount, 3);
    });

    test('attendance day detail groups records by group', () {
      final day = AttendanceDayDetail.fromJson({
        'id': 9,
        'attendance_date': '2026-10-05',
        'course': {'id': 1, 'name': 'Quran Course'},
        'status': 'open',
        'course_finished_at': null,
        'groups': [
          {
            'id': 4,
            'group': {'id': 4, 'name': 'Boys Hifz Circle'},
            'status': 'completed',
            'records': [
              {
                'id': 1,
                'enrollment_id': 8,
                'student': {'id': 1, 'name': 'Ahmad Ali'},
                'attendance_status': {
                  'id': 1,
                  'name': 'Present',
                  'code': 'present'
                },
              },
            ],
          },
        ],
      });
      expect(day.courseFinished, isFalse);
      expect(day.groups.single.groupName, 'Boys Hifz Circle');
      expect(day.groups.single.records.single.statusCode, 'present');
      expect(day.groups.single.records.single.studentName, 'Ahmad Ali');
    });

    test('curriculum group progress reads summary and subjects', () {
      final progress = GroupCurriculum.fromJson({
        'curriculum': {'id': 2, 'name': 'Grade 4 Quran'},
        'group': {'id': 4, 'name': 'Boys Hifz Circle'},
        'summary': {'total': 10, 'completed': 4.5, 'percentage': 45.0},
        'subjects': [
          {
            'id': 1,
            'name': 'Tajweed',
            'percentage': 50,
            'lessons': [
              {
                'id': 7,
                'name': 'Makharij',
                'status': 'taught',
                'taught_on': '2026-09-10'
              },
            ],
          },
        ],
      });
      expect(progress.curriculumName, 'Grade 4 Quran');
      expect(progress.total, 10);
      expect(progress.subjects.single.lessons.single.status, 'taught');
    });
  });

  group('new permission gates', () {
    test('attendance and memorization follow their own permissions', () {
      final t = tokenWith(const [Permissions.attendanceStudentView]);
      expect(ModuleAccess.canViewStudentAttendance(t), isTrue);
      expect(ModuleAccess.canTakeStudentAttendance(t), isFalse);
      expect(ModuleAccess.canRecordMemorization(t), isFalse);
      expect(ModuleAccess.hasAnyModule(t), isTrue);
    });

    test('assessment results need both record permissions', () {
      final onlyOne = tokenWith(const [Permissions.assessmentResultsRecord]);
      final both = tokenWith(const [
        Permissions.assessmentResultsRecord,
        Permissions.assessmentResultsRecordScores,
      ]);
      expect(ModuleAccess.canRecordAssessmentResults(onlyOne), isFalse);
      expect(ModuleAccess.canRecordAssessmentResults(both), isTrue);
    });

    test('awqaf tests accept either quran test permission family', () {
      expect(
        ModuleAccess.canRecordAwqafTests(
            tokenWith(const [Permissions.quranTestsRecord])),
        isTrue,
      );
      expect(
        ModuleAccess.canViewAwqafTests(
            tokenWith(const [Permissions.quranAwqafTestsView])),
        isTrue,
      );
    });

    test('notes and points expose separate create and void gates', () {
      final t = tokenWith(const [
        Permissions.studentNotesView,
        Permissions.pointsView,
        Permissions.pointsVoid,
      ]);
      expect(ModuleAccess.canViewNotes(t), isTrue);
      expect(ModuleAccess.canCreateNotes(t), isFalse);
      expect(ModuleAccess.canVoidPoints(t), isTrue);
      expect(ModuleAccess.canAddManualPoints(t), isFalse);
    });

    test('an account with no permissions has no management module', () {
      expect(ModuleAccess.hasAnyModule(tokenWith(const [])), isFalse);
    });
  });
}
