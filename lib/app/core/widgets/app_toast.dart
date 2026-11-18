import 'package:flutter/material.dart';

import 'app_feedback.dart';

/// واجهة إشعارات قديمة يُبقيها التوافق مع الشاشات الموجودة.
/// التنفيذ الفعلي في [showAppSnack] حتى تبقى كل الرسائل بشكل واحد في التطبيق.
class AppToast {
  AppToast._();

  static void success(BuildContext context, String message) =>
      showAppSnack(context, message);

  static void error(BuildContext context, String message) =>
      showAppSnack(context, message, error: true);
}
