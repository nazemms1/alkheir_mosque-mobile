import 'package:flutter/material.dart';
import '../../data/models/auth_token.dart';

/// ─────────────────────────────────────────────────────────────────────────────
/// سجل ويدجتس الشاشة الرئيسية — نمط "الويدجتس القابلة للتركيب".
///
/// كل دور له قائمة ويدجتس مرتّبة تُعرَّف بجانب شاشته الرئيسية:
///   - ولي الأمر/الطالب: `parentHomeWidgets` في features/home/screens/home_screen.dart
///   - الإداري:          `adminHomeWidgets` في features/admin/screens/admin_dashboard_screen.dart
///   - الإشرافي:         `supervisorHomeWidgets` في features/supervisor/screens/supervisor_shell.dart
///
/// لإضافة ويدجت جديد لدور ما:
///   1. أنشئ الويدجت في ملف الشاشة نفسه (أو ملف widgets مجاور).
///   2. أضف HomeWidgetDef واحداً في قائمة ذلك الدور — بالموضع الذي تريده.
///   3. (اختياري) قيّده بصلاحية عبر anyOfPermissions أو شرط عبر visibleWhen.
/// لا حاجة لتعديل أي كود آخر.
///
/// [D] هو نوع البيانات التي تحتاجها ويدجتس الدور (إحصائيات، قوائم...).
/// ─────────────────────────────────────────────────────────────────────────────
class HomeWidgetDef<D> {
  /// معرّف ثابت للويدجت (للتتبع والاختبارات).
  final String id;

  /// تكفي صلاحية واحدة من هذه القائمة لظهور الويدجت (فارغة = بدون شرط).
  final List<String> anyOfPermissions;

  /// شرط ظهور إضافي يعتمد على البيانات (مثلاً: القائمة غير فارغة).
  final bool Function(AuthToken token, D data)? visibleWhen;

  /// يبني أجزاء الـ slivers الخاصة بهذا الويدجت داخل CustomScrollView.
  /// (قائمة لأن بعض الأقسام = عنوان + قائمة عناصر).
  final List<Widget> Function(BuildContext context, D data) slivers;

  const HomeWidgetDef({
    required this.id,
    this.anyOfPermissions = const [],
    this.visibleWhen,
    required this.slivers,
  });

  bool isVisibleFor(AuthToken token, D data) {
    final permissionsOk = anyOfPermissions.isEmpty ||
        anyOfPermissions.any(token.hasPermission);
    final conditionOk = visibleWhen?.call(token, data) ?? true;
    return permissionsOk && conditionOk;
  }
}

/// يبني slivers الشاشة الرئيسية من سجل ويدجتس الدور، بعد ترشيحها
/// بصلاحيات الحساب وشروط الظهور.
List<Widget> buildHomeSlivers<D>({
  required BuildContext context,
  required AuthToken token,
  required List<HomeWidgetDef<D>> registry,
  required D data,
}) {
  return [
    for (final w in registry)
      if (w.isVisibleFor(token, data)) ...w.slivers(context, data),
  ];
}
