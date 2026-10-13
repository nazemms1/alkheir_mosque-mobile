import 'json_helpers.dart';

/// نماذج الحساب والإعداد — مطابقة لـ `MobileUserData` و`MobileBootstrapService`
/// و`MobileDashboardService` في الباك إند.

class MobileUser {
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

  const MobileUser({
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

  factory MobileUser.fromJson(Map<String, dynamic> json) {
    return MobileUser(
      id: jsonInt(json['id']),
      name: jsonString(json['name']),
      username: jsonString(json['username']),
      email: jsonStringOrNull(json['email']),
      phone: jsonStringOrNull(json['phone']),
      isActive: jsonBool(json['is_active']),
      primaryRole: jsonStringOrNull(json['primary_role']),
      roles: [for (final r in (json['roles'] as List? ?? const [])) '$r'],
      permissions: [
        for (final p in (json['permissions'] as List? ?? const [])) '$p',
      ],
      profilePhotoUrl: jsonStringOrNull(json['profile_photo_url']),
      usernameIsEditable: json['username_is_editable'] == null
          ? false
          : jsonBool(json['username_is_editable']),
      parentId: jsonIntOrNull(json['parent_id']),
      studentId: jsonIntOrNull(json['student_id']),
      teacherId: jsonIntOrNull(json['teacher_id']),
    );
  }
}

/// معلومات المؤسسة والميزات من `GET /bootstrap`.
class BootstrapInfo {
  final MobileUser user;
  final List<String> permissions;
  final String organizationName;
  final String? organizationPhone;
  final String? organizationEmail;
  final String? logoUrl;
  final bool activitiesEnabled;
  final bool parentPortal;
  final bool profilePhotoUpload;
  final String locale;

  const BootstrapInfo({
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

  factory BootstrapInfo.fromJson(Map<String, dynamic> json) {
    final org = jsonMap(json['organization']) ?? const <String, dynamic>{};
    final features = jsonMap(json['features']) ?? const <String, dynamic>{};
    final localization =
        jsonMap(json['localization']) ?? const <String, dynamic>{};
    return BootstrapInfo(
      user: MobileUser.fromJson(
        jsonMap(json['user']) ?? const <String, dynamic>{},
      ),
      permissions: [
        for (final p in (json['permissions'] as List? ?? const [])) '$p',
      ],
      organizationName: jsonString(org['name']),
      organizationPhone: jsonStringOrNull(org['phone']),
      organizationEmail: jsonStringOrNull(org['email']),
      logoUrl: jsonStringOrNull(org['logo_url']),
      activitiesEnabled: jsonBool(features['activities']),
      parentPortal: jsonBool(features['parent_portal']),
      profilePhotoUpload: jsonBool(features['profile_photo_upload']),
      locale: jsonString(localization['locale']),
    );
  }
}

/// مؤشرات لوحة التحكم حسب الصلاحيات من `GET /dashboard`.
class DashboardInfo {
  final String? role;
  final String? generatedAt;
  final Map<String, num> metrics;

  const DashboardInfo({
    required this.role,
    required this.generatedAt,
    required this.metrics,
  });

  factory DashboardInfo.fromJson(Map<String, dynamic> json) {
    final raw = jsonMap(json['metrics']) ?? const <String, dynamic>{};
    final metrics = <String, num>{};
    raw.forEach((key, value) {
      if (value is num) metrics[key] = value;
    });
    return DashboardInfo(
      role: jsonStringOrNull(json['role']),
      generatedAt: jsonStringOrNull(json['generated_at']),
      metrics: metrics,
    );
  }
}
