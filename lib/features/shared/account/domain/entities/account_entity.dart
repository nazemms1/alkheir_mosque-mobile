class MobileUserEntity {
  final int id;
  final String name;
  final String username;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? primaryRole;
  final List<String> roles;
  final List<String> permissions;
  final String? profilePhotoUrl;
  final bool usernameIsEditable;
  final int? parentId;
  final int? studentId;
  final int? teacherId;

  const MobileUserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.primaryRole,
    required this.roles,
    required this.permissions,
    required this.profilePhotoUrl,
    required this.usernameIsEditable,
    required this.parentId,
    required this.studentId,
    required this.teacherId,
  });
}

/// معلومات المؤسسة والميزات من `GET /bootstrap`.
class BootstrapEntity {
  final MobileUserEntity user;
  final List<String> permissions;
  final String organizationName;
  final String? organizationPhone;
  final String? organizationEmail;
  final String? logoUrl;
  final bool activitiesEnabled;
  final bool parentPortal;
  final bool profilePhotoUpload;
  final String locale;

  const BootstrapEntity({
    required this.user,
    required this.permissions,
    required this.organizationName,
    required this.organizationPhone,
    required this.organizationEmail,
    required this.logoUrl,
    required this.activitiesEnabled,
    required this.parentPortal,
    required this.profilePhotoUpload,
    required this.locale,
  });
}

/// مؤشرات لوحة التحكم حسب الصلاحيات من `GET /dashboard`.
class DashboardEntity {
  final String? role;
  final String? generatedAt;
  final Map<String, num> metrics;

  const DashboardEntity({
    required this.role,
    required this.generatedAt,
    required this.metrics,
  });
}
