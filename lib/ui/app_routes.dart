import 'package:alkheir_mosque/app/core/l10n/l10n_gateway.dart';
import 'package:alkheir_mosque/features/shared/students/ui/pages/student_picker_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/widgets/pickers.dart';
import 'package:alkheir_mosque/features/admin/dashboard/domain/entities/admin_dashboard_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/records_entity.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/domain/entities/activity_invoice_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/group_student_entity.dart';
import 'package:alkheir_mosque/features/admin/management/domain/entities/management_entity.dart';
import 'package:alkheir_mosque/features/shared/auth/domain/entities/auth_token.dart';
import 'package:alkheir_mosque/features/shared/operations/domain/entities/operations_entity.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/pages/quran_tests_screen.dart';
import 'package:alkheir_mosque/features/shared/students/domain/entities/student_progress_entity.dart';
import 'package:alkheir_mosque/features/admin/assessments/ui/pages/assessments_screen.dart';
import 'package:alkheir_mosque/features/admin/curricula/ui/pages/curricula_screen.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/pages/group_detail_screen.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/pages/group_form_screen.dart';
import 'package:alkheir_mosque/features/admin/dashboard/ui/pages/qr_scanner_screen.dart';
import 'package:alkheir_mosque/features/admin/finance/ui/pages/finance_screen.dart';
import 'package:alkheir_mosque/features/admin/finance_ops/ui/pages/activities_screen.dart'
    as ops_activities;
import 'package:alkheir_mosque/features/admin/finance_ops/ui/pages/invoices_screen.dart'
    as ops_invoices;
import 'package:alkheir_mosque/features/admin/management/ui/pages/course_form_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/courses_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/enrollments_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/group_schedules_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/parent_form_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/parents_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/student_form_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/teacher_form_screen.dart';
import 'package:alkheir_mosque/features/admin/management/ui/pages/teachers_screen.dart';
import 'package:alkheir_mosque/features/admin/notes/ui/pages/student_notes_screen.dart';
import 'package:alkheir_mosque/features/parent/activities/ui/pages/activities_screen.dart';
import 'package:alkheir_mosque/features/parent/invoices/ui/pages/invoice_detail_screen.dart';
import 'package:alkheir_mosque/features/parent/invoices/ui/pages/parent_invoices_screen.dart';
import 'package:alkheir_mosque/features/shared/account/ui/pages/account_screen.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/pages/student_attendance_screen.dart';
import 'package:alkheir_mosque/features/shared/attendance/ui/pages/teacher_attendance_screen.dart';
import 'package:alkheir_mosque/features/shared/main/ui/pages/main_shell.dart';
import 'package:alkheir_mosque/features/shared/memorization/ui/pages/staff_memorization_screen.dart';
import 'package:alkheir_mosque/features/shared/notifications/ui/pages/notifications_screen.dart';
import 'package:alkheir_mosque/features/shared/points/ui/pages/points_ledger_screen.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/pages/awqaf_tests_screen.dart';
import 'package:alkheir_mosque/features/shared/quran_tests/ui/pages/quran_cycle_screen.dart';
import 'package:alkheir_mosque/features/shared/reports/ui/pages/reports_screen.dart';
import 'package:alkheir_mosque/features/shared/sabr/ui/pages/saber_entry_screen.dart';
import 'package:alkheir_mosque/features/shared/students/ui/pages/student_progress_screen.dart';
import 'package:alkheir_mosque/features/supervisor/supervisor_main/ui/pages/supervisor_student_detail.dart';
import 'package:alkheir_mosque/ui/themes/theme_extension.dart';
import 'package:alkheir_mosque/ui/font_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:alkheir_mosque/ui/themes/app_style.dart';
import 'package:alkheir_mosque/features/shared/auth/ui/pages/login_screen.dart';
import 'package:alkheir_mosque/features/shared/splash/ui/pages/splash_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey;

  NavigationService({
    GlobalKey<NavigatorState>? navKey,
    GlobalKey<ScaffoldMessengerState>? messengerKey,
  })  : navigatorKey = navKey ?? GlobalKey<NavigatorState>(),
        rootScaffoldMessengerKey =
            messengerKey ?? GlobalKey<ScaffoldMessengerState>();

  BuildContext? get currentContext => navigatorKey.currentContext;

  String? get currentRoute {
    final context = navigatorKey.currentContext;
    if (context != null) {
      try {
        return GoRouterState.of(context).uri.toString();
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  void go(String location, {Object? extra}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      context.go(location, extra: extra);
    }
  }

  Future<T?> push<T>(String location, {Object? extra}) async {
    final context = navigatorKey.currentContext;
    if (context != null) {
      return context.push<T>(location, extra: extra);
    }
    return null;
  }

  void replace(String location, {Object? extra}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      context.replace(location, extra: extra);
    }
  }

  void pop<T>([T? result]) {
    final context = navigatorKey.currentContext;
    if (context != null && context.canPop()) {
      context.pop<T>(result);
    }
  }

  void showSnackBar(
    String message, {
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade700 : null,
        duration: duration,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

/// وسائط شاشة اختيار الطالب (تحمل ما يحدث بعد الاختيار).
typedef StudentPickerArgs = ({
  AuthToken token,
  String title,
  Future<void> Function(BuildContext context, StudentListItem student) onPicked,
});

/// انتقال بالتلاشي (الدخول للتطبيق وصفحة الدخول) كما كان قبل go_router.
CustomTransitionPage<void> _fade(GoRouterState state, Widget child) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 650),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        child: child,
      ),
    );

