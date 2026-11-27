/// معرّفات حالات الحضور (attendance_status_id) المطلوبة من الـ API لتسجيل
/// الحضور عبر مسح QR. لا يوجد endpoint لجلب هذه القائمة، لذا القيم ثابتة هنا
/// مؤقتاً حتى تُعرف قيمها الحقيقية من الباكاند — عدّلها هنا فقط عند معرفتها.
///
/// ⚠️ هذه المعرّفات auto-increment وليست مضمونة الثبات بين التنصيبات — الـ
/// seeder الحالي (MasterDataSeeder) يُدرجها بالترتيب:
/// 1=present, 2=absent, 3=late, 4=excused, 5=early-leave.
/// المعرّف الثابت الوحيد فعلياً هو `code` (unique في قاعدة البيانات)، لكن لا
/// يوجد endpoint لجلب الحالات بالـ code حالياً. إن تغيّر ترتيب الإدراج على
/// أي تنصيب (seed جديد، حذف/إعادة إدراج، حالات إضافية) ستكسر هذه القيم من
/// جديد — الحل الدائم هو إضافة GET لقائمة حالات الحضور والمطابقة بالـ code.
class AttendanceConfig {
  AttendanceConfig._();

  /// معرّف حالة "حاضر" (code: present)
  static const String presentStatusId = '1';

  /// معرّف حالة "غائب" (code: absent)
  static const String absentStatusId = '2';

  /// معرّف حالة "متأخر" (code: late) — كان خطأً '2' (وهو فعلياً absent/غائب).
  static const String lateStatusId = '3';

  /// معرّف حالة "معتذر" (code: excused)
  static const String excusedStatusId = '4';

  /// معرّف حالة "مغادرة مبكرة بعذر" (code: early-leave، scope: student فقط)
  static const String earlyLeaveStatusId = '5';
}
