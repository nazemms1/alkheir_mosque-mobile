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
}
