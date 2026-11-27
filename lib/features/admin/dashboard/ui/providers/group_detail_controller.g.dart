// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupDetailControllerHash() =>
    r'7ceb6b1d4683eba630da41c8432559a4c93ef642';

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

abstract class _$GroupDetailController
    extends BuildlessAutoDisposeAsyncNotifier<AdminGroupDetail> {
  late final AdminGroupItem group;

  FutureOr<AdminGroupDetail> build(
    AdminGroupItem group,
  );
}

/// تفاصيل الحلقة وطلابها، وحذفها.
///
/// Copied from [GroupDetailController].
@ProviderFor(GroupDetailController)
const groupDetailControllerProvider = GroupDetailControllerFamily();

/// تفاصيل الحلقة وطلابها، وحذفها.
///
/// Copied from [GroupDetailController].
class GroupDetailControllerFamily extends Family<AsyncValue<AdminGroupDetail>> {
  /// تفاصيل الحلقة وطلابها، وحذفها.
  ///
  /// Copied from [GroupDetailController].
  const GroupDetailControllerFamily();

  /// تفاصيل الحلقة وطلابها، وحذفها.
  ///
  /// Copied from [GroupDetailController].
  GroupDetailControllerProvider call(
    AdminGroupItem group,
  ) {
    return GroupDetailControllerProvider(
      group,
    );
  }

  @override
  GroupDetailControllerProvider getProviderOverride(
    covariant GroupDetailControllerProvider provider,
  ) {
    return call(
      provider.group,
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
  String? get name => r'groupDetailControllerProvider';
}

/// تفاصيل الحلقة وطلابها، وحذفها.
///
/// Copied from [GroupDetailController].
class GroupDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GroupDetailController,
        AdminGroupDetail> {
  /// تفاصيل الحلقة وطلابها، وحذفها.
  ///
  /// Copied from [GroupDetailController].
  GroupDetailControllerProvider(
    AdminGroupItem group,
  ) : this._internal(
          () => GroupDetailController()..group = group,
          from: groupDetailControllerProvider,
          name: r'groupDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupDetailControllerHash,
          dependencies: GroupDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              GroupDetailControllerFamily._allTransitiveDependencies,
          group: group,
        );

  GroupDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.group,
  }) : super.internal();

  final AdminGroupItem group;

  @override
  FutureOr<AdminGroupDetail> runNotifierBuild(
    covariant GroupDetailController notifier,
  ) {
    return notifier.build(
      group,
    );
  }

  @override
  Override overrideWith(GroupDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: GroupDetailControllerProvider._internal(
        () => create()..group = group,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        group: group,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GroupDetailController,
      AdminGroupDetail> createElement() {
    return _GroupDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDetailControllerProvider && other.group == group;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, group.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<AdminGroupDetail> {
  /// The parameter `group` of this provider.
  AdminGroupItem get group;
}

class _GroupDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GroupDetailController,
        AdminGroupDetail> with GroupDetailControllerRef {
  _GroupDetailControllerProviderElement(super.provider);

  @override
  AdminGroupItem get group => (origin as GroupDetailControllerProvider).group;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
