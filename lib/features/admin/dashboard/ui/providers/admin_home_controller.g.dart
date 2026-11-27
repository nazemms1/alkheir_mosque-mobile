// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminHomeControllerHash() =>
    r'c82d9933ea572a98a3c8aad90c3d7c1e7b919728';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AdminHomeController
    extends BuildlessAutoDisposeAsyncNotifier<AdminHomeDashboard> {
  late final AuthToken token;

  FutureOr<AdminHomeDashboard> build(
    AuthToken token,
  );
}

/// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
///
/// Copied from [AdminHomeController].
@ProviderFor(AdminHomeController)
const adminHomeControllerProvider = AdminHomeControllerFamily();

/// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
///
/// Copied from [AdminHomeController].
class AdminHomeControllerFamily extends Family<AsyncValue<AdminHomeDashboard>> {
  /// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
  ///
  /// Copied from [AdminHomeController].
  const AdminHomeControllerFamily();

  /// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
  ///
  /// Copied from [AdminHomeController].
  AdminHomeControllerProvider call(
    AuthToken token,
  ) {
    return AdminHomeControllerProvider(
      token,
    );
  }

  @override
  AdminHomeControllerProvider getProviderOverride(
    covariant AdminHomeControllerProvider provider,
  ) {
    return call(
      provider.token,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adminHomeControllerProvider';
}

/// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
///
/// Copied from [AdminHomeController].
class AdminHomeControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AdminHomeController, AdminHomeDashboard> {
  /// بيانات الرئيسية للإداري حسب صلاحيات الجلسة [token].
  ///
  /// Copied from [AdminHomeController].
  AdminHomeControllerProvider(
    AuthToken token,
  ) : this._internal(
          () => AdminHomeController()..token = token,
          from: adminHomeControllerProvider,
          name: r'adminHomeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adminHomeControllerHash,
          dependencies: AdminHomeControllerFamily._dependencies,
          allTransitiveDependencies:
              AdminHomeControllerFamily._allTransitiveDependencies,
          token: token,
        );

  AdminHomeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.token,
  }) : super.internal();

  final AuthToken token;

  @override
  FutureOr<AdminHomeDashboard> runNotifierBuild(
    covariant AdminHomeController notifier,
  ) {
    return notifier.build(
      token,
    );
  }

  @override
  Override overrideWith(AdminHomeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminHomeControllerProvider._internal(
        () => create()..token = token,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        token: token,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdminHomeController,
      AdminHomeDashboard> createElement() {
    return _AdminHomeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminHomeControllerProvider && other.token == token;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, token.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdminHomeControllerRef
    on AutoDisposeAsyncNotifierProviderRef<AdminHomeDashboard> {
  /// The parameter `token` of this provider.
  AuthToken get token;
}

class _AdminHomeControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AdminHomeController,
        AdminHomeDashboard> with AdminHomeControllerRef {
  _AdminHomeControllerProviderElement(super.provider);

  @override
  AuthToken get token => (origin as AdminHomeControllerProvider).token;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
