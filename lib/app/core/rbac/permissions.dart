/// Named permission strings from the AlKhair Mobile API.
/// Mirrors the backend permission table (`students.view`, `finance.cash-box.view`...).
/// Keep in sync with the backend — screens gate on these names, never on roles.
/// المصدر: `routes/api.php` وصلاحيات `MobileNavigationService` في الباك إند.
class Permissions {
  Permissions._();

  static const reportsView = 'reports.view';

  static const studentsView = 'students.view';
  static const studentsCreate = 'students.create';
  static const studentsUpdate = 'students.update';
  static const studentsDelete = 'students.delete';
  static const studentsFilesManage = 'students.files.manage';
  static const studentsPhotoUpdate = 'students.photo.update';

  static const groupsView = 'groups.view';
  static const groupsCreate = 'groups.create';
  static const groupsUpdate = 'groups.update';
  static const groupsDelete = 'groups.delete';
  static const groupSchedulesManage = 'group-schedules.manage';

  static const enrollmentsView = 'enrollments.view';
  static const enrollmentsCreate = 'enrollments.create';
  static const enrollmentsUpdate = 'enrollments.update';
  static const enrollmentsDelete = 'enrollments.delete';

  static const parentsView = 'parents.view';
  static const parentsCreate = 'parents.create';
  static const parentsUpdate = 'parents.update';
  static const parentsDelete = 'parents.delete';

  static const teachersView = 'teachers.view';
  static const teachersCreate = 'teachers.create';
  static const teachersUpdate = 'teachers.update';
  static const teachersDelete = 'teachers.delete';

  static const coursesView = 'courses.view';
  static const coursesCreate = 'courses.create';
  static const coursesUpdate = 'courses.update';
  static const coursesDelete = 'courses.delete';

  static const assessmentsView = 'assessments.view';
  static const assessmentResultsView = 'assessment-results.view';
  static const assessmentResultsRecord = 'assessment-results.record';
  static const assessmentResultsRecordScores =
      'assessment-results.record-scores';

  static const activitiesView = 'activities.view';
  static const activitiesFinanceView = 'activities.finance.view';
  static const activitiesResponsesView = 'activities.responses.view';
  static const activitiesResponsesRespond = 'activities.responses.respond';
  static const activitiesRegistrationsManage =
      'activities.registrations.manage';
  static const activitiesPaymentsManage = 'activities.payments.manage';
  static const activitiesExpensesManage = 'activities.expenses.manage';

  static const invoicesView = 'invoices.view';
  static const invoicesUpdate = 'invoices.update';

  static const paymentsView = 'payments.view';
  static const paymentsCreate = 'payments.create';
  static const paymentsVoid = 'payments.void';

  static const attendanceStudentView = 'attendance.student.view';
  static const attendanceStudentTake = 'attendance.student.take';
  static const attendanceStudentToggleDayStatus =
      'attendance.student.toggle-day-status';
  static const attendanceTeacherView = 'attendance.teacher.view';
  static const attendanceTeacherTake = 'attendance.teacher.take';

  static const memorizationView = 'memorization.view';
  static const memorizationRecord = 'memorization.record';

  static const quranTestsView = 'quran-tests.view';
  static const quranTestsRecord = 'quran-tests.record';
  static const quranAwqafTestsView = 'quran-awqaf-tests.view';
  static const quranAwqafTestsRecord = 'quran-awqaf-tests.record';
  static const quranPartialTestsView = 'quran-partial-tests.view';
  static const quranPartialTestsRecord = 'quran-partial-tests.record';
  static const quranFinalTestsView = 'quran-final-tests.view';
  static const quranFinalTestsRecord = 'quran-final-tests.record';

  static const pointsView = 'points.view';
  static const pointsCreateManual = 'points.create-manual';
  static const pointsVoid = 'points.void';

  static const studentNotesView = 'student-notes.view';
  static const studentNotesCreate = 'student-notes.create';
  static const studentNotesUpdate = 'student-notes.update';
  static const studentNotesDelete = 'student-notes.delete';

  static const curriculaManage = 'curricula.manage';
  static const curriculaRecord = 'curricula.record';

  static const financeReportsView = 'finance.reports.view';
  static const financeCashBoxView = 'finance.cash-box.view';
  static const financeCashBoxAdjust = 'finance.cash-box.adjust';
  static const financeCashBoxTransfer = 'finance.cash-box.transfer';
  static const financeExchangeView = 'finance.exchange.view';
  static const financeExchangeCreate = 'finance.exchange.create';
  static const financePullRequestsView = 'finance.pull-requests.view';
  static const financeExpenseRequestsView = 'finance.expense-requests.view';
  static const financeRevenueRequestsView = 'finance.revenue-requests.view';
}
