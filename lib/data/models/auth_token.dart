import '../../core/rbac/app_role.dart';

class AuthUser {
  final int id;
  final String name;
  final String username;
  final List<String> roles;
  final List<String> permissions;

  const AuthUser({
    required this.id,
    required this.name,
    required this.username,
    required this.roles,
    required this.permissions,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String? ?? '',
      roles: List<String>.from(json['roles'] as List? ?? []),
      permissions: List<String>.from(json['permissions'] as List? ?? []),
    );
  }
}

class AuthToken {
  final String token;
  final String tokenType;
  final AuthUser? user;
  final List<String> abilities;

  const AuthToken({
    required this.token,
    required this.tokenType,
    this.user,
    this.abilities = const [],
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: json['user'] != null
          ? AuthUser.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      abilities: List<String>.from(json['abilities'] as List? ?? []),
    );
  }

  String get authorizationHeader => '$tokenType $token';

  // ─── Role helpers ─────────────────────────────────────────────────────────
  // ترجمة أسماء الأدوار تتم مركزياً في AppRole (core/rbac/app_role.dart) —
  // لا تضف مقارنة نصية لدور هنا؛ أضف الاسم الجديد إلى AppRole._apiAliases.
  List<String> get roles => user?.roles ?? const [];

  /// أدوار الحساب بعد ترجمتها من نصوص الـ API.
  Set<AppRole> get appRoles => AppRole.fromApiStrings(roles);

  bool hasRole(AppRole role) => appRoles.contains(role);

  bool get isParent  => hasRole(AppRole.parent);
  bool get isStudent => hasRole(AppRole.student);
  bool get isTeacher => hasRole(AppRole.teacher);
  bool get isAdmin   => hasRole(AppRole.admin);
  bool get isSupervisor => hasRole(AppRole.supervisor);
  bool get isAssistantSupervisor => hasRole(AppRole.assistantSupervisor);
  bool get isReciter => hasRole(AppRole.reciter);
  bool get isTrialExamSupervisor => hasRole(AppRole.trialExamSupervisor);
  bool get isFinalExamSupervisor => hasRole(AppRole.finalExamSupervisor);

  /// أي دور إشرافي (ليس والد/طالب)
  bool get isAnyStaff => appRoles.any(AppRole.staffRoles.contains);

  /// الاسم المعروض للدور — عند تعدد الأدوار يُعرض الأعلى صلاحيةً أولاً.
  static const List<AppRole> _displayPriority = [
    AppRole.admin,
    AppRole.supervisor,
    AppRole.assistantSupervisor,
    AppRole.reciter,
    AppRole.trialExamSupervisor,
    AppRole.finalExamSupervisor,
    AppRole.teacher,
    AppRole.parent,
    AppRole.student,
  ];

  String get displayRole {
    for (final role in _displayPriority) {
      if (hasRole(role)) return role.displayName;
    }
    return roles.join(', ');
  }

  bool hasPermission(String permission) =>
      user?.permissions.contains(permission) ?? false;
}
