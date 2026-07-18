/// أدوار التطبيق — المكان الوحيد الذي تُترجم فيه أسماء الأدوار القادمة من الـ API
/// (بالعربية أو الإنجليزية) إلى قيم ثابتة يستخدمها بقية الكود.
///
/// لإضافة دور جديد:
/// 1. أضف قيمة جديدة إلى الـ enum مع اسمها العربي.
/// 2. أضف أسماءه القادمة من الـ API إلى [_apiAliases].
/// 3. أضفه إلى [staffRoles] إذا كان دوراً إشرافياً.
/// 4. اربطه بالتبويبات/الويدجتس المناسبة في tab_registry.dart و home_widget_registry.dart.
enum AppRole {
  parent('ولي أمر'),
  student('طالب'),
  teacher('معلم'),
  admin('مشرف إداري'),
  supervisor('مشرف حلقة'),
  assistantSupervisor('مساعد مشرف حلقة'),
  reciter('مسمّع'),
  trialExamSupervisor('مشرف سبر تجريبي'),
  finalExamSupervisor('مشرف سير نهائي');

  /// الاسم المعروض للمستخدم.
  final String displayName;
  const AppRole(this.displayName);

  /// الأدوار الإشرافية (كل ما ليس ولي أمر / طالب).
  static const Set<AppRole> staffRoles = {
    admin,
    supervisor,
    assistantSupervisor,
    reciter,
    trialExamSupervisor,
    finalExamSupervisor,
    teacher,
  };

  /// خريطة أسماء الأدوار كما ترد من الـ API → دور التطبيق.
  static const Map<String, AppRole> _apiAliases = {
    'parent': parent,
    'student': student,
    'teacher': teacher,
    // إداري
    'admin': admin,
    'manager': admin,
    'super_admin': admin,
    'مشرف-إداري': admin,
    // مشرف حلقة
    'supervisor': supervisor,
    'مشرف-حلقة': supervisor,
    // مساعد مشرف حلقة
    'assistant_supervisor': assistantSupervisor,
    'مساعد-مشرف-حلقة': assistantSupervisor,
    // مسمّع
    'reciter': reciter,
    'مسمع': reciter,
    // مشرف سبر تجريبي
    'trial_exam_supervisor': trialExamSupervisor,
    'مشرف-سبر-تجريبي': trialExamSupervisor,
    // مشرف سير نهائي
    'final_exam_supervisor': finalExamSupervisor,
    'مشرف-سير-نهائي': finalExamSupervisor,
  };

  /// تحويل قائمة أدوار الـ API إلى مجموعة أدوار التطبيق
  /// (الأسماء غير المعروفة تُتجاهل بدل أن تكسر التطبيق).
  static Set<AppRole> fromApiStrings(Iterable<String> apiRoles) =>
      apiRoles.map((r) => _apiAliases[r]).whereType<AppRole>().toSet();
}
