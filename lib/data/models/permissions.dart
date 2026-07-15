/// Named permission strings from the AlKhair Mobile API.
/// Mirrors the `Permission: ...` descriptions in the OpenAPI spec —
/// keep in sync with the backend's permission table.
class Permissions {
  Permissions._();

  static const reportsView = 'reports.view';

  static const studentsView = 'students.view';
  static const studentsCreate = 'students.create';
  static const studentsUpdate = 'students.update';
  static const studentsDelete = 'students.delete';

  static const groupsView = 'groups.view';
  static const groupsCreate = 'groups.create';
  static const groupsUpdate = 'groups.update';
  static const groupsDelete = 'groups.delete';

  static const enrollmentsView = 'enrollments.view';
  static const enrollmentsCreate = 'enrollments.create';
  static const enrollmentsUpdate = 'enrollments.update';
  static const enrollmentsDelete = 'enrollments.delete';

  static const assessmentsView = 'assessments.view';
  static const assessmentResultsView = 'assessment-results.view';
  static const assessmentResultsRecord = 'assessment-results.record';

  static const activitiesView = 'activities.view';
  static const activitiesResponsesView = 'activities.responses.view';
  static const activitiesResponsesRespond = 'activities.responses.respond';
  static const activitiesRegistrationsManage = 'activities.registrations.manage';
  static const activitiesPaymentsManage = 'activities.payments.manage';
  static const activitiesExpensesManage = 'activities.expenses.manage';

  static const invoicesView = 'invoices.view';
  static const invoicesUpdate = 'invoices.update';

  static const paymentsCreate = 'payments.create';
  static const paymentsVoid = 'payments.void';

  static const attendanceStudentTake = 'attendance.student.take';
  static const attendanceTeacherTake = 'attendance.teacher.take';

  static const memorizationView = 'memorization.view';
  static const memorizationRecord = 'memorization.record';

  static const quranTestsView = 'quran-tests.view';
  static const quranTestsRecord = 'quran-tests.record';
  static const quranAwqafTestsView = 'quran-awqaf-tests.view';
  static const quranAwqafTestsRecord = 'quran-awqaf-tests.record';

  static const pointsView = 'points.view';
  static const pointsCreateManual = 'points.create-manual';
  static const pointsVoid = 'points.void';
}
