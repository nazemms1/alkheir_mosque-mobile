import 'package:flutter/material.dart';
import '../../data/models/auth_token.dart';
import '../../data/models/student_model.dart';

/// سياق يُمرَّر لبنّاء كل تبويب — يحمل الجلسة وبيانات لوحة ولي الأمر
/// (إن وُجدت) وأدوات التنقل، حتى لا يحتاج أي تبويب لتمرير يدوي للبيانات.
class TabContext {
  final AuthToken token;

  /// بيانات لوحة ولي الأمر/الطالب — null لبقية الأدوار.
  final ParentDashboardData? parentData;
  final int selectedChildIndex;
  final ValueChanged<int> onChildSelected;

  /// الانتقال إلى تبويب آخر بموقعه في الشريط السفلي.
  final ValueChanged<int> onTabChange;

  const TabContext({
    required this.token,
    this.parentData,
    this.selectedChildIndex = 0,
    this.onChildSelected = _noop,
    this.onTabChange = _noop,
  });

  static void _noop(int _) {}

  /// الابن المحدَّد حالياً (لتبويبات ولي الأمر فقط).
  ChildData get activeChild => parentData!.children[selectedChildIndex];
}

/// تعريف تبويب واحد في شريط التنقل السفلي — أيقونات + عناوين + شرط الظهور
/// (صلاحيات و/أو شرط مخصص) + بنّاء الشاشة.
///
/// لإضافة صفحة جديدة: أنشئ الشاشة ثم أضف AppTab واحداً في tab_registry.dart.
class AppTab {
  /// معرّف ثابت للتبويب (للاختبارات والتتبع).
  final String id;

  final IconData icon;
  final IconData activeIcon;

  /// اسم التبويب في شريط التنقل السفلي.
  final String label;

  /// عنوان الشاشة في الشريط العلوي — إن لم يُحدَّد يُستخدم [label].
  final String? title;

  /// السطر الثانوي في الشريط العلوي.
  final String subtitle;

  /// تكفي صلاحية واحدة من هذه القائمة لظهور التبويب (قائمة فارغة = بدون شرط صلاحية).
  final List<String> anyOfPermissions;

  /// شرط ظهور إضافي مخصص (أدوار مركّبة مثلاً) — null يعني دائماً.
  final bool Function(AuthToken token)? visibleWhen;

  final Widget Function(TabContext ctx) builder;

  const AppTab({
    required this.id,
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.title,
    required this.subtitle,
    this.anyOfPermissions = const [],
    this.visibleWhen,
    required this.builder,
  });

  String get effectiveTitle => title ?? label;

  /// هل يظهر هذا التبويب لهذا الحساب؟
  bool isVisibleFor(AuthToken token) {
    final permissionsOk = anyOfPermissions.isEmpty ||
        anyOfPermissions.any(token.hasPermission);
    final conditionOk = visibleWhen?.call(token) ?? true;
    return permissionsOk && conditionOk;
  }
}
