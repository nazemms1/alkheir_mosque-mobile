// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_finance_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminFinanceControllerHash() =>
    r'b2d2d6a8c9211136d45fcd30a3c913fa9bbb52d6';

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

abstract class _$AdminFinanceController
    extends BuildlessAutoDisposeAsyncNotifier<AdminFinanceData> {
  late final bool invoices;
  late final bool activities;

  FutureOr<AdminFinanceData> build({
    required bool invoices,
    required bool activities,
  });
}

/// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
///
/// Copied from [AdminFinanceController].
@ProviderFor(AdminFinanceController)
const adminFinanceControllerProvider = AdminFinanceControllerFamily();

/// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
///
/// Copied from [AdminFinanceController].
class AdminFinanceControllerFamily
    extends Family<AsyncValue<AdminFinanceData>> {
  /// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
  ///
  /// Copied from [AdminFinanceController].
  const AdminFinanceControllerFamily();

  /// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
  ///
  /// Copied from [AdminFinanceController].
  AdminFinanceControllerProvider call({
    required bool invoices,
    required bool activities,
  }) {
    return AdminFinanceControllerProvider(
      invoices: invoices,
      activities: activities,
    );
  }

  @override
  AdminFinanceControllerProvider getProviderOverride(
    covariant AdminFinanceControllerProvider provider,
  ) {
    return call(
      invoices: provider.invoices,
      activities: provider.activities,
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
  String? get name => r'adminFinanceControllerProvider';
}

/// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
///
/// Copied from [AdminFinanceController].
class AdminFinanceControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AdminFinanceController,
        AdminFinanceData> {
  /// فواتير وأنشطة تبويب المالية؛ يُجلب فقط ما يملك الحساب صلاحية رؤيته.
  ///
  /// Copied from [AdminFinanceController].
  AdminFinanceControllerProvider({
    required bool invoices,
    required bool activities,
  }) : this._internal(
          () => AdminFinanceController()
            ..invoices = invoices
            ..activities = activities,
          from: adminFinanceControllerProvider,
          name: r'adminFinanceControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adminFinanceControllerHash,
          dependencies: AdminFinanceControllerFamily._dependencies,
          allTransitiveDependencies:
              AdminFinanceControllerFamily._allTransitiveDependencies,
          invoices: invoices,
          activities: activities,
        );

  AdminFinanceControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.invoices,
    required this.activities,
  }) : super.internal();

  final bool invoices;
  final bool activities;

  @override
  FutureOr<AdminFinanceData> runNotifierBuild(
    covariant AdminFinanceController notifier,
  ) {
    return notifier.build(
      invoices: invoices,
      activities: activities,
    );
  }

  @override
  Override overrideWith(AdminFinanceController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminFinanceControllerProvider._internal(
        () => create()
          ..invoices = invoices
          ..activities = activities,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        invoices: invoices,
        activities: activities,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdminFinanceController,
      AdminFinanceData> createElement() {
    return _AdminFinanceControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminFinanceControllerProvider &&
        other.invoices == invoices &&
        other.activities == activities;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, invoices.hashCode);
    hash = _SystemHash.combine(hash, activities.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdminFinanceControllerRef
    on AutoDisposeAsyncNotifierProviderRef<AdminFinanceData> {
  /// The parameter `invoices` of this provider.
  bool get invoices;

  /// The parameter `activities` of this provider.
  bool get activities;
}

class _AdminFinanceControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AdminFinanceController,
        AdminFinanceData> with AdminFinanceControllerRef {
  _AdminFinanceControllerProviderElement(super.provider);

  @override
  bool get invoices => (origin as AdminFinanceControllerProvider).invoices;
  @override
  bool get activities => (origin as AdminFinanceControllerProvider).activities;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
