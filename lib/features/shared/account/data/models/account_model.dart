// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alkheir_mosque/app/core/utils/json_helpers.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

/// مطابقة لـ `MobileUserData` في الباك إند.
@freezed
class MobileUserModel with _$MobileUserModel {
  const factory MobileUserModel({
    @JsonKey(fromJson: jsonIntLenient) int? id,
    @JsonKey(fromJson: jsonStringLenient) String? name,
    @JsonKey(fromJson: jsonStringLenient) String? username,
    @JsonKey(fromJson: jsonStringLenient) String? email,
    @JsonKey(fromJson: jsonStringLenient) String? phone,
    @JsonKey(name: 'is_active', fromJson: jsonBoolLenient) bool? isActive,
    @JsonKey(name: 'primary_role', fromJson: jsonStringLenient)
    String? primaryRole,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? roles,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
    @JsonKey(name: 'profile_photo_url', fromJson: jsonStringLenient)
    String? profilePhotoUrl,
    @JsonKey(name: 'username_is_editable', fromJson: jsonBoolLenient)
    bool? usernameIsEditable,
    @JsonKey(name: 'parent_id', fromJson: jsonIntLenient) int? parentId,
    @JsonKey(name: 'student_id', fromJson: jsonIntLenient) int? studentId,
    @JsonKey(name: 'teacher_id', fromJson: jsonIntLenient) int? teacherId,
  }) = _MobileUserModel;

  factory MobileUserModel.fromJson(Map<String, dynamic> json) =>
      _$MobileUserModelFromJson(json);
}

/// `GET /bootstrap` — مطابقة لـ `MobileBootstrapService`.
@freezed
class BootstrapModel with _$BootstrapModel {
  const factory BootstrapModel({
    MobileUserModel? user,
    @JsonKey(fromJson: jsonStringListLenient) List<String>? permissions,
    OrganizationModel? organization,
    FeaturesModel? features,
    LocalizationModel? localization,
  }) = _BootstrapModel;

  factory BootstrapModel.fromJson(Map<String, dynamic> json) =>
      _$BootstrapModelFromJson(json);
}

@freezed
class OrganizationModel with _$OrganizationModel {
  const factory OrganizationModel({
    @JsonKey(fromJson: jsonStringLenient) String? name,
    @JsonKey(fromJson: jsonStringLenient) String? phone,
    @JsonKey(fromJson: jsonStringLenient) String? email,
    @JsonKey(name: 'logo_url', fromJson: jsonStringLenient) String? logoUrl,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationModelFromJson(json);
}

@freezed
class FeaturesModel with _$FeaturesModel {
  const factory FeaturesModel({
    @JsonKey(fromJson: jsonBoolLenient) bool? activities,
    @JsonKey(name: 'parent_portal', fromJson: jsonBoolLenient)
    bool? parentPortal,
    @JsonKey(name: 'profile_photo_upload', fromJson: jsonBoolLenient)
    bool? profilePhotoUpload,
  }) = _FeaturesModel;

  factory FeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturesModelFromJson(json);
}

@freezed
class LocalizationModel with _$LocalizationModel {
  const factory LocalizationModel({
    @JsonKey(fromJson: jsonStringLenient) String? locale,
  }) = _LocalizationModel;

  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);
}

/// `GET /dashboard` — مطابقة لـ `MobileDashboardService`.
@freezed
class DashboardModel with _$DashboardModel {
  const factory DashboardModel({
    @JsonKey(fromJson: jsonStringLenient) String? role,
    @JsonKey(name: 'generated_at', fromJson: jsonStringLenient)
    String? generatedAt,
    @JsonKey(fromJson: jsonMap) Map<String, dynamic>? metrics,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);
}

@freezed
class PasswordChangeModel with _$PasswordChangeModel {
  const factory PasswordChangeModel({
    @JsonKey(name: 'other_tokens_revoked', fromJson: jsonIntLenient)
    int? otherTokensRevoked,
  }) = _PasswordChangeModel;

  factory PasswordChangeModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeModelFromJson(json);
}
