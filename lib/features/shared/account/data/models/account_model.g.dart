// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MobileUserModelImpl _$$MobileUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MobileUserModelImpl(
      id: jsonIntLenient(json['id']),
      name: jsonStringLenient(json['name']),
      username: jsonStringLenient(json['username']),
      email: jsonStringLenient(json['email']),
      phone: jsonStringLenient(json['phone']),
      isActive: jsonBoolLenient(json['is_active']),
      primaryRole: jsonStringLenient(json['primary_role']),
      roles: jsonStringListLenient(json['roles']),
      permissions: jsonStringListLenient(json['permissions']),
      profilePhotoUrl: jsonStringLenient(json['profile_photo_url']),
      usernameIsEditable: jsonBoolLenient(json['username_is_editable']),
      parentId: jsonIntLenient(json['parent_id']),
      studentId: jsonIntLenient(json['student_id']),
      teacherId: jsonIntLenient(json['teacher_id']),
    );

Map<String, dynamic> _$$MobileUserModelImplToJson(
        _$MobileUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'is_active': instance.isActive,
      'primary_role': instance.primaryRole,
      'roles': instance.roles,
      'permissions': instance.permissions,
      'profile_photo_url': instance.profilePhotoUrl,
      'username_is_editable': instance.usernameIsEditable,
      'parent_id': instance.parentId,
      'student_id': instance.studentId,
      'teacher_id': instance.teacherId,
    };

_$BootstrapModelImpl _$$BootstrapModelImplFromJson(Map<String, dynamic> json) =>
    _$BootstrapModelImpl(
      user: json['user'] == null
          ? null
          : MobileUserModel.fromJson(json['user'] as Map<String, dynamic>),
      permissions: jsonStringListLenient(json['permissions']),
      organization: json['organization'] == null
          ? null
          : OrganizationModel.fromJson(
              json['organization'] as Map<String, dynamic>),
      features: json['features'] == null
          ? null
          : FeaturesModel.fromJson(json['features'] as Map<String, dynamic>),
      localization: json['localization'] == null
          ? null
          : LocalizationModel.fromJson(
              json['localization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BootstrapModelImplToJson(
        _$BootstrapModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'permissions': instance.permissions,
      'organization': instance.organization,
      'features': instance.features,
      'localization': instance.localization,
    };

_$OrganizationModelImpl _$$OrganizationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationModelImpl(
      name: jsonStringLenient(json['name']),
      phone: jsonStringLenient(json['phone']),
      email: jsonStringLenient(json['email']),
      logoUrl: jsonStringLenient(json['logo_url']),
    );

Map<String, dynamic> _$$OrganizationModelImplToJson(
        _$OrganizationModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'logo_url': instance.logoUrl,
    };

_$FeaturesModelImpl _$$FeaturesModelImplFromJson(Map<String, dynamic> json) =>
    _$FeaturesModelImpl(
      activities: jsonBoolLenient(json['activities']),
      parentPortal: jsonBoolLenient(json['parent_portal']),
      profilePhotoUpload: jsonBoolLenient(json['profile_photo_upload']),
    );

Map<String, dynamic> _$$FeaturesModelImplToJson(_$FeaturesModelImpl instance) =>
    <String, dynamic>{
      'activities': instance.activities,
      'parent_portal': instance.parentPortal,
      'profile_photo_upload': instance.profilePhotoUpload,
    };

_$LocalizationModelImpl _$$LocalizationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizationModelImpl(
      locale: jsonStringLenient(json['locale']),
    );

Map<String, dynamic> _$$LocalizationModelImplToJson(
        _$LocalizationModelImpl instance) =>
    <String, dynamic>{
      'locale': instance.locale,
    };

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      role: jsonStringLenient(json['role']),
      generatedAt: jsonStringLenient(json['generated_at']),
      metrics: jsonMap(json['metrics']),
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'generated_at': instance.generatedAt,
      'metrics': instance.metrics,
    };

_$PasswordChangeModelImpl _$$PasswordChangeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordChangeModelImpl(
      otherTokensRevoked: jsonIntLenient(json['other_tokens_revoked']),
    );

Map<String, dynamic> _$$PasswordChangeModelImplToJson(
        _$PasswordChangeModelImpl instance) =>
    <String, dynamic>{
      'other_tokens_revoked': instance.otherTokensRevoked,
    };
