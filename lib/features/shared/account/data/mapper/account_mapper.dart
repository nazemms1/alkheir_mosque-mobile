import '../../domain/entities/account_entity.dart';
import '../models/account_model.dart';

extension MobileUserModelMapper on MobileUserModel? {
  MobileUserEntity toDomain() {
    return MobileUserEntity(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      username: this?.username ?? '',
      email: this?.email,
      phone: this?.phone,
      isActive: this?.isActive ?? false,
      primaryRole: this?.primaryRole,
      roles: this?.roles ?? const [],
      permissions: this?.permissions ?? const [],
      profilePhotoUrl: this?.profilePhotoUrl,
      usernameIsEditable: this?.usernameIsEditable ?? false,
      parentId: this?.parentId,
      studentId: this?.studentId,
      teacherId: this?.teacherId,
    );
  }
}

extension BootstrapModelMapper on BootstrapModel? {
  BootstrapEntity toDomain() {
    final org = this?.organization;
    final features = this?.features;
    return BootstrapEntity(
      user: (this?.user).toDomain(),
      permissions: this?.permissions ?? const [],
      organizationName: org?.name ?? '',
      organizationPhone: org?.phone,
      organizationEmail: org?.email,
      logoUrl: org?.logoUrl,
      activitiesEnabled: features?.activities ?? false,
      parentPortal: features?.parentPortal ?? false,
      profilePhotoUpload: features?.profilePhotoUpload ?? false,
      locale: this?.localization?.locale ?? '',
    );
  }
}

extension DashboardModelMapper on DashboardModel? {
  DashboardEntity toDomain() {
    return DashboardEntity(
      role: this?.role,
      generatedAt: this?.generatedAt,
      metrics: {
        for (final e in (this?.metrics ?? const {}).entries)
          if (e.value is num) e.key: e.value as num,
      },
    );
  }
}
