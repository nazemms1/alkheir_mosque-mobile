/// معرّفات حالات الحضور (attendance_status_id) المطلوبة من الـ API لتسجيل
/// الحضور عبر مسح QR. لا يوجد endpoint لجلب هذه القائمة، لذا القيم ثابتة هنا
/// مؤقتاً حتى تُعرف قيمها الحقيقية من الباكاند — عدّلها هنا فقط عند معرفتها.
class AttendanceConfig {
  AttendanceConfig._();

  /// معرّف حالة "حاضر"
  static const String presentStatusId = '1';

  /// معرّف حالة "متأخر"
  static const String lateStatusId = '2';
}
