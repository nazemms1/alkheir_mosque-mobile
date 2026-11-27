// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'مسجد الخير';

  @override
  String get errorsConnection =>
      'تعذر الاتصال. يرجى التحقق من اتصالك بالإنترنت.';

  @override
  String get errorsServer =>
      'حدث خطأ في الخادم. يرجى المحاولة مرة أخرى لاحقاً.';

  @override
  String get errorsUnknown => 'حدث خطأ غير متوقع.';

  @override
  String get errorsNotFound => 'المورد المطلوب غير موجود.';

  @override
  String get errorsUnauthorized =>
      'غير مصرح لك بالوصول. يرجى تسجيل الدخول مجدداً.';

  @override
  String get errorsForbidden => 'ليس لديك الصلاحية للوصول إلى هذا المحتوى.';

  @override
  String get errorsTimeout => 'انتهت مهلة الاتصال. يرجى إعادة المحاولة.';

  @override
  String get errorsBadRequest =>
      'طلب غير صالح. يرجى التحقق من البيانات المدخلة.';

  @override
  String get maintenanceRetry => 'إعادة المحاولة';

  @override
  String get generalCancel => 'إلغاء';

  @override
  String get generalSave => 'حفظ';

  @override
  String get aCourseWithLinkedRecords =>
      'لا يمكن حذف الكورس إذا كانت له سجلات مرتبطة.';

  @override
  String get aGroupCannotBeLeft => 'لا يمكن أن تبقى الحلقة بلا حصص.';

  @override
  String get aStudentWithEnrollmentsCannot =>
      'لا يمكن حذف الطالب إذا كان لديه تسجيلات. سيتم حذف ملفه الأكاديمي.';

  @override
  String get absences => 'الغياب';

  @override
  String get absences2 => 'غيابات';

  @override
  String get absent => 'غائب';

  @override
  String get absent2 => 'غياب';

  @override
  String get academicYear => 'السنة الدراسية';

  @override
  String get academicYear2 => 'العام الدراسي';

  @override
  String get accepted => 'مقبول';

  @override
  String get acceptedAmount => 'المبلغ المعتمد';

  @override
  String get account => 'الحساب';

  @override
  String get accountActive => 'الحساب نشط';

  @override
  String get accountDetails => 'بيانات الحساب';

  @override
  String get active => 'نشط';

  @override
  String get active2 => 'نشطة';

  @override
  String get active3 => 'فعّالة';

  @override
  String get active4 => 'فعّال';

  @override
  String get activeEnrollment => 'التسجيل النشط';

  @override
  String get activeEnrollments => 'التسجيلات النشطة';

  @override
  String get activeGroup => 'حلقة نشطة';

  @override
  String get activeGroups => 'الحلقات النشطة';

  @override
  String get activeGroups2 => 'حلقات نشطة';

  @override
  String get activeGroupsAndEnrolledStudent =>
      'الحلقات النشطة وعدد الطلاب المسجّلين';

  @override
  String get activeGroupsWillAppearHere =>
      'ستظهر الحلقات النشطة هنا فور إنشائها';

  @override
  String get activeStudents => 'الطلاب النشطون';

  @override
  String get activeStudentsQuickSearchBy =>
      'الطلاب النشطون وبحث سريع بالاسم أو الرقم';

  @override
  String get activities => 'الأنشطة';

  @override
  String get activitiesCollected => 'محصّل الأنشطة';

  @override
  String get activitiesExpenses => 'مصروفات الأنشطة';

  @override
  String get activitiesNet => 'صافي الأنشطة';

  @override
  String get add => 'إضافة';

  @override
  String get addExpense => 'إضافة مصروف';

  @override
  String get addGroup => 'إضافة حلقة';

  @override
  String get addItem => 'إضافة بند';

  @override
  String get addNew => 'إضافة جديد';

  @override
  String get addPhoto => 'إضافة صورة';

  @override
  String get addSession => 'إضافة حصة';

  @override
  String get additionalInformation => 'معلومات إضافية';

  @override
  String get address => 'العنوان';

  @override
  String get adjust => 'تسوية';

  @override
  String get adminDashboard => 'لوحة التحكم الإدارية';

  @override
  String get administration => 'إدارة';

  @override
  String get alKhairMosque => 'مسجد الخير';

  @override
  String get all => 'الكل';

  @override
  String get allOpenSessionsForYour =>
      'سيتم إلغاء كل الجلسات المفتوحة لحسابك على كل الأجهزة.';

  @override
  String get allowAParallelCycle => 'السماح بدورة موازية';

  @override
  String get amount => 'المبلغ';

  @override
  String amountBalance(Object p0) {
    return 'المبلغ (المتبقي $p0)';
  }

  @override
  String amountExceedsTheBalance(Object p0) {
    return 'المبلغ يتجاوز المتبقي ($p0)';
  }

  @override
  String get amountReceivedOptional => 'المبلغ المستلم (اختياري)';

  @override
  String get amountSent => 'المبلغ المرسل';

  @override
  String get anyNotesFromTheTeacher =>
      'ستظهر هنا أي ملاحظات من المعلم أو الإدارة';

  @override
  String get applyFilters => 'تطبيق الفلاتر';

  @override
  String areYouSureYouWant(Object p0) {
    return 'هل أنت متأكد من حذف \"$p0\"؟ لا يمكن التراجع عن هذا الإجراء.';
  }

  @override
  String get assessment => 'التقييم';

  @override
  String get assessmentResultsAndRecordingThem => 'نتائج التقييمات وتسجيلها';

  @override
  String get assessments => 'التقييمات';

  @override
  String get assessmentsAndCurricula => 'التقييم والمناهج';

  @override
  String get assessmentsAndExamsAndTheir => 'التقييمات والاختبارات ونتائجها';

  @override
  String get assessmentsStudentGroups => 'التقييمات (حلقات الطالب)';

  @override
  String get assessmentsTests => 'التقييمات والاختبارات';

  @override
  String get assistant => 'المساعد';

  @override
  String get assistingGroups => 'الحلقات المساندة';

  @override
  String get assistingTeacher => 'معلم مساعد';

  @override
  String get assistingTeacher2 => 'المعلم المساعد';

  @override
  String get attachments => 'المرفقات';

  @override
  String attempt(Object p0) {
    return 'المحاولة $p0';
  }

  @override
  String attemptMistakes(Object p0, Object p1, Object p2) {
    return 'محاولة $p0: $p1 خطأ · $p2';
  }

  @override
  String get attemptNumber => 'رقم المحاولة';

  @override
  String attempts(Object p0) {
    return 'المحاولات: $p0';
  }

  @override
  String get attempts2 => 'المحاولات';

  @override
  String attemptsRetakeS(Object p0, Object p1) {
    return '$p0 محاولات • $p1 إعادة';
  }

  @override
  String get attendance => 'الحضور';

  @override
  String get attendanceAndMemorization => 'الحضور والحفظ';

  @override
  String get attendanceDate => 'تاريخ الحضور';

  @override
  String get attendanceDay => 'يوم الحضور';

  @override
  String attendanceDayS(Object p0) {
    return '$p0 يوم حضور';
  }

  @override
  String get attendanceDays => 'أيام الحضور';

  @override
  String get attendanceDays2 => 'أيام حضور';

  @override
  String get attendanceDaysAndTakingA => 'أيام الحضور، وأخذ حضور الحلقة';

  @override
  String get attendanceForThisDayCan =>
      'سيُسمح بتعديل حضور هذا اليوم مرة أخرى.';

  @override
  String get attendanceLog => 'سجل الحضور';

  @override
  String get attendanceRate => 'نسبة الحضور';

  @override
  String get attendanceRecorded => 'تم تسجيل الحضور';

  @override
  String get attendanceRecords => 'سجلات الحضور';

  @override
  String get attendanceScan => 'مسح الحضور';

  @override
  String get attended => 'حضر';

  @override
  String get average => 'المتوسط';

  @override
  String get averageAssessment => 'متوسط التقييمات';

  @override
  String get averageScore => 'متوسط الدرجات';

  @override
  String get awardsPoints => 'يمنح نقاطاً';

  @override
  String get awqaf => 'أوقاف';

  @override
  String get awqafTest => 'سبر الأوقاف';

  @override
  String get awqafTests => 'اختبارات الأوقاف';

  @override
  String balance(Object p0) {
    return 'المتبقي: $p0';
  }

  @override
  String get blocked => 'موقوف';

  @override
  String get bonus => 'مكافأة';

  @override
  String get bonusPoints => 'نقاط المكافآت';

  @override
  String get callThisNumber => 'اتصال بالرقم';

  @override
  String get cancel => 'إلغاء';

  @override
  String get cancelled => 'ملغى';

  @override
  String get cancelsAllOpenSessionsFor =>
      'يُلغي كل الجلسات المفتوحة لهذا الحساب';

  @override
  String get cashBox => 'الصندوق';

  @override
  String get cashBoxes => 'الصناديق';

  @override
  String get cashBoxesLedgerTransfersAnd =>
      'الصناديق والسجل والتحويلات والطلبات';

  @override
  String get cashCollected => 'المحصّل نقداً';

  @override
  String get category => 'التصنيف';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changePhoto => 'تغيير الصورة';

  @override
  String get changeProfilePhoto => 'تغيير الصورة الشخصية';

  @override
  String get changeServerAddress => 'تغيير عنوان الخادم';

  @override
  String chapter(Object p0) {
    return 'الفصل $p0';
  }

  @override
  String get charactersMinimum => '8 أحرف على الأقل';

  @override
  String get charactersMinimumOrLeaveBlank =>
      '8 أحرف على الأقل، أو اتركها فارغة';

  @override
  String get choose => 'اختر…';

  @override
  String get chooseACashBox => 'اختر الصندوق';

  @override
  String get chooseACashBoxFirst => 'اختر الصندوق أولاً';

  @override
  String get chooseACurrency => 'اختر العملة';

  @override
  String get chooseADate => 'اختر التاريخ';

  @override
  String get chooseAGroupToView => 'اختر الحلقة لعرض تقدّمها';

  @override
  String get chooseAStudentFirst => 'اختر الطالب أولاً';

  @override
  String get chooseAnAcademicYear => 'اختر السنة الدراسية';

  @override
  String get chooseAnExpenseCategory => 'اختر تصنيف المصروف';

  @override
  String get chooseAssistingTeacher => 'اختر المعلم المساعد';

  @override
  String get chooseCategory => 'اختر التصنيف';

  @override
  String get chooseCourse => 'اختر الكورس';

  @override
  String get chooseCourse2 => 'اختر الدورة';

  @override
  String get chooseEnrollment => 'اختر التسجيل';

  @override
  String get chooseGradeLevel => 'اختر الصف';

  @override
  String get chooseGroup => 'اختر الحلقة';

  @override
  String get chooseJuz => 'اختر الجزء';

  @override
  String get chooseParent => 'اختر ولي الأمر';

  @override
  String get choosePaymentMethod => 'اختر طريقة الدفع';

  @override
  String get choosePointType => 'اختر نوع النقاط';

  @override
  String get chooseStudent => 'اختر الطالب';

  @override
  String get chooseTeacher => 'اختر المعلم';

  @override
  String get chooseTestType => 'اختر نوع الاختبار';

  @override
  String get chooseTheAttendanceTypeBefore => 'اختر نوع الحضور قبل بدء المسح';

  @override
  String get chooseTheTeacherWhoConducted => 'اختر المعلم الذي أجرى الاختبار';

  @override
  String get clearFilter => 'إلغاء التصفية';

  @override
  String get close => 'إغلاق';

  @override
  String get closeDay => 'إغلاق اليوم';

  @override
  String get closed => 'مغلق';

  @override
  String get collected => 'المحصّل';

  @override
  String collectedExpenses(Object p0, Object p1) {
    return 'المحصّل: $p0  ·  المصروفات: $p1';
  }

  @override
  String get completed => 'مكتمل';

  @override
  String get completedJuz => 'الأجزاء المكتملة';

  @override
  String get completionRate => 'نسبة الإنجاز';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get connectionTimedOutPleaseTry =>
      'انتهت مهلة الاتصال بالخادم. حاول مجدداً.';

  @override
  String get contactAdministration => 'التواصل مع الإدارة';

  @override
  String get contactAndAddress => 'التواصل والعنوان';

  @override
  String get contactDetails => 'بيانات التواصل';

  @override
  String get contactTheMosqueAdministration => 'تواصل مع إدارة المسجد';

  @override
  String get contactTheMosqueAdministrationVia =>
      'تواصل مع إدارة المسجد عبر واتساب للحصول على بيانات الدخول';

  @override
  String get contactViaWhatsapp => 'تواصل عبر واتساب';

  @override
  String get correction => 'تصحيح';

  @override
  String get couldNotConnectToServer =>
      'تعذّر الاتصال بالخادم (تم قطع الاتصال). يرجى التأكد من تشغيل الـ VPN على هاتفك أو التحقق من عنوان الخادم.';

  @override
  String get count => 'العدد';

  @override
  String get counterparty => 'الجهة';

  @override
  String get course => 'الكورس';

  @override
  String get course2 => 'المقرر';

  @override
  String get course3 => 'الدورة';

  @override
  String get courseDeleted => 'تم حذف الكورس';

  @override
  String get courseDetails => 'بيانات الكورس';

  @override
  String get courseFinished => 'تم إنهاء الكورس';

  @override
  String get courseFinishedReadOnlyRecord => 'الكورس منتهٍ — السجل للقراءة فقط';

  @override
  String get courseName => 'اسم الكورس';

  @override
  String get courseReactivated => 'تمت إعادة تفعيل الكورس';

  @override
  String get courseSettings => 'إعدادات الكورس';

  @override
  String get courses => 'الكورسات';

  @override
  String get createFinishAndReactivateCourses =>
      'إنشاء الكورسات وإنهاؤها وإعادة تفعيلها';

  @override
  String get createGroup => 'إنشاء الحلقة';

  @override
  String get currency => 'العملة';

  @override
  String get currencyExchange => 'صرف عملة';

  @override
  String get currentJuz => 'الجزء الحالي';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get currentlyMemorizing => 'يحفظ حالياً';

  @override
  String get curricula => 'المناهج';

  @override
  String get curriculum => 'المنهج';

  @override
  String get curriculumFiles => 'ملفات المنهج';

  @override
  String dAgo(Object p0) {
    return 'منذ $p0 ي';
  }

  @override
  String get darkMode => 'الوضع الليلي';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get date => 'التاريخ';

  @override
  String get dateOfBirth => 'تاريخ الميلاد';

  @override
  String get datesAndStatus => 'التواريخ والحالة';

  @override
  String get dayStatusUpdated => 'تم تحديث حالة اليوم';

  @override
  String daysAgo(Object p0) {
    return 'منذ $p0 أيام';
  }

  @override
  String get daysRecorded => 'أيام مسجّلة';

  @override
  String get declined => 'مرفوض';

  @override
  String get declined2 => 'اعتذر';

  @override
  String get defaultCourse => 'الكورس الافتراضي';

  @override
  String get delete => 'حذف';

  @override
  String get deleteCourse => 'حذف الكورس';

  @override
  String get deleteEnrollment => 'حذف التسجيل';

  @override
  String get deleteExpense => 'حذف المصروف';

  @override
  String get deleteFile => 'حذف الملف';

  @override
  String get deleteGroup => 'حذف الحلقة';

  @override
  String get deleteItem => 'حذف البند';

  @override
  String get deleteNote => 'حذف الملاحظة';

  @override
  String get deleteParent => 'حذف ولي الأمر';

  @override
  String get deletePhoto => 'حذف الصورة';

  @override
  String get deleteSession => 'حذف الحصة';

  @override
  String get deleteStudent => 'حذف الطالب';

  @override
  String get deleteTeacher => 'حذف المعلم';

  @override
  String get description => 'الوصف';

  @override
  String get discount => 'الخصم';

  @override
  String discount2(Object p0) {
    return 'الخصم: $p0';
  }

  @override
  String get doYouWantToSign => 'هل تريد تسجيل الخروج من هذا الجهاز؟';

  @override
  String get doYouWantToSign2 => 'هل تريد تسجيل الخروج من الحساب؟';

  @override
  String get download => 'تنزيل';

  @override
  String get downloadBooks => 'تحميل الكتب';

  @override
  String get dueDate => 'تاريخ الاستحقاق';

  @override
  String dueDate2(Object p0) {
    return 'تاريخ الاستحقاق: $p0';
  }

  @override
  String get duesPayments => 'المستحقات والدفعات';

  @override
  String get earlyDeparture => 'انصراف مبكر';

  @override
  String get earlyLeave => 'مغادرة مبكرة';

  @override
  String get edit => 'تعديل';

  @override
  String get editCourse => 'تعديل الكورس';

  @override
  String get editEnrollment => 'تعديل التسجيل';

  @override
  String get editExpense => 'تعديل المصروف';

  @override
  String get editGroup => 'تعديل الحلقة';

  @override
  String get editNote => 'تعديل الملاحظة';

  @override
  String get editParent => 'تعديل ولي الأمر';

  @override
  String get editSession => 'تعديل الحصة';

  @override
  String get editStudent => 'تعديل الطالب';

  @override
  String get editStudentDetails => 'تعديل بيانات الطالب';

  @override
  String get editTeacher => 'تعديل المعلم';

  @override
  String get editUsername => 'تعديل اسم المستخدم';

  @override
  String get educationalPortal => 'البوابة التعليمية';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailUsernamePhone => 'البريد / اسم المستخدم / الهاتف';

  @override
  String get enableOnlyAfterConfirmingThe =>
      'فعّله فقط بعد تأكيد أن الطالب لديه دورة مفتوحة وأنك تريد فتح أخرى.';

  @override
  String get endDate => 'تاريخ النهاية';

  @override
  String get endDate2 => 'تاريخ الانتهاء';

  @override
  String get endDateMustBeAfter =>
      'تاريخ النهاية يجب أن يكون بعد تاريخ البداية';

  @override
  String get ended => 'منتهية';

  @override
  String get ended2 => 'منتهي';

  @override
  String get enrollParticipant => 'تسجيل مشارك';

  @override
  String get enrollStudentsInGroupsAnd => 'تسجيل الطلاب في الحلقات وإنهاؤها';

  @override
  String get enrolledGroups => 'الحلقات المسجّل بها';

  @override
  String enrolledStudents(Object p0) {
    return 'الطلاب المسجّلون ($p0)';
  }

  @override
  String enrolledStudents2(Object p0) {
    return '$p0 طالب مسجّل';
  }

  @override
  String get enrollment => 'التسجيل';

  @override
  String get enrollmentDate => 'تاريخ الالتحاق';

  @override
  String get enrollmentDeleted => 'تم حذف التسجيل';

  @override
  String get enrollmentDetails => 'بيانات التسجيل';

  @override
  String get enrollmentOptional => 'التسجيل (اختياري)';

  @override
  String get enrollmentYear => 'سنة الالتحاق';

  @override
  String enrollments(Object p0) {
    return 'التسجيلات: $p0';
  }

  @override
  String get enrollmentsCount => 'عدد التسجيلات';

  @override
  String get enrollmentsPaymentsAndExpenses =>
      'التسجيلات والمدفوعات والمصروفات';

  @override
  String get enterADescriptionForThe => 'أدخل وصفاً للعملية';

  @override
  String get enterAMistakeCountBetween => 'أدخل عدد أخطاء بين 0 و 999';

  @override
  String get enterAQuantityAboveZero => 'أدخل كمية أكبر من صفر وسعراً صحيحاً';

  @override
  String get enterAScoreBetweenAnd => 'أدخل درجة بين 0 و 100';

  @override
  String get enterAValidAmountGreater => 'أدخل مبلغاً صحيحاً أكبر من صفر';

  @override
  String get enterAValidCapacityOf => 'أدخل سعة صحيحة أكبر من أو تساوي صفر';

  @override
  String get enterAValidFee => 'أدخل رسوماً صحيحة';

  @override
  String get enterAWholeNumberOther => 'أدخل عدداً صحيحاً غير صفري';

  @override
  String get enterYourEmailUsernameOr =>
      'أدخل بريدك أو اسم المستخدم أو رقم الهاتف';

  @override
  String get enteredBy => 'أدخلها';

  @override
  String get enteredOn => 'تاريخ القيد';

  @override
  String get entryType => 'نوع التسجيل';

  @override
  String get entryVoided => 'تم إلغاء القيد';

  @override
  String errors(Object p0) {
    return '$p0 أخطاء';
  }

  @override
  String get evaluation => 'تقييم';

  @override
  String get examiner => 'المختبِر';

  @override
  String get excellent => 'ممتاز';

  @override
  String get exchange => 'الصرف';

  @override
  String get exchangeDate => 'تاريخ الصرف';

  @override
  String excuseRecordedFor(Object p0) {
    return 'تم الاعتذار عن $p0';
  }

  @override
  String get excused => 'بعذر';

  @override
  String get excused2 => 'معتذر';

  @override
  String get excusedAbsence => 'غياب بعذر';

  @override
  String get expected => 'المتوقع';

  @override
  String get expenseDeleted => 'تم حذف المصروف';

  @override
  String get expenseRequest => 'طلب مصروف';

  @override
  String get expenses => 'المصروفات';

  @override
  String get expensesCount => 'عدد المصروفات';

  @override
  String get failed => 'راسب';

  @override
  String get failedFinalTests => 'اختبارات نهائية راسبة';

  @override
  String get failedPartialTests => 'اختبارات جزئية راسبة';

  @override
  String get father => 'الأب';

  @override
  String get fatherDetails => 'بيانات الأب';

  @override
  String get fatherName => 'اسم الأب';

  @override
  String feePaidBalance(Object p0, Object p1, Object p2) {
    return 'الرسوم: $p0  ·  المدفوع: $p1  ·  المتبقي: $p2';
  }

  @override
  String get fees => 'الرسوم';

  @override
  String get female => 'أنثى';

  @override
  String get fileDeleted => 'تم حذف الملف';

  @override
  String get fileSizeExceedsMb => 'حجم الملف يتجاوز 10 ميغابايت';

  @override
  String get fileType => 'نوع الملف';

  @override
  String get fileUploaded => 'تم رفع الملف';

  @override
  String get files => 'الملفات';

  @override
  String get finalPassed => 'نهائية ناجحة';

  @override
  String get finalRecitationTest => 'السير النهائي';

  @override
  String get finalTest => 'الاختبار النهائي';

  @override
  String get finalTest2 => 'السبر النهائي';

  @override
  String get finalTest3 => 'سبر نهائي';

  @override
  String get finalTestResults => 'نتائج السير النهائي';

  @override
  String get finance => 'المالية';

  @override
  String get finish => 'إنهاء';

  @override
  String get finishCourse => 'إنهاء الكورس';

  @override
  String get finished => 'منتهٍ';

  @override
  String get finishedOn => 'تاريخ الإنهاء';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get flash => 'الفلاش';

  @override
  String get forExampleBirthCertificateReport => 'مثل: شهادة ميلاد، تقرير، عقد';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get friday => 'الجمعة';

  @override
  String get from => 'من';

  @override
  String get fromCashBox => 'من صندوق';

  @override
  String get fromCurrency => 'من عملة';

  @override
  String get fromDate => 'من تاريخ';

  @override
  String get fromPage => 'من صفحة';

  @override
  String fromPageToPages(Object p0, Object p1, Object p2) {
    return 'من الصفحة $p0 إلى $p1  ·  $p2 صفحة';
  }

  @override
  String get fullMark => 'الدرجة الكاملة';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get gender => 'الجنس';

  @override
  String get general => 'عام';

  @override
  String get generalNotes => 'ملاحظات عامة';

  @override
  String get good => 'جيد';

  @override
  String get goodEvening => 'مساء الخير';

  @override
  String get goodMorning => 'صباح الخير';

  @override
  String get grade => 'الصف';

  @override
  String get gradeLevel => 'الصف الدراسي';

  @override
  String get gradeLevel2 => 'المستوى الدراسي';

  @override
  String get graduated => 'متخرّج';

  @override
  String get group => 'الحلقة';

  @override
  String get group2 => 'المجموعة';

  @override
  String get groupDetails => 'بيانات الحلقة';

  @override
  String get groupName => 'اسم الحلقة';

  @override
  String get groupProgress => 'تقدّم الحلقة';

  @override
  String get groupReports => 'تقارير الحلقة';

  @override
  String get groupSchedules => 'جداول الحلقات';

  @override
  String get groupStudents => 'طلاب الحلقة';

  @override
  String get groups => 'الحلقات';

  @override
  String get groups2 => 'المجموعات';

  @override
  String groups3(Object p0) {
    return 'الحلقات: $p0';
  }

  @override
  String get groupsEnrollmentsAssessmentsAndAttendance =>
      'ستُستعاد الحلقات والتسجيلات والتقييمات والحضور المرتبطة بالكورس.';

  @override
  String hAgo(Object p0) {
    return 'منذ $p0 س';
  }

  @override
  String get heard => 'تمّ سماعه';

  @override
  String get heardRecitationSessions => 'جلسات التلاوة المسموعة';

  @override
  String get helpSupport => 'المساعدة والدعم';

  @override
  String get hireDate => 'تاريخ التعيين';

  @override
  String get home => 'الرئيسية';

  @override
  String get homePhone => 'هاتف المنزل';

  @override
  String hoursAgo(Object p0) {
    return 'منذ $p0 ساعة';
  }

  @override
  String get ifLeftEmptyTheSystem =>
      'إن تُرك فارغاً يحسبه النظام من أسعار الصرف';

  @override
  String get importance => 'الأهمية';

  @override
  String get inProgress => 'قيد التقدم';

  @override
  String get inProgress2 => 'جارٍ';

  @override
  String get inTrialTest => 'في السبر التجريبي';

  @override
  String get inactive => 'غير نشط';

  @override
  String get inactive2 => 'غير نشطة';

  @override
  String get incoming => 'وارد';

  @override
  String get incomplete => 'غير مكتملة';

  @override
  String get incorrectLoginDetails => 'بيانات الدخول غير صحيحة';

  @override
  String get info => 'المعلومات';

  @override
  String get initializedInMainViaProviderscope =>
      'يُهيّأ في main() عبر ProviderScope.overrides';

  @override
  String get invalid => 'غير صحيح';

  @override
  String get invalidQrCode => 'رمز QR غير صالح';

  @override
  String get invoice => 'الفاتورة';

  @override
  String get invoiceDetails => 'تفاصيل الفاتورة';

  @override
  String get invoices => 'الفواتير';

  @override
  String get invoicesActivities => 'الفواتير والأنشطة';

  @override
  String get invoicesActivitiesAndCollection => 'الفواتير والأنشطة والتحصيل';

  @override
  String get invoicesCollected => 'محصّل الفواتير';

  @override
  String get issueDate => 'تاريخ الإصدار';

  @override
  String issueDate2(Object p0) {
    return 'تاريخ الإصدار: $p0';
  }

  @override
  String get issued => 'صادرة';

  @override
  String get item => 'عنصر';

  @override
  String get itemDeleted => 'تم حذف البند';

  @override
  String get items => 'العناصر';

  @override
  String get items2 => 'البنود';

  @override
  String get itemsPaymentsAndPaymentVoiding =>
      'البنود والمدفوعات وإلغاء الدفعات';

  @override
  String get jobTitle => 'المسمى الوظيفي';

  @override
  String get jpgPngOrWebpImage => 'صورة JPG أو PNG أو WebP';

  @override
  String juz(Object p0) {
    return 'الجزء $p0';
  }

  @override
  String get juz10 => 'الجزء السادس';

  @override
  String get juz11 => 'الجزء السابع';

  @override
  String get juz12 => 'الجزء الثامن';

  @override
  String get juz13 => 'الجزء التاسع';

  @override
  String get juz14 => 'الجزء العاشر';

  @override
  String get juz15 => 'الجزء الحادي عشر';

  @override
  String get juz16 => 'الجزء الثاني عشر';

  @override
  String get juz17 => 'الجزء الثالث عشر';

  @override
  String get juz18 => 'الجزء الرابع عشر';

  @override
  String get juz19 => 'الجزء الخامس عشر';

  @override
  String juz2(Object p0) {
    return 'ج $p0';
  }

  @override
  String get juz20 => 'الجزء السادس عشر';

  @override
  String get juz21 => 'الجزء السابع عشر';

  @override
  String get juz22 => 'الجزء الثامن عشر';

  @override
  String get juz23 => 'الجزء التاسع عشر';

  @override
  String get juz24 => 'الجزء العشرون';

  @override
  String get juz25 => 'الجزء الحادي والعشرون';

  @override
  String get juz26 => 'الجزء الثاني والعشرون';

  @override
  String get juz27 => 'الجزء الثالث والعشرون';

  @override
  String get juz28 => 'الجزء الرابع والعشرون';

  @override
  String get juz29 => 'الجزء الخامس والعشرون';

  @override
  String get juz3 => 'الجزء';

  @override
  String get juz30 => 'الجزء السادس والعشرون';

  @override
  String get juz31 => 'الجزء السابع والعشرون';

  @override
  String get juz32 => 'الجزء الثامن والعشرون';

  @override
  String get juz33 => 'الجزء التاسع والعشرون';

  @override
  String get juz34 => 'الجزء الثلاثون';

  @override
  String get juz4 => 'جزء';

  @override
  String get juz5 => 'الجزء الأول';

  @override
  String get juz6 => 'الجزء الثاني';

  @override
  String get juz7 => 'الجزء الثالث';

  @override
  String get juz8 => 'الجزء الرابع';

  @override
  String get juz9 => 'الجزء الخامس';

  @override
  String get juzCompleted => 'جزء مكتمل';

  @override
  String juzOfPages(Object p0, Object p1, Object p2) {
    return 'الجزء $p0  •  $p1 من $p2 صفحة';
  }

  @override
  String k(Object p0) {
    return '$p0ك';
  }

  @override
  String get lastName => 'اسم العائلة';

  @override
  String get lastRecitation => 'آخر تلاوة: ';

  @override
  String get late => 'متأخرة';

  @override
  String get late2 => 'متأخر';

  @override
  String get late3 => 'تأخر';

  @override
  String get leaveEmptyToUseThe => 'اتركه فارغاً لاستخدام الافتراضي';

  @override
  String get ledger => 'السجل';

  @override
  String get leftOn => 'تاريخ الخروج';

  @override
  String get lesson => 'الدرس';

  @override
  String lessons(Object p0) {
    return 'الدروس: $p0';
  }

  @override
  String get lessonsCompleted => 'الدروس المنجزة';

  @override
  String get lightMode => 'الوضع النهاري';

  @override
  String get loadMore => 'تحميل المزيد';

  @override
  String get loading => 'جارٍ التحميل...';

  @override
  String get localEquivalent => 'المعادل المحلي';

  @override
  String get loginAccount => 'حساب الدخول';

  @override
  String m(Object p0) {
    return '$p0م';
  }

  @override
  String get mainGroups => 'الحلقات الأساسية';

  @override
  String get male => 'ذكر';

  @override
  String get manageGroups => 'إدارة الحلقات';

  @override
  String get management => 'الإدارة';

  @override
  String get managementAndTeacherNotes => 'ملاحظات الإدارة والمعلمين';

  @override
  String get managementModulesBasedOnYour => 'الوحدات الإدارية حسب صلاحياتك';

  @override
  String get managementOnly => 'خاصة بالإدارة';

  @override
  String get manager => 'المدير';

  @override
  String get manual => 'يدوي';

  @override
  String get manualAdjustment => 'تسوية يدوية';

  @override
  String get manualPoints => 'نقاط يدوية';

  @override
  String get maximumCapacity => 'السعة القصوى';

  @override
  String get memorization => 'الحفظ';

  @override
  String get memorization2 => 'التسميع';

  @override
  String get memorizationAndReviewLogAnd =>
      'سجل الحفظ والمراجعة وتسجيل الصفحات';

  @override
  String get memorizationPoints => 'نقاط الحفظ';

  @override
  String get memorizationProgress => 'تقدم الحفظ';

  @override
  String get memorizationQuranTests => 'الحفظ واختبارات القرآن';

  @override
  String get memorizationRate => 'نسبة الحفظ';

  @override
  String get memorizationRecordedSuccessfully => 'تم تسجيل الحفظ بنجاح';

  @override
  String get memorizationRecords => 'سجلات الحفظ';

  @override
  String get memorizationSessions => 'جلسات الحفظ';

  @override
  String get memorized => 'المحفوظات';

  @override
  String get metric => 'مؤشر';

  @override
  String metrics(Object p0) {
    return '$p0 مؤشرات';
  }

  @override
  String minAgo(Object p0) {
    return 'منذ $p0 دقيقة';
  }

  @override
  String minAgo2(Object p0) {
    return 'منذ $p0 دق';
  }

  @override
  String get mistakeCount => 'عدد الأخطاء';

  @override
  String get modulesAvailable => 'وحدة متاحة';

  @override
  String get monday => 'الاثنين';

  @override
  String get monthlyFee => 'الرسوم الشهرية';

  @override
  String get more => 'المزيد';

  @override
  String get mother => 'الأم';

  @override
  String get motherDetails => 'بيانات الأم';

  @override
  String get motherName => 'اسم الأم';

  @override
  String get myAccount => 'حسابي';

  @override
  String get name => 'الاسم';

  @override
  String get needHelp => 'هل تحتاج مساعدة؟';

  @override
  String get needsImprovement => 'يحتاج تحسين';

  @override
  String get net => 'الصافي';

  @override
  String get newCourse => 'كورس جديد';

  @override
  String get newEnrollment => 'تسجيل جديد';

  @override
  String get newGroup => 'حلقة جديدة';

  @override
  String get newMemorization => 'حفظ جديد';

  @override
  String get newMemorizationRecord => 'تسجيل حفظ جديد';

  @override
  String get newNote => 'ملاحظة جديدة';

  @override
  String get newParent => 'ولي أمر جديد';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get newStudent => 'طالب جديد';

  @override
  String get newTeacher => 'معلم جديد';

  @override
  String get no => 'لا';

  @override
  String get noActiveEnrollmentForThis => 'لا يوجد تسجيل نشط لهذا الطالب';

  @override
  String get noActiveGroupsRightNow => 'لا توجد حلقات نشطة حالياً';

  @override
  String get noActiveStudentsInThis => 'لا يوجد طلاب نشطون في هذه الحلقة';

  @override
  String get noActiveTeachers => 'لا يوجد معلمون نشطون';

  @override
  String get noActivities => 'لا توجد أنشطة';

  @override
  String get noActivitiesAvailableRightNow => 'لا توجد أنشطة متاحة حالياً';

  @override
  String get noActivitiesRightNow => 'لا توجد أنشطة حالياً';

  @override
  String get noActivity => 'بدون نشاط';

  @override
  String get noActivityOnThisDay => 'لا يوجد نشاط لهذا اليوم';

  @override
  String get noAssessments => 'لا توجد تقييمات';

  @override
  String get noAssessmentsYet => 'لا توجد تقييمات حالياً';

  @override
  String get noAttemptsYet => 'لا توجد محاولات بعد';

  @override
  String get noAttendanceDaysRecorded => 'لا توجد أيام حضور مسجّلة';

  @override
  String get noAwqafTests => 'لا توجد اختبارات أوقاف';

  @override
  String get noBalancesYet => 'لا توجد أرصدة بعد';

  @override
  String get noCashBoxesAvailable => 'لا توجد صناديق متاحة';

  @override
  String get noCourse => 'بلا كورس';

  @override
  String get noDataForThisPeriod => 'لا توجد بيانات لهذه الفترة';

  @override
  String get noEnrollments => 'لا توجد تسجيلات';

  @override
  String get noExchanges => 'لا توجد عمليات صرف';

  @override
  String get noExpenses => 'لا توجد مصروفات';

  @override
  String get noFinalTestCyclesFor => 'لا توجد دورات اختبار نهائي لهذا الطالب';

  @override
  String get noGroups => 'لا توجد حلقات';

  @override
  String get noGroupsOnThisDay => 'لا توجد حلقات في هذا اليوم';

  @override
  String get noInvoices => 'لا توجد فواتير';

  @override
  String get noItems => 'لا توجد بنود';

  @override
  String get noJuzEligibleToStart => 'لا توجد أجزاء مؤهلة للبدء';

  @override
  String get noLedgerEntries => 'لا توجد حركات مالية';

  @override
  String get noLinkedGroups => 'لا توجد حلقات مرتبطة';

  @override
  String get noManagementModulesAreAvailable =>
      'لا توجد وحدات إدارية متاحة لحسابك';

  @override
  String get noMatchingCourses => 'لا توجد كورسات مطابقة';

  @override
  String get noMatchingCurricula => 'لا توجد مناهج مطابقة';

  @override
  String get noMemorizationRecords => 'لا توجد سجلات حفظ';

  @override
  String get noMessagesYet => 'لا توجد رسائل بعد';

  @override
  String get noNotes => 'لا توجد ملاحظات';

  @override
  String get noParentsMatchTheSearch => 'لا يوجد أولياء مطابقون للبحث';

  @override
  String get noPartialTestCyclesFor => 'لا توجد دورات اختبار جزئي لهذا الطالب';

  @override
  String get noPartsForThisCycle => 'لا توجد مقاطع لهذه الدورة';

  @override
  String get noPayments => 'لا توجد مدفوعات';

  @override
  String get noPaymentsRecorded => 'لا توجد دفعات مسجّلة';

  @override
  String get noPointEntries => 'لا توجد قيود نقاط';

  @override
  String get noPointsYet => 'لا توجد نقاط بعد';

  @override
  String get noRecitationSessionsYet => 'لا توجد جلسات تلاوة بعد';

  @override
  String get noRecords => 'لا توجد سجلات';

  @override
  String get noRecordsForThisStudent => 'لا توجد تسجيلات لهذا الطالب';

  @override
  String get noRecordsMatchThisFilter => 'لا توجد سجلات لهذا الفلتر';

  @override
  String get noRegisteredStudents => 'لا يوجد طلاب مسجّلون';

  @override
  String get noRegistrationsForThisActivity => 'لا توجد تسجيلات لهذا النشاط';

  @override
  String get noRequests => 'لا توجد طلبات';

  @override
  String get noResults => 'لا توجد نتائج';

  @override
  String noResultsFor(Object p0) {
    return 'لا توجد نتائج لـ \"$p0\"';
  }

  @override
  String get noResultsRecordedYet => 'لا توجد نتائج مسجّلة بعد';

  @override
  String get noSelection => 'بلا اختيار';

  @override
  String get noSessionsForThisGroup => 'لا توجد حصص لهذه الحلقة';

  @override
  String get noStudents => 'لا يوجد طلاب';

  @override
  String get noStudentsEnrolledYet => 'لا يوجد طلاب مسجّلون بعد';

  @override
  String get noStudentsInThisGroup => 'لا يوجد طلاب في الحلقة';

  @override
  String get noStudentsMatchTheSearch => 'لا يوجد طلاب مطابقون للبحث';

  @override
  String get noStudentsRegisteredInThis => 'لا يوجد طلاب مسجّلون في هذه الحلقة';

  @override
  String get noSubjectsInThisCurriculum => 'لا توجد مواد في هذا المنهج';

  @override
  String get noTeacherAttendanceDays => 'لا توجد أيام حضور للمعلمين';

  @override
  String get noTeacherListAvailable => 'لا توجد قائمة معلمين متاحة';

  @override
  String get noTeachersMatchTheSearch => 'لا يوجد معلمون مطابقون للبحث';

  @override
  String get noTestRecords => 'لا توجد سجلات سبر';

  @override
  String get noTransfers => 'لا توجد تحويلات';

  @override
  String get noUploadedFiles => 'لا توجد ملفات مرفوعة';

  @override
  String get notAvailable => 'غير متاح';

  @override
  String get notHeardYet => 'لم يُسمَع بعد';

  @override
  String get notSpecified => 'غير محدد';

  @override
  String get notStarted => 'لم يبدأ';

  @override
  String get notTaught => 'لم يُدرَّس';

  @override
  String get noteDate => 'تاريخ الملاحظة';

  @override
  String get noteDeleted => 'تم حذف الملاحظة';

  @override
  String noteS(Object p0) {
    return '$p0 ملاحظة';
  }

  @override
  String get noteText => 'نص الملاحظة';

  @override
  String get notes => 'ملاحظات';

  @override
  String get notes2 => 'الملاحظات';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get numberOfChildren => 'عدد الأبناء';

  @override
  String get numberOfEntries => 'عدد الإدخالات';

  @override
  String get numberOfGroups => 'عدد الحلقات';

  @override
  String get numberOfInvoices => 'عدد الفواتير';

  @override
  String get numberOfStudents => 'عدد الطلاب';

  @override
  String get numberOfTeachers => 'عدد المعلمين';

  @override
  String ofPages(Object p0) {
    return 'من $p0 صفحة';
  }

  @override
  String ofPagesCurrentlyMemorizing(Object p0, Object p1, Object p2) {
    return '$p0 من $p1 صفحة • يحفظ حالياً: $p2';
  }

  @override
  String ofTheHolyQuran(Object p0) {
    return '$p0% من القرآن الكريم';
  }

  @override
  String get open => 'مفتوح';

  @override
  String get open2 => 'فتح';

  @override
  String get openDay => 'فتح اليوم';

  @override
  String outOfSchoolDays(Object p0) {
    return 'من إجمالي $p0 يوم دراسي';
  }

  @override
  String get outgoing => 'صادر';

  @override
  String get overview => 'نظرة عامة';

  @override
  String get overviewTeachersSummary => 'نظرة عامة وملخص المعلمين';

  @override
  String get overviewWithFiltersAndDaily =>
      'نظرة عامة بالفلاتر وملخص المعلمين اليومي';

  @override
  String p(Object p0, Object p1) {
    return 'ص $p0 – $p1';
  }

  @override
  String p2(Object p0) {
    return 'ص $p0';
  }

  @override
  String p3(Object p0) {
    return '$p0 ص';
  }

  @override
  String p4(Object p0, Object p1, Object p2) {
    return 'ص $p0–$p1 — $p2';
  }

  @override
  String get pageRange => 'نطاق الصفحات';

  @override
  String pages(Object p0) {
    return 'صفحات: $p0';
  }

  @override
  String pages2(Object p0) {
    return '$p0 صفحة';
  }

  @override
  String get pages3 => 'الصفحات';

  @override
  String get pagesNotYetHeard => 'الصفحات التي لم تُسمَع';

  @override
  String pagesPages(Object p0, Object p1, Object p2) {
    return 'صفحات $p0 – $p1 ($p2 صفحة)';
  }

  @override
  String get pagesTested => 'الصفحات التي تم سبرها:';

  @override
  String get paid => 'المدفوع';

  @override
  String get paid2 => 'مدفوعة';

  @override
  String get paid3 => 'مدفوع';

  @override
  String paidBalance(Object p0, Object p1) {
    return 'المدفوع: $p0  ·  المتبقي: $p1';
  }

  @override
  String get parent => 'ولي الأمر';

  @override
  String parent2(Object p0) {
    return 'ولي الأمر: $p0';
  }

  @override
  String parent3(Object p0) {
    return 'ولي أمر: $p0';
  }

  @override
  String get parent4 => 'ولي أمر';

  @override
  String parent5(Object p0) {
    return 'ولي أمر\n$p0';
  }

  @override
  String get parentAndGrade => 'ولي الأمر والصف';

  @override
  String get parentDeleted => 'تم حذف ولي الأمر';

  @override
  String get parentDetails => 'بيانات ولي الأمر';

  @override
  String get parentFilesAndAccounts => 'ملفات أولياء الأمور وحساباتهم';

  @override
  String parentNumber(Object p0) {
    return 'رقم الوالد: $p0';
  }

  @override
  String get parentStudentInformation => 'معلومات ولي الأمر والطالب';

  @override
  String get parents => 'الأولياء';

  @override
  String part(Object p0) {
    return 'المقطع $p0';
  }

  @override
  String get partial => 'جزئي';

  @override
  String get partialAndFinalQuranTests =>
      'الاختبارات الجزئية والنهائية لكل طالب';

  @override
  String get partialPassed => 'جزئية ناجحة';

  @override
  String get partialTest => 'الاختبار الجزئي';

  @override
  String get partlyTaught => 'مُدرَّس جزئياً';

  @override
  String partsOfPassed(Object p0) {
    return 'المقاطع: $p0 من 4 ناجحة';
  }

  @override
  String get partsOfTheHolyQuran => 'أجزاء القرآن الكريم';

  @override
  String get passed => 'ناجح';

  @override
  String passedOn(Object p0) {
    return 'تاريخ النجاح: $p0';
  }

  @override
  String get passedOn2 => 'تاريخ النجاح';

  @override
  String get passedTest => 'سبر ناجح';

  @override
  String get passedTheTest => 'اجتاز السبر بنجاح';

  @override
  String get passingScore => 'درجة النجاح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get passwordChanged => 'تم تغيير كلمة المرور';

  @override
  String get passwordIsTooShort => 'كلمة المرور قصيرة جداً';

  @override
  String get passwordMustBeAtLeast =>
      'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get paymentDate => 'تاريخ الدفع';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get paymentVoided => 'تم إلغاء الدفعة';

  @override
  String get payments => 'الدفعات';

  @override
  String get payments2 => 'المدفوعات';

  @override
  String get paymentsCount => 'عدد المدفوعات';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get pending2 => 'معلّق';

  @override
  String get pendingRequests => 'طلبات معلّقة';

  @override
  String get percentage => 'النسبة';

  @override
  String get personalDetailsPasswordAndPhoto =>
      'البيانات الشخصية وكلمة المرور والصورة';

  @override
  String get personalDetailsPasswordAndSessions =>
      'البيانات الشخصية وكلمة المرور والجلسات';

  @override
  String get phone => 'الهاتف';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get photoDeleted => 'تم حذف الصورة';

  @override
  String get pleaseEnterYourPassword => 'يرجى إدخال كلمة المرور';

  @override
  String get pleaseSelectAStudentFirst => 'الرجاء اختيار الطالب أولاً';

  @override
  String get point => 'نقطة';

  @override
  String pointS(Object p0) {
    return '$p0 نقطة';
  }

  @override
  String get pointType => 'نوع النقاط';

  @override
  String get points => 'النقاط';

  @override
  String get points2 => 'عدد النقاط';

  @override
  String get pointsAssessments => 'النقاط والتقييمات';

  @override
  String get pointsLog => 'سجل النقاط';

  @override
  String get pointsManualPointsAndVoiding =>
      'النقاط، والنقاط اليدوية، وإلغاء القيود';

  @override
  String pointsPages(Object p0, Object p1) {
    return 'النقاط: $p0  ·  الصفحات: $p1';
  }

  @override
  String get positiveToAddNegativeTo => 'موجب للإضافة وسالب للخصم';

  @override
  String get present => 'حاضر';

  @override
  String get present2 => 'حضور';

  @override
  String get profilePhotoUpdated => 'تم تحديث الصورة الشخصية';

  @override
  String get progress => 'التقدم';

  @override
  String get pullRequest => 'طلب سحب';

  @override
  String get quantity => 'الكمية';

  @override
  String get quranTests => 'اختبارات القرآن';

  @override
  String get reactivate => 'إعادة التفعيل';

  @override
  String get reactivateCourse => 'إعادة تفعيل الكورس';

  @override
  String get reason => 'السبب';

  @override
  String get recentAssessments => 'آخر التقييمات';

  @override
  String get recentNotifications => 'آخر الإشعارات';

  @override
  String get recentStudents => 'آخر الطلاب';

  @override
  String get recentTestResults => 'آخر نتائج السبر';

  @override
  String get recentlyRegisteredStudents => 'آخر الطلاب المسجّلين';

  @override
  String get recitation => 'التلاوة';

  @override
  String get recordAndViewAwqafTests => 'تسجيل اختبارات الأوقاف وعرضها';

  @override
  String get recordAttempt => 'تسجيل محاولة';

  @override
  String recordAttemptPart(Object p0) {
    return 'تسجيل محاولة - المقطع $p0';
  }

  @override
  String get recordAwqafTest => 'تسجيل اختبار أوقاف';

  @override
  String get recordFinalAttempt => 'تسجيل محاولة نهائية';

  @override
  String get recordMemorization => 'تسجيل حفظ';

  @override
  String get recordPayment => 'تسجيل دفعة';

  @override
  String get recordResult => 'تسجيل نتيجة';

  @override
  String get recordTeacherAttendance => 'تسجيل حضور المعلمين';

  @override
  String get recordTeacherAttendanceForEach => 'تسجيل حضور المعلمين لكل يوم';

  @override
  String get recordTest => 'تسجيل اختبار';

  @override
  String get recordedResults => 'النتائج المسجّلة';

  @override
  String get recordingAttendance => 'جارٍ تسجيل الحضور...';

  @override
  String records(Object p0) {
    return 'السجلات: $p0';
  }

  @override
  String get recordsActivities => 'تسجيل وأنشطة';

  @override
  String get referenceNumber => 'رقم المرجع';

  @override
  String regarding(Object p0) {
    return 'بخصوص: $p0';
  }

  @override
  String get register => 'تسجيل';

  @override
  String register2(Object p0) {
    return 'تسجيل: $p0';
  }

  @override
  String get registered => 'مسجّل';

  @override
  String registered2(Object p0) {
    return 'تم تسجيل $p0';
  }

  @override
  String get registered3 => 'مسجَّل';

  @override
  String get registrationFailed => 'فشل التسجيل';

  @override
  String get registrations => 'التسجيلات';

  @override
  String get remaining => 'المتبقي';

  @override
  String get rememberMe => 'تذكّرني';

  @override
  String get reports => 'التقارير';

  @override
  String get requestedAmount => 'المبلغ المطلوب';

  @override
  String get requestedBy => 'مقدّم الطلب';

  @override
  String get requests => 'الطلبات';

  @override
  String get required => 'مطلوب';

  @override
  String get result => 'النتيجة';

  @override
  String resultS(Object p0) {
    return '$p0 نتيجة';
  }

  @override
  String results(Object p0) {
    return 'النتائج: $p0';
  }

  @override
  String get results2 => 'النتائج';

  @override
  String get resumeScanning => 'استئناف المسح';

  @override
  String get returnRequest => 'طلب إرجاع';

  @override
  String get returned => 'أُعيد';

  @override
  String get revenueRequest => 'طلب إيراد';

  @override
  String get review => 'مراجعة';

  @override
  String get reviewNotes => 'ملاحظات المراجعة';

  @override
  String get reviewedBy => 'المراجِع';

  @override
  String get role => 'الدور';

  @override
  String get saturday => 'السبت';

  @override
  String get save => 'حفظ';

  @override
  String get saveAttempt => 'حفظ المحاولة';

  @override
  String get saveChanges => 'حفظ التعديلات';

  @override
  String get savePayment => 'حفظ الدفعة';

  @override
  String get saveRecord => 'حفظ التسجيل';

  @override
  String get savedPage => 'صفحة محفوظة';

  @override
  String get savedPages => 'الصفحات المحفوظة';

  @override
  String get savedPages2 => 'صفحات محفوظة';

  @override
  String get saving => 'جارٍ الحفظ';

  @override
  String get scan => 'مسح';

  @override
  String get scanQrCode => 'مسح رمز QR';

  @override
  String get scanTheStudentQrCode => 'مسح رمز QR للطالب';

  @override
  String get scanningPaused => 'المسح متوقف مؤقتاً';

  @override
  String get school => 'المدرسة';

  @override
  String get schoolName => 'اسم المدرسة';

  @override
  String scoreBetweenAnd(Object p0) {
    return 'الدرجة بين 0 و $p0';
  }

  @override
  String get scoreOptional => 'الدرجة (اختياري)';

  @override
  String scoreOutOf(Object p0) {
    return 'الدرجة (من $p0)';
  }

  @override
  String get scoreOutOf2 => 'الدرجة (من 100)';

  @override
  String get screensForThisRoleAre => 'شاشات هذا الدور قيد الإنشاء';

  @override
  String get search => 'ابحث…';

  @override
  String get searchByCourseName => 'بحث باسم الكورس';

  @override
  String get searchByCurriculumName => 'بحث باسم المنهج';

  @override
  String get searchByNameOrPhone => 'بحث بالاسم أو رقم الهاتف';

  @override
  String get searchByNameOrStudent => 'بحث بالاسم أو رقم الطالب';

  @override
  String get searchByStudentNameOr => 'بحث باسم الطالب أو الرقم...';

  @override
  String get sections => 'الأقسام';

  @override
  String get selectedGroup => 'حلقة محددة';

  @override
  String get send => 'إرسال';

  @override
  String serverError(Object p0) {
    return 'خطأ في الخادم ($p0)';
  }

  @override
  String get sessionDeleted => 'تم حذف الحصة';

  @override
  String get sessionLog => 'سجل الجلسة';

  @override
  String get sessions => 'الجلسات';

  @override
  String get sessionsAndTimesForEach => 'حصص كل حلقة وأوقاتها';

  @override
  String get settled => 'مُسوّى';

  @override
  String get sharedCurrency => 'العملة المشتركة';

  @override
  String get sharedInternally => 'مشتركة داخلياً';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get signOutEverywhere => 'الخروج من الكل';

  @override
  String get signOutOfAllDevices => 'الخروج من كل الأجهزة';

  @override
  String get signOutOfThisDevice => 'تسجيل الخروج من هذا الجهاز';

  @override
  String get singleAttempt => 'محاولة واحدة';

  @override
  String get somethingWentWrong => 'حدث خطأ';

  @override
  String get somethingWentWrongPleaseTry => 'حدث خطأ، حاول مرة أخرى';

  @override
  String get source => 'المصدر';

  @override
  String get stage => 'المرحلة';

  @override
  String stage2(Object p0) {
    return 'المرحلة $p0';
  }

  @override
  String get startDate => 'تاريخ البداية';

  @override
  String get startDate2 => 'تاريخ البدء';

  @override
  String startTest(Object p0) {
    return 'بدء اختبار $p0';
  }

  @override
  String get startTest2 => 'بدء الاختبار';

  @override
  String get status => 'الحالة';

  @override
  String get student => 'الطالب';

  @override
  String get student2 => 'طالب';

  @override
  String get studentAndGroup => 'الطالب والحلقة';

  @override
  String get studentAttendance => 'حضور الطلاب';

  @override
  String get studentAttendanceLog => 'سجل حضور الطلاب';

  @override
  String get studentCard => 'بطاقة الطالب';

  @override
  String get studentDeleted => 'تم حذف الطالب';

  @override
  String get studentDetails => 'بيانات الطالب';

  @override
  String get studentFile => 'ملف الطالب';

  @override
  String get studentGroupNotes => 'ملاحظات الطلاب والحلقة';

  @override
  String get studentList => 'قائمة الطلاب';

  @override
  String get studentNotes => 'ملاحظات الطلاب';

  @override
  String get studentNumber => 'رقم الطالب';

  @override
  String get studentOptional => 'الطالب (اختياري)';

  @override
  String get studentPhotoUpdated => 'تم تحديث صورة الطالب';

  @override
  String get studentPoints => 'نقاط الطلاب';

  @override
  String get studentProgress => 'تقدّم الطلاب';

  @override
  String get studentSummary => 'ملخص الطالب';

  @override
  String get students => 'الطلاب';

  @override
  String students2(Object p0) {
    return 'عدد الطلاب: $p0';
  }

  @override
  String students3(Object p0) {
    return '$p0 طالب';
  }

  @override
  String get studentsAndGroups => 'الطلاب والحلقات';

  @override
  String subPart(Object p0) {
    return 'الجزء الفرعي $p0';
  }

  @override
  String get subParts => 'الأجزاء الفرعية';

  @override
  String subjects(Object p0) {
    return 'المواد: $p0';
  }

  @override
  String get subjectsLessonsGroupProgressAnd =>
      'المواد والدروس وتقدّم الحلقات وملفات PDF';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get summary => 'الملخص';

  @override
  String get sunday => 'الأحد';

  @override
  String get supervisor => 'المشرف';

  @override
  String get switchLanguage => 'تبديل اللغة';

  @override
  String get switchToArabic => 'التبديل إلى العربية';

  @override
  String get switchToDarkTheme => 'التبديل إلى المظهر الداكن';

  @override
  String get switchToEnglish => 'التبديل إلى الإنجليزية';

  @override
  String get switchToLightTheme => 'التبديل إلى المظهر الفاتح';

  @override
  String get system => 'النظام';

  @override
  String get system2 => 'نظام';

  @override
  String get tContinue => 'متابعة';

  @override
  String get tDefault => 'افتراضي';

  @override
  String get tFinal => 'نهائي';

  @override
  String tNew(Object p0) {
    return '$p0 جديد';
  }

  @override
  String get takeAScreenshotToSave =>
      'يمكنك تصوير الشاشة لحفظ بطاقتك كـ Pass لاستخدامها في الحلقة.';

  @override
  String get takeAttendance => 'أخذ الحضور';

  @override
  String get targetGroups => 'المجموعات المستهدفة';

  @override
  String get taught => 'مُدرَّس';

  @override
  String get teacher => 'المعلم';

  @override
  String get teacher2 => 'معلم';

  @override
  String get teacherAdministration => 'المعلم والإدارة';

  @override
  String get teacherAttendance => 'حضور المعلمين';

  @override
  String get teacherBreakdown => 'تفصيل المعلمين';

  @override
  String get teacherDeleted => 'تم حذف المعلم';

  @override
  String get teacherDetails => 'بيانات المعلم';

  @override
  String get teacherFilesAccountsAndCourses =>
      'ملفات المعلمين وحساباتهم وكورساتهم';

  @override
  String get teacherName => 'اسم المعلم';

  @override
  String get teacherOnly => 'خاصة بالمعلم';

  @override
  String get teachers => 'المعلمون';

  @override
  String get teachersInScope => 'المعلمون المشمولون';

  @override
  String get teachersSummary => 'ملخص المعلمين';

  @override
  String get test => 'سبر';

  @override
  String test2(Object p0) {
    return 'سبر $p0';
  }

  @override
  String get testDate => 'تاريخ الاختبار';

  @override
  String get testDetails => 'تفاصيل الاختبار';

  @override
  String get testLog => 'سجل السبر';

  @override
  String get testType => 'نوع الاختبار';

  @override
  String get tests => 'الاختبارات';

  @override
  String get pageNotFound => 'الصفحة غير موجودة';

  @override
  String get testEntry => 'إدخال سبر';

  @override
  String get testEntrySubtitle => 'تسجيل سبر الأرباع والأجزاء والطلاب';

  @override
  String get invalidPhoneNumber => 'رقم الهاتف غير صحيح';

  @override
  String get backToHome => 'العودة للرئيسية';

  @override
  String get call => 'اتصال';

  @override
  String get noBookFilesToDownload => 'لا توجد ملفات كتب متاحة للتحميل';

  @override
  String get chooseBookToDownload => 'اختر الكتاب لتحميله';

  @override
  String get myCurriculum => 'منهاجي';

  @override
  String get lessonMarkedTaught => 'تم تحديد إعطاء الدرس بنجاح';

  @override
  String get lessonUnmarkedTaught => 'تم إلغاء تحديد إعطاء الدرس';

  @override
  String get lessonRecordedForGroup => 'تم تسجيل إعطاء الدرس للمجموعة بنجاح';

  @override
  String get lessonTaughtCancelled => 'تم إلغاء إعطاء الدرس';

  @override
  String get preparingCurriculumBooks => 'جاري تجهيز كتب المنهج للتحميل...';

  @override
  String get lessonTaught => 'تم إعطاء الدرس';

  @override
  String get autoSaveSaving => 'جارٍ الحفظ…';

  @override
  String get groupSessionDetails => 'تفاصيل الحلقة';

  @override
  String get noAttendanceStatusesDefined => 'لا توجد حالات حضور مُعرّفة';

  @override
  String get attendanceNotTakenYet =>
      'لم يُسجَّل حضور هذا اليوم بعد. أول تغيير يحفظ حضور الحلقة كاملاً.';

  @override
  String get attendanceReadOnly =>
      'اليوم مغلق أو الكورس منتهٍ — السجل للقراءة فقط';

  @override
  String get editAttendance => 'تعديل الحضور';

  @override
  String get editTeacherAttendance => 'تعديل حضور المعلمين';

  @override
  String get autoSaveSaved => 'تم الحفظ';

  @override
  String get chooseCourseToAutoSave => 'اختر الدورة أولاً ليبدأ الحفظ التلقائي';

  @override
  String get choosePageToRecite => 'اختر الصفحة المراد تسميعها';

  @override
  String pageAlreadyRecited(Object p0) {
    return 'صفحة مسمّعة مسبقاً: $p0';
  }

  @override
  String pageRecitationRecorded(Object p0) {
    return 'تم تسجيل تسميع الصفحة $p0 بنجاح';
  }

  @override
  String get recordRecitation => 'تسجيل تسميع';

  @override
  String get studentNameLabel => 'اسم الطالب';

  @override
  String get nextPart => 'الجزء التالي';

  @override
  String get previousPart => 'الجزء السابق';

  @override
  String get allPartPagesRecited => 'تم تسميع جميع صفحات هذا الجزء';

  @override
  String get autoSaveFailed => 'تعذّر الحفظ — اضغط لإعادة المحاولة';

  @override
  String get chooseStudentForRecitation =>
      'يرجى اختيار طالب لعرض الأجزاء والصفحات للتسميع';

  @override
  String get serverAddressFixed => 'عنوان الخادم ثابت على خادم المسجد الرسمي';

  @override
  String get resetPasswordViaWhatsapp =>
      'لإعادة تعيين كلمة المرور، يرجى التواصل مع إدارة المسجد عبر واتساب.';

  @override
  String get forgotPasswordWhatsappMessage =>
      'السلام عليكم، نسيت كلمة المرور الخاصة بحسابي في البوابة التعليمية.';

  @override
  String get menu => 'القائمة';

  @override
  String get autoSaveHint => 'تُحفظ التغييرات فور تعديلها';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get noPartAvailableForTest => 'لا يوجد جزء متاح للسبر حالياً.';

  @override
  String get enterMistakeCount => 'أدخل عدد الأخطاء';

  @override
  String get mistakeCountRange => 'أدخل عدد أخطاء صحيح بين 0 و 999';

  @override
  String get quarterNotFoundInCourse =>
      'تعذر العثور على الربع المحدد في الدورة';

  @override
  String quarterTestRecorded(Object p0) {
    return 'تم تسجيل سبر الربع $p0 بنجاح';
  }

  @override
  String get loadingEllipsis => 'جاري التحميل...';

  @override
  String get availableQuarters => 'الأرباع المتاحة';

  @override
  String get mistakes => 'أخطاء';

  @override
  String quarterN(Object p0) {
    return 'الربع $p0';
  }

  @override
  String get saveAsPass => 'حفظ كـ Pass';

  @override
  String get invoicesAndPaymentsLog => 'سجل الفواتير والدفعات';

  @override
  String get alkheirMosqueActivities => 'أنشطة مسجد الخير';

  @override
  String get activity => 'نشاط';

  @override
  String get adminWhatsappUnavailable => 'رقم واتساب الإدارة غير متوفر حالياً';

  @override
  String get couldNotOpenWhatsapp => 'تعذّر فتح واتساب';

  @override
  String get theCourseItsGroupsAnd =>
      'سيتم إنهاء الكورس وحلقاته وتسجيلاته وفق دورة الإنهاء في الموقع.';

  @override
  String theFileWillBePermanently(Object p0) {
    return 'سيتم حذف الملف \"$p0\" نهائياً.';
  }

  @override
  String get theFourParts => 'المقاطع الأربعة';

  @override
  String get theStudentHasNoActive => 'لا يوجد تسجيل نشط لبدء اختبار للطالب';

  @override
  String get theTestIsRecordedUnder =>
      'يُسجَّل الاختبار باسم معلمك المرتبط بالحساب';

  @override
  String get theUsernameCanBeChanged => 'يمكن تغيير اسم المستخدم';

  @override
  String get theUsernameCannotBeChanged =>
      'اسم المستخدم لا يمكن تغييره لهذا الحساب';

  @override
  String get thisAmountWillBeRemoved =>
      'سيُلغى هذا المبلغ من إجمالي المحصّل. لا يمكن التراجع.';

  @override
  String get thisAmountWillBeRemoved2 =>
      'سيُلغى هذا المبلغ من المدفوعات. لا يمكن التراجع.';

  @override
  String get thisEnrollmentWillBeRemoved => 'سيتم حذف هذا التسجيل من الحلقة.';

  @override
  String get thisEntryWillBeRemoved =>
      'سيُلغى هذا القيد من رصيد الطالب. لا يمكن التراجع عن الإلغاء.';

  @override
  String get thisExpenseWillBeRemoved =>
      'سيتم حذف هذا المصروف من إجمالي النشاط.';

  @override
  String get thisFieldIsRequired => 'هذا الحقل مطلوب';

  @override
  String get thisItemWillBeDeleted =>
      'سيُحذف هذا البند وتُعاد حساب إجمالي الفاتورة.';

  @override
  String get thisNoteWillBePermanently => 'سيتم حذف هذه الملاحظة نهائياً.';

  @override
  String get thisSessionStaysOpenAnd =>
      'تبقى هذه الجلسة مفتوحة وتُلغى الأجهزة الأخرى';

  @override
  String get thursday => 'الخميس';

  @override
  String get timeSlot => 'الفترة';

  @override
  String get to => 'إلى';

  @override
  String get toCashBox => 'إلى صندوق';

  @override
  String get toCurrency => 'إلى عملة';

  @override
  String get toDate => 'إلى تاريخ';

  @override
  String get toPage => 'إلى صفحة';

  @override
  String get today => 'اليوم';

  @override
  String get tooManyAttemptsPleaseTry =>
      'تم تجاوز عدد المحاولات المسموح بها. حاول مجدداً بعد قليل.';

  @override
  String get total => 'الإجمالي';

  @override
  String get totalAssessments => 'إجمالي التقييمات';

  @override
  String get totalInvoices => 'إجمالي الفواتير';

  @override
  String get totalPages => 'إجمالي صفحات';

  @override
  String get totalPoints => 'إجمالي النقاط';

  @override
  String get totalPoints2 => 'مجموع النقاط';

  @override
  String get totalScore => 'الدرجة الكلية';

  @override
  String get totalStudents => 'إجمالي الطلاب';

  @override
  String get totalTests => 'إجمالي السبر';

  @override
  String get totalsByCurrency => 'الإجماليات حسب العملة';

  @override
  String get transactionSaved => 'تم حفظ العملية';

  @override
  String get transfer => 'تحويل';

  @override
  String get transferBetweenCashBoxes => 'تحويل بين الصناديق';

  @override
  String get transferDate => 'تاريخ التحويل';

  @override
  String get transfers => 'التحويلات';

  @override
  String get trial => 'تجريبي';

  @override
  String get trialFinalAwqaf => 'السبر التجريبي • النهائي • الأوقاف';

  @override
  String get trialTest => 'السبر التجريبي';

  @override
  String get trialTest2 => 'سبر تجريبي';

  @override
  String get trialTestNotStartedYet => 'لم يبدأ السبر التجريبي بعد';

  @override
  String get trialTestResults => 'نتائج السبر التجريبي';

  @override
  String get trialTestResultsAndTests => 'نتائج واختبارات السبر التجريبي';

  @override
  String get tryADifferentSearchTerm => 'جرّب كلمة بحث مختلفة';

  @override
  String get tryAgain => 'إعادة المحاولة';

  @override
  String get tuesday => 'الثلاثاء';

  @override
  String get type => 'النوع';

  @override
  String get typeTheStudentNameTo => 'اكتب اسم الطالب للبحث...';

  @override
  String get underConstruction => 'قيد الإنشاء';

  @override
  String get unitPrice => 'سعر الوحدة';

  @override
  String get unpaid => 'غير مدفوع';

  @override
  String get unspecifiedParent => '— ولي أمر غير محدد';

  @override
  String get uploadFile => 'رفع ملف';

  @override
  String get usedAutomaticallyInScreensThat =>
      'يُستخدم تلقائياً في الشاشات التي لا تحدد كورساً';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get usernameUpdated => 'تم تحديث اسم المستخدم';

  @override
  String get veryGood => 'جيد جداً';

  @override
  String get viaWhatsappToInquireAbout => 'عبر واتساب للاستفسار عن الطالب';

  @override
  String get view => 'عرض';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get viewFinalTestResultsNo =>
      'عرض نتائج السير النهائي (بدون صلاحية تسجيل)';

  @override
  String get viewMemorizationRecordsNoRecording =>
      'عرض سجلات التسميع (بدون صلاحية تسجيل)';

  @override
  String get viewTrialTestResultsNo =>
      'عرض نتائج السبر التجريبي (بدون صلاحية تسجيل)';

  @override
  String get visibility => 'الرؤية';

  @override
  String get visibleToParent => 'مرئية لولي الأمر';

  @override
  String get voidEntry => 'إلغاء القيد';

  @override
  String get voidPayment => 'إلغاء الدفعة';

  @override
  String get voidReason => 'سبب الإلغاء';

  @override
  String get voided => 'ملغاة';

  @override
  String get wednesday => 'الأربعاء';

  @override
  String welcome(Object p0) {
    return 'مرحباً — $p0';
  }

  @override
  String get welcome2 => 'أهلاً بك';

  @override
  String welcome3(Object p0) {
    return 'مرحباً، $p0';
  }

  @override
  String get welcomeToAlKhairMosque => 'مرحباً بك في مسجد الخير';

  @override
  String get wholeNumberOfZeroOr => 'عدد صحيح أكبر من أو يساوي صفر';

  @override
  String get work => 'العمل';

  @override
  String get workplace => 'جهة العمل';

  @override
  String get writeANoteAboutThe => 'اكتب ملاحظة عن الجلسة';

  @override
  String get writeYourMessageToThe => 'اكتب رسالتك للمعلم أو الإدارة...';

  @override
  String get year => 'السنة ٢٠٢٥-٢٠٢٦';

  @override
  String get yes => 'نعم';

  @override
  String get yesterday => 'أمس';

  @override
  String get youCanTakeAScreenshot => 'يمكنك تصوير الشاشة لحفظ البطاقة كـ Pass';

  @override
  String get youDoNotHavePermission => 'ليس لديك صلاحية لتسجيل الحضور';

  @override
  String get yourChildrenSFiles => 'ملفات أبنائك';

  @override
  String get yourSessionHasExpiredPlease =>
      'انتهت جلستك، يرجى تسجيل الدخول مجدداً';

  @override
  String get couldnTReachTheServer =>
      'تعذّر الاتصال بالخادم. تحقق من الشبكة وعنوان الخادم.';

  @override
  String get youDonTHavePermission => 'ليس لديك صلاحية للوصول إلى هذه البيانات';

  @override
  String get theTeacherSFileAnd =>
      'سيتم حذف ملف المعلم وحسابه المرتبط. لا يمكن التراجع.';

  @override
  String get motherSPhone => 'هاتف الأم';

  @override
  String get theParentSFileAnd =>
      'سيتم حذف ملف ولي الأمر وحسابه. لا يمكن التراجع.';

  @override
  String get fatherSPhone => 'هاتف الأب';

  @override
  String get youDonTHavePermission2 => 'ليس لديك صلاحية لعرض هذه الشاشة';

  @override
  String get youDonTHavePermission3 => 'ليس لديك صلاحية';

  @override
  String get pointTheCameraAtThe => 'وجّه الكاميرا نحو رمز QR الطالب';

  @override
  String get text76 => '؟';

  @override
  String get recordTodaySAttendance => 'تسجيل حضور اليوم';

  @override
  String get afterClosingThisDayS =>
      'بعد الإغلاق لن يُعدَّل حضور هذا اليوم حتى يُفتح من جديد.';

  @override
  String get enterYourDetailsToFollow =>
      'أدخل بياناتك لمتابعة تقدم طفلك في الحلقة';

  @override
  String get couldnTReadSignIn =>
      'تعذّر قراءة بيانات الدخول من الخادم. حاول مرة أخرى.';

  @override
  String get theMobileApiIsnT =>
      'واجهة الجوال غير متاحة على هذا الخادم. تحقق من عنوان الخادم.';

  @override
  String get theStudentSPhotoWill => 'ستُحذف صورة الطالب من النظام.';

  @override
  String get teacherSNote => 'ملاحظة المعلم';

  @override
  String get couldnTCompleteTheRequest => 'تعذّر إكمال الطلب. حاول مرة أخرى.';

  @override
  String get teacherSMobileNumber => 'رقم جوال المعلم';

  @override
  String get couldnTDetermineTheCurrent => 'تعذّر تحديد المعلم الحالي';

  @override
  String get roleTeacher => 'معلم';

  @override
  String get roleAdmin => 'مشرف إداري';

  @override
  String get roleSupervisor => 'مشرف حلقة';

  @override
  String get roleAssistantSupervisor => 'مساعد مشرف حلقة';

  @override
  String get roleReciter => 'مسمّع';

  @override
  String get roleTrialExamSupervisor => 'مشرف سبر تجريبي';

  @override
  String get roleFinalExamSupervisor => 'مشرف سير نهائي';
}
