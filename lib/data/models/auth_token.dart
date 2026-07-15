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
  List<String> get roles => user?.roles ?? const [];

  bool get isParent  => roles.contains('parent');
  bool get isStudent => roles.contains('student');
  bool get isTeacher => roles.contains('teacher');

  bool get isAdmin =>
      roles.contains('admin') ||
      roles.contains('manager') ||
      roles.contains('super_admin') ||
      roles.contains('مشرف-إداري');

  /// مشرف الحلقة — يرى بيانات الطلاب وتسجيل التسميع والتقارير
  bool get isSupervisor =>
      roles.contains('مشرف-حلقة') || roles.contains('supervisor');

  /// مساعد مشرف الحلقة — ملاحظات وحضور
  bool get isAssistantSupervisor =>
      roles.contains('مساعد-مشرف-حلقة') || roles.contains('assistant_supervisor');

  /// مسمّع — تسجيل التسميع وتقدم الطالب
  bool get isReciter =>
      roles.contains('مسمع') || roles.contains('reciter');

  /// مشرف سبر تجريبي
  bool get isTrialExamSupervisor =>
      roles.contains('مشرف-سبر-تجريبي') || roles.contains('trial_exam_supervisor');

  /// مشرف سير نهائي
  bool get isFinalExamSupervisor =>
      roles.contains('مشرف-سير-نهائي') || roles.contains('final_exam_supervisor');

  /// أي دور إشرافي (ليس والد/طالب)
  bool get isAnyStaff =>
      isAdmin ||
      isSupervisor ||
      isAssistantSupervisor ||
      isReciter ||
      isTrialExamSupervisor ||
      isFinalExamSupervisor;

  String get displayRole {
    if (isAdmin) return 'مشرف إداري';
    if (isSupervisor) return 'مشرف حلقة';
    if (isAssistantSupervisor) return 'مساعد مشرف حلقة';
    if (isReciter) return 'مسمّع';
    if (isTrialExamSupervisor) return 'مشرف سبر تجريبي';
    if (isFinalExamSupervisor) return 'مشرف سير نهائي';
    if (isTeacher) return 'معلم';
    if (isParent) return 'ولي أمر';
    if (isStudent) return 'طالب';
    return roles.join(', ');
  }

  bool hasPermission(String permission) =>
      user?.permissions.contains(permission) ?? false;
}
