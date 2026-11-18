import 'package:flutter/material.dart';

import 'package:alkheir_mosque/app/core/api/api_service.dart';
import 'package:alkheir_mosque/features/auth/domain/repositories/auth_repository.dart';
import '../i18n/app_language.dart';
import '../theme/app_theme.dart';

/// نص خطأ مفهوم للمستخدم: رسائل الخادم كما هي، وغيرها برسالة عامة.
/// لا تعرض أبداً `toString()` لاستثناءات تقنية (DioException وغيرها).
String errorText(Object error) {
  if (error is ApiException || error is AuthException) return error.toString();
  return tr('تعذّر إكمال الطلب. حاول مرة أخرى.');
}

/// إشعار موحّد لكل التطبيق (نجاح / خطأ).
///
/// كل الشاشات تستخدم هذه الدالة بدل `ScaffoldMessenger` مباشرة أو `AppToast`،
/// حتى يبقى شكل الرسالة ومدتها وموضعها واحداً في كل الصفحات.
void showAppSnack(BuildContext context, String message, {bool error = false}) {
  // السياق قد يكون أُغلق أثناء عملية async — لا نُظهر رسالة حينها.
  if (!context.mounted) return;
  final messenger = ScaffoldMessenger.maybeOf(context);
  if (messenger == null) return;
  messenger
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: error ? AppColors.error : AppColors.primary,
        duration: const Duration(seconds: 3),
        content: Row(
          children: [
            Icon(
              error ? Icons.error_outline_rounded : Icons.check_circle_rounded,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: appTextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