abstract final class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';

  // Screens opened from inside the app (arguments travel in `extra`).
  static const String assessmentsRoute = '/admin/assessments';
  static const String groupPickerRoute = '/admin/group-picker';
  static const String invoicesRoute = '/admin/invoices';
  static const String quranTestsRoute = '/shared/quran-tests';
  static const String activityDetailRoute = '/admin/activity-detail';
  static const String activityExpenseFormRoute = '/admin/activity-expense-form';
  static const String activityPaymentFormRoute = '/admin/activity-payment-form';
  static const String assessmentDetailRoute = '/admin/assessment-detail';
  static const String assessmentResultFormRoute =
      '/admin/assessment-result-form';
  static const String courseFormRoute = '/admin/course-form';
  static const String coursesRoute = '/admin/courses';
  static const String curriculaRoute = '/admin/curricula';
  static const String curriculumDetailRoute = '/admin/curriculum-detail';
  static const String enrollmentFormRoute = '/admin/enrollment-form';
  static const String enrollmentsRoute = '/admin/enrollments';
  static const String financeRoute = '/admin/finance';
  static const String groupCurriculumRoute = '/admin/group-curriculum';
  static const String groupDetailRoute = '/admin/group-detail';
  static const String groupFormRoute = '/admin/group-form';
  static const String groupSchedulesRoute = '/admin/group-schedules';
  static const String invoiceItemFormRoute = '/admin/invoice-item-form';
  static const String invoicePaymentFormRoute = '/admin/invoice-payment-form';
  static const String noteFormRoute = '/admin/note-form';
  static const String parentFormRoute = '/admin/parent-form';
  static const String parentsRoute = '/admin/parents';
  static const String paymentsRoute = '/admin/payments';
  static const String qrScannerRoute = '/admin/qr-scanner';
  static const String registrationFormRoute = '/admin/registration-form';
  static const String studentFormRoute = '/admin/student-form';
  static const String studentNotesRoute = '/admin/student-notes';
  static const String teacherFormRoute = '/admin/teacher-form';
  static const String teachersRoute = '/admin/teachers';
  static const String activitiesRoute = '/parent/activities';
  static const String adminActivitiesRoute = '/admin/activities';
  static const String studentPickerRoute = '/shared/student-picker';
  static const String adminInvoiceDetailRoute = '/admin/invoice-detail';
  static const String invoiceDetailRoute = '/parent/invoice-detail';
  static const String parentInvoicesRoute = '/parent/parent-invoices';
  static const String accountRoute = '/shared/account';
  static const String attendanceDayRoute = '/shared/attendance-day';
  static const String awqafTestsRoute = '/shared/awqaf-tests';
  static const String mainShellRoute = '/shared/main-shell';
  static const String manualPointsRoute = '/shared/manual-points';
  static const String notificationsRoute = '/shared/notifications';
  static const String pointsLedgerRoute = '/shared/points-ledger';
  static const String quranCycleRoute = '/shared/quran-cycle';
  static const String recordAwqafRoute = '/shared/record-awqaf';
  static const String recordMemorizationRoute = '/shared/record-memorization';
  static const String reportsRoute = '/shared/reports';
  static const String saberEntryRoute = '/shared/saber-entry';
  static const String staffMemorizationRoute = '/shared/staff-memorization';
  static const String studentAttendanceRoute = '/shared/student-attendance';
  static const String studentProgressRoute = '/shared/student-progress';
  static const String teacherAttendanceRoute = '/shared/teacher-attendance';
  static const String teacherAttendanceFormRoute =
      '/shared/teacher-attendance-form';
  static const String supervisorStudentDetailRoute =
      '/supervisor/supervisor-student-detail';

  static GoRouter buildRouter(GlobalKey<NavigatorState> navigatorKey) {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: splash,
      debugLogDiagnostics: false,
      routes: <RouteBase>[
        GoRoute(
          path: splash,
          name: 'splash',
          builder: (context, state) => const SplashScreen(),
        ),
        // /home يمرّ عبر شاشة البداية لأنها التي تحدد الجلسة والدور والشاشة المناسبة.
        GoRoute(
          path: home,
          name: 'home',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: login,
          name: 'login',
          pageBuilder: (context, state) => _fade(state, const LoginScreen()),
        ),
        GoRoute(
          path: activityDetailRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int activityId,
              String title
            });
            return ops_activities.ActivityDetailScreen(
                token: a.token, activityId: a.activityId, title: a.title);
          })(),
        ),
        GoRoute(
          path: activityExpenseFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int activityId,
              ActivityExpense? expense
            });
            return ops_activities.ActivityExpenseFormScreen(
                token: a.token, activityId: a.activityId, expense: a.expense);
          })(),
        ),
        GoRoute(
          path: activityPaymentFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, int activityId});
            return ops_activities.ActivityPaymentFormScreen(
                token: a.token, activityId: a.activityId);
          })(),
        ),
        GoRoute(
          path: assessmentDetailRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, int assessmentId});
            return AssessmentDetailScreen(
                token: a.token, assessmentId: a.assessmentId);
          })(),
        ),
        GoRoute(
          path: assessmentResultFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              AssessmentSummary assessment
            });
            return AssessmentResultFormScreen(
                token: a.token, assessment: a.assessment);
          })(),
        ),
        GoRoute(
          path: courseFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, CourseItem? course});
            return CourseFormScreen(token: a.token, course: a.course);
          })(),
        ),
        GoRoute(
          path: coursesRoute,
          builder: (context, state) =>
              CoursesScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: curriculaRoute,
          builder: (context, state) =>
              CurriculaScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: curriculumDetailRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int curriculumId,
              String title
            });
            return CurriculumDetailScreen(
                token: a.token, curriculumId: a.curriculumId, title: a.title);
          })(),
        ),
        GoRoute(
          path: enrollmentFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              EnrollmentRecord? enrollment,
              int? studentId,
              String? studentName,
              int? groupId,
              String? groupName
            });
            return EnrollmentFormScreen(
                token: a.token,
                enrollment: a.enrollment,
                studentId: a.studentId,
                studentName: a.studentName,
                groupId: a.groupId,
                groupName: a.groupName);
          })(),
        ),
        GoRoute(
          path: enrollmentsRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int? studentId,
              String? studentName,
              int? groupId,
              String? groupName
            });
            return EnrollmentsScreen(
                token: a.token,
                studentId: a.studentId,
                studentName: a.studentName,
                groupId: a.groupId,
                groupName: a.groupName);
          })(),
        ),
        GoRoute(
          path: financeRoute,
          builder: (context, state) =>
              FinanceScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: groupCurriculumRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              int curriculumId,
              int groupId,
              String groupName
            });
            return GroupCurriculumScreen(
                curriculumId: a.curriculumId,
                groupId: a.groupId,
                groupName: a.groupName);
          })(),
        ),
        GoRoute(
          path: groupDetailRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AdminGroupItem group, AuthToken token});
            return GroupDetailScreen(group: a.group, token: a.token);
          })(),
        ),
        GoRoute(
          path: groupFormRoute,
          builder: (context, state) => (() {
            final a =
                state.extra! as ({AuthToken token, AdminGroupDetail? group});
            return GroupFormScreen(token: a.token, group: a.group);
          })(),
        ),
        GoRoute(
          path: groupSchedulesRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, GroupItem group});
            return GroupSchedulesScreen(token: a.token, group: a.group);
          })(),
        ),
        GoRoute(
          path: invoiceItemFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, int invoiceId});
            return ops_invoices.InvoiceItemFormScreen(
                token: a.token, invoiceId: a.invoiceId);
          })(),
        ),
        GoRoute(
          path: invoicePaymentFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int invoiceId,
              double balance
            });
            return ops_invoices.InvoicePaymentFormScreen(
                token: a.token, invoiceId: a.invoiceId, balance: a.balance);
          })(),
        ),
        GoRoute(
          path: noteFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              StudentNoteItem? note,
              int? studentId,
              String? studentName
            });
            return NoteFormScreen(
                token: a.token,
                note: a.note,
                studentId: a.studentId,
                studentName: a.studentName);
          })(),
        ),
        GoRoute(
          path: parentFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              ParentItem? parent,
              String? initialFatherName
            });
            return ParentFormScreen(
                token: a.token,
                parent: a.parent,
                initialFatherName: a.initialFatherName);
          })(),
        ),
        GoRoute(
          path: parentsRoute,
          builder: (context, state) =>
              ParentsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: paymentsRoute,
          builder: (context, state) =>
              ops_invoices.PaymentsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: qrScannerRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int? groupId,
              String? groupName
            });
            return QrScannerScreen(
                token: a.token, groupId: a.groupId, groupName: a.groupName);
          })(),
        ),
        GoRoute(
          path: registrationFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int activityId,
              double defaultFee,
              ActivityRegistration? registration
            });
            return ops_activities.RegistrationFormScreen(
                token: a.token,
                activityId: a.activityId,
                defaultFee: a.defaultFee,
                registration: a.registration);
          })(),
        ),
        GoRoute(
          path: studentFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, int? studentId});
            return StudentFormScreen(token: a.token, studentId: a.studentId);
          })(),
        ),
        GoRoute(
          path: studentNotesRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              int? studentId,
              String? studentName
            });
            return StudentNotesScreen(
                token: a.token,
                studentId: a.studentId,
                studentName: a.studentName);
          })(),
        ),
        GoRoute(
          path: teacherFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, TeacherItem? teacher});
            return TeacherFormScreen(token: a.token, teacher: a.teacher);
          })(),
        ),
        GoRoute(
          path: teachersRoute,
          builder: (context, state) =>
              TeachersScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: studentPickerRoute,
          builder: (context, state) {
            final a = state.extra! as StudentPickerArgs;
            return StudentPickerScreen(
                token: a.token, title: a.title, onPicked: a.onPicked);
          },
        ),
        GoRoute(
          path: adminActivitiesRoute,
          builder: (context, state) =>
              ops_activities.ActivitiesScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: adminInvoiceDetailRoute,
          builder: (context, state) {
            final a = state.extra! as ({AuthToken token, int invoiceId});
            return ops_invoices.InvoiceDetailScreen(
                token: a.token, invoiceId: a.invoiceId);
          },
        ),
        GoRoute(
          path: activitiesRoute,
          builder: (context, state) => const ActivitiesScreen(),
        ),
        GoRoute(
          path: invoiceDetailRoute,
          builder: (context, state) =>
              InvoiceDetailScreen(invoiceId: state.extra as int),
        ),
        GoRoute(
          path: parentInvoicesRoute,
          builder: (context, state) => const ParentInvoicesScreen(),
        ),
        GoRoute(
          path: accountRoute,
          builder: (context, state) => const AccountScreen(),
        ),
        GoRoute(
          path: attendanceDayRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({AuthToken token, int dayId});
            return AttendanceDayScreen(token: a.token, dayId: a.dayId);
          })(),
        ),
        GoRoute(
          path: awqafTestsRoute,
          builder: (context, state) =>
              AwqafTestsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: mainShellRoute,
          pageBuilder: (context, state) =>
              _fade(state, MainShell(token: state.extra as AuthToken)),
        ),
        GoRoute(
          path: manualPointsRoute,
          builder: (context, state) =>
              ManualPointsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: notificationsRoute,
          builder: (context, state) =>
              NotificationsScreen(studentId: state.extra as int?),
        ),
        GoRoute(
          path: pointsLedgerRoute,
          builder: (context, state) =>
              PointsLedgerScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: quranCycleRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              QuranCycleKind kind,
              int cycleId
            });
            return QuranCycleScreen(
                token: a.token, kind: a.kind, cycleId: a.cycleId);
          })(),
        ),
        GoRoute(
          path: recordAwqafRoute,
          builder: (context, state) =>
              RecordAwqafScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: recordMemorizationRoute,
          builder: (context, state) =>
              RecordMemorizationScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: reportsRoute,
          builder: (context, state) =>
              ReportsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: saberEntryRoute,
          builder: (context, state) => (() {
            final a =
                state.extra! as ({AuthToken token, PickerItem? initialStudent});
            return SaberEntryScreen(
                token: a.token, initialStudent: a.initialStudent);
          })(),
        ),
        GoRoute(
          path: staffMemorizationRoute,
          builder: (context, state) =>
              StaffMemorizationScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: studentAttendanceRoute,
          builder: (context, state) =>
              StudentAttendanceScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: studentProgressRoute,
          builder: (context, state) => (() {
            final a =
                state.extra! as ({AuthToken token, StudentListItem student});
            return StudentProgressScreen(token: a.token, student: a.student);
          })(),
        ),
        GoRoute(
          path: teacherAttendanceRoute,
          builder: (context, state) =>
              TeacherAttendanceScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: teacherAttendanceFormRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              TeacherAttendanceDay? initialDay
            });
            return TeacherAttendanceFormScreen(
                token: a.token, initialDay: a.initialDay);
          })(),
        ),
        GoRoute(
          path: supervisorStudentDetailRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              int studentId,
              String studentName,
              AuthToken token
            });
            return SupervisorStudentDetail(
                studentId: a.studentId,
                studentName: a.studentName,
                token: a.token);
          })(),
        ),
        GoRoute(
          path: assessmentsRoute,
          builder: (context, state) =>
              AssessmentsScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: groupPickerRoute,
          builder: (context, state) =>
              GroupPickerScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: invoicesRoute,
          builder: (context, state) =>
              ops_invoices.InvoicesScreen(token: state.extra as AuthToken),
        ),
        GoRoute(
          path: quranTestsRoute,
          builder: (context, state) => (() {
            final a = state.extra! as ({
              AuthToken token,
              StudentListItem student,
              List<StudentEnrollmentInfo> enrollments
            });
            return QuranTestsScreen(
                token: a.token, student: a.student, enrollments: a.enrollments);
          })(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,
                  size: 48, color: context.appColors.error),
              const SizedBox(height: 16),
              Text(
                '${L10nGateway.current.pageNotFound}: ${state.uri}',
                textAlign: TextAlign.center,
                style: appTextStyle(
                    fontSize: FontSize.title, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go(splash),
                child: Text(L10nGateway.current.backToHome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
