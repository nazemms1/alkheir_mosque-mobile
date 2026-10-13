import '../../data/models/auth_token.dart';
import 'permissions.dart';

/// بوابات الوحدات — كل شاشة وتبويب وزر يسأل هنا بدل مقارنة أسماء الأدوار.
/// القرار مبني على الصلاحيات الفعلية القادمة من تسجيل الدخول (`user.permissions`).
abstract final class ModuleAccess {
  static bool _any(AuthToken t, List<String> permissions) =>
      permissions.any(t.hasPermission);

  // ─── الحساب والمؤشرات ───────────────────────────────────────────────────────
  static bool canViewReports(AuthToken t) =>
      t.hasPermission(Permissions.reportsView);

  // ─── المالية ───────────────────────────────────────────────────────────────
  static bool canViewCashBoxes(AuthToken t) => _any(t, const [
        Permissions.financeCashBoxView,
      ]);

  static bool canViewFinanceSummary(AuthToken t) => _any(t, const [
        Permissions.financeReportsView,
        Permissions.financeCashBoxView,
      ]);

  static bool canAdjustCash(AuthToken t) =>
      t.hasPermission(Permissions.financeCashBoxAdjust);

  static bool canTransferCash(AuthToken t) =>
      t.hasPermission(Permissions.financeCashBoxTransfer);

  static bool canViewExchanges(AuthToken t) =>
      t.hasPermission(Permissions.financeExchangeView);

  static bool canCreateExchange(AuthToken t) =>
      t.hasPermission(Permissions.financeExchangeCreate);

  static bool canViewFinanceRequests(AuthToken t) => _any(t, const [
        Permissions.financePullRequestsView,
        Permissions.financeExpenseRequestsView,
        Permissions.financeRevenueRequestsView,
      ]);

  static bool canViewFinance(AuthToken t) =>
      canViewFinanceSummary(t) ||
      canViewExchanges(t) ||
      canViewFinanceRequests(t);

  // ─── الأنشطة والفواتير والمدفوعات ─────────────────────────────────────────
  static bool canViewActivities(AuthToken t) =>
      t.hasPermission(Permissions.activitiesView);

  static bool canViewActivityFinance(AuthToken t) => _any(t, const [
        Permissions.activitiesFinanceView,
        Permissions.activitiesRegistrationsManage,
        Permissions.activitiesPaymentsManage,
        Permissions.activitiesExpensesManage,
      ]);

  static bool canManageRegistrations(AuthToken t) =>
      t.hasPermission(Permissions.activitiesRegistrationsManage);

  static bool canManageActivityPayments(AuthToken t) =>
      t.hasPermission(Permissions.activitiesPaymentsManage);

  static bool canManageActivityExpenses(AuthToken t) =>
      t.hasPermission(Permissions.activitiesExpensesManage);

  static bool canViewInvoices(AuthToken t) =>
      t.hasPermission(Permissions.invoicesView);

  static bool canUpdateInvoices(AuthToken t) =>
      t.hasPermission(Permissions.invoicesUpdate);

  static bool canViewPayments(AuthToken t) =>
      t.hasPermission(Permissions.paymentsView);

  static bool canCreatePayments(AuthToken t) =>
      t.hasPermission(Permissions.paymentsCreate);

  static bool canVoidPayments(AuthToken t) =>
      t.hasPermission(Permissions.paymentsVoid);

  // ─── الأولياء والمعلمون والكورسات ─────────────────────────────────────────
  static bool canViewParents(AuthToken t) =>
      t.hasPermission(Permissions.parentsView);

  static bool canCreateParents(AuthToken t) =>
      t.hasPermission(Permissions.parentsCreate);

  static bool canUpdateParents(AuthToken t) =>
      t.hasPermission(Permissions.parentsUpdate);

  static bool canDeleteParents(AuthToken t) =>
      t.hasPermission(Permissions.parentsDelete);

  static bool canViewTeachers(AuthToken t) =>
      t.hasPermission(Permissions.teachersView);

  static bool canCreateTeachers(AuthToken t) =>
      t.hasPermission(Permissions.teachersCreate);

  static bool canUpdateTeachers(AuthToken t) =>
      t.hasPermission(Permissions.teachersUpdate);

  static bool canDeleteTeachers(AuthToken t) =>
      t.hasPermission(Permissions.teachersDelete);

  static bool canViewCourses(AuthToken t) =>
      t.hasPermission(Permissions.coursesView);

  static bool canCreateCourses(AuthToken t) =>
      t.hasPermission(Permissions.coursesCreate);

  /// إنهاء الكورس وإعادة تفعيله يتطلبان `courses.update`.
  static bool canUpdateCourses(AuthToken t) =>
      t.hasPermission(Permissions.coursesUpdate);

  static bool canDeleteCourses(AuthToken t) =>
      t.hasPermission(Permissions.coursesDelete);

  static bool canCurricula(AuthToken t) => _any(t, const [
        Permissions.curriculaManage,
        Permissions.curriculaRecord,
      ]);

  // ─── الطلاب والحلقات والتسجيلات ───────────────────────────────────────────
  static bool canViewStudents(AuthToken t) =>
      t.hasPermission(Permissions.studentsView);

  static bool canCreateStudents(AuthToken t) =>
      t.hasPermission(Permissions.studentsCreate);

  static bool canUpdateStudents(AuthToken t) =>
      t.hasPermission(Permissions.studentsUpdate);

  static bool canDeleteStudents(AuthToken t) =>
      t.hasPermission(Permissions.studentsDelete);

