import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../session/auth_session.dart';
import 'app_role.dart';

/// يعرض [child] فقط إذا كان المستخدم الحالي يملك إحدى الصلاحيات في [anyOf]
/// (أو كل الصلاحيات في [allOf] إن حُدّدت). خلاف ذلك يعرض [fallback].
///
/// يُستخدم لإخفاء أزرار أو أقسام داخل الشاشة نفسها دون تمرير الـ token:
/// ```dart
/// PermissionGuard(
///   anyOf: const [Permissions.paymentsCreate],
///   child: ElevatedButton(...),
/// )
/// ```
class PermissionGuard extends ConsumerWidget {
  /// تكفي صلاحية واحدة من هذه القائمة.
  final List<String> anyOf;

  /// إن حُدّدت، يجب امتلاكها كلها بالإضافة إلى شرط [anyOf].
  final List<String> allOf;

  final Widget child;

  /// ما يُعرض عند غياب الصلاحية (افتراضياً: لا شيء).
  final Widget fallback;

  const PermissionGuard({
    super.key,
    this.anyOf = const [],
    this.allOf = const [],
    required this.child,
    this.fallback = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authSessionProvider);
    if (token == null) return fallback;

    final anyOk = anyOf.isEmpty || anyOf.any(token.hasPermission);
    final allOk = allOf.every(token.hasPermission);
    return (anyOk && allOk) ? child : fallback;
  }
}

/// يعرض [child] فقط إذا كان للمستخدم الحالي أحد الأدوار في [roles].
///
/// ```dart
/// RoleGuard(
///   roles: const {AppRole.admin, AppRole.supervisor},
///   child: _ReportsSection(),
/// )
/// ```
class RoleGuard extends ConsumerWidget {
  final Set<AppRole> roles;
  final Widget child;
  final Widget fallback;

  const RoleGuard({
    super.key,
    required this.roles,
    required this.child,
    this.fallback = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(authSessionProvider);
    final ok = token != null && token.appRoles.any(roles.contains);
    return ok ? child : fallback;
  }
}