  static bool canManageStudentFiles(AuthToken t) =>
      t.hasPermission(Permissions.studentsFilesManage);

  static bool canUpdateStudentPhoto(AuthToken t) =>
      t.hasPermission(Permissions.studentsPhotoUpdate);

  static bool canViewGroups(AuthToken t) =>
      t.hasPermission(Permissions.groupsView);

  static bool canCreateGroups(AuthToken t) =>
      t.hasPermission(Permissions.groupsCreate);

  static bool canUpdateGroups(AuthToken t) =>
      t.hasPermission(Permissions.groupsUpdate);

  static bool canDeleteGroups(AuthToken t) =>
      t.hasPermission(Permissions.groupsDelete);

  static bool canManageSchedules(AuthToken t) =>
      t.hasPermission(Permissions.groupSchedulesManage);

  static bool canViewEnrollments(AuthToken t) =>
      t.hasPermission(Permissions.enrollmentsView);

  static bool canCreateEnrollments(AuthToken t) =>
      t.hasPermission(Permissions.enrollmentsCreate);

  static bool canUpdateEnrollments(AuthToken t) =>
      t.hasPermission(Permissions.enrollmentsUpdate);

  static bool canDeleteEnrollments(AuthToken t) =>
      t.hasPermission(Permissions.enrollmentsDelete);

  // ─── الحضور ───────────────────────────────────────────────────────────────
  static bool canViewStudentAttendance(AuthToken t) =>
      t.hasPermission(Permissions.attendanceStudentView);

  static bool canTakeStudentAttendance(AuthToken t) =>
      t.hasPermission(Permissions.attendanceStudentTake);

  static bool canToggleAttendanceDay(AuthToken t) =>
      t.hasPermission(Permissions.attendanceStudentToggleDayStatus);

  static bool canViewTeacherAttendance(AuthToken t) =>
      t.hasPermission(Permissions.attendanceTeacherView);

  static bool canTakeTeacherAttendance(AuthToken t) =>
      t.hasPermission(Permissions.attendanceTeacherTake);

  static bool canViewAttendance(AuthToken t) =>
      canViewStudentAttendance(t) || canViewTeacherAttendance(t);

  // ─── الحفظ والاختبارات ───────────────────────────────────────────────────
  static bool canViewMemorization(AuthToken t) =>
      t.hasPermission(Permissions.memorizationView);

  static bool canRecordMemorization(AuthToken t) =>
      t.hasPermission(Permissions.memorizationRecord);

  static bool canViewAwqafTests(AuthToken t) => _any(t, const [
        Permissions.quranAwqafTestsView,
        Permissions.quranTestsView,
      ]);

  static bool canRecordAwqafTests(AuthToken t) => _any(t, const [
        Permissions.quranAwqafTestsRecord,
        Permissions.quranTestsRecord,
      ]);

  static bool canViewPartialTests(AuthToken t) =>
      t.hasPermission(Permissions.quranPartialTestsView);

  static bool canRecordPartialTests(AuthToken t) =>
      t.hasPermission(Permissions.quranPartialTestsRecord);

  static bool canViewFinalTests(AuthToken t) =>
      t.hasPermission(Permissions.quranFinalTestsView);

  static bool canRecordFinalTests(AuthToken t) =>
      t.hasPermission(Permissions.quranFinalTestsRecord);

  static bool canViewQuranTests(AuthToken t) =>
      canViewPartialTests(t) || canViewFinalTests(t);

  static bool canViewPoints(AuthToken t) =>
      t.hasPermission(Permissions.pointsView);

  static bool canAddManualPoints(AuthToken t) =>
      t.hasPermission(Permissions.pointsCreateManual);

  static bool canVoidPoints(AuthToken t) =>
      t.hasPermission(Permissions.pointsVoid);

  static bool canViewAssessments(AuthToken t) => _any(t, const [
        Permissions.assessmentsView,
        Permissions.assessmentResultsView,
      ]);

  /// تسجيل نتائج التقييم يتطلب الصلاحيتين معاً (كما في الباك إند).
  static bool canRecordAssessmentResults(AuthToken t) =>
      t.hasPermission(Permissions.assessmentResultsRecord) &&
      t.hasPermission(Permissions.assessmentResultsRecordScores);

  static bool canViewNotes(AuthToken t) =>
      t.hasPermission(Permissions.studentNotesView);

  static bool canCreateNotes(AuthToken t) =>
      t.hasPermission(Permissions.studentNotesCreate);

  static bool canUpdateNotes(AuthToken t) =>
      t.hasPermission(Permissions.studentNotesUpdate);

  static bool canDeleteNotes(AuthToken t) =>
      t.hasPermission(Permissions.studentNotesDelete);

  // ─── تجميع للتبويب الرئيسي ───────────────────────────────────────────────
  /// هل يملك المستخدم أي وحدة إدارية؟ يُستخدم لإظهار تبويب "الإدارة".
  static bool hasAnyModule(AuthToken t) =>
      canViewFinance(t) ||
      canViewActivities(t) ||
      canViewInvoices(t) ||
      canViewPayments(t) ||
      canViewParents(t) ||
      canViewTeachers(t) ||
      canViewCourses(t) ||
      canCurricula(t) ||
      canViewGroups(t) ||
      canViewEnrollments(t) ||
      canViewAttendance(t) ||
      canViewMemorization(t) ||
      canViewAwqafTests(t) ||
      canViewQuranTests(t) ||
      canViewPoints(t) ||
      canViewAssessments(t) ||
      canViewNotes(t) ||
      canViewReports(t) ||
      canViewStudents(t);
}
