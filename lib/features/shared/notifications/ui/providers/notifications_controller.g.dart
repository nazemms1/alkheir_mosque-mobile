// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsControllerHash() =>
    r'7738640144e9e9114e9355e3dc65eee6f0bfd75c';

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

abstract class _$NotificationsController
    extends BuildlessAutoDisposeAsyncNotifier<List<NoteMessage>> {
  late final int? studentId;

  FutureOr<List<NoteMessage>> build(
    int? studentId,
  );
}

/// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
///
/// Copied from [NotificationsController].
@ProviderFor(NotificationsController)
const notificationsControllerProvider = NotificationsControllerFamily();

/// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
///
/// Copied from [NotificationsController].
class NotificationsControllerFamily
    extends Family<AsyncValue<List<NoteMessage>>> {
  /// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
  ///
  /// Copied from [NotificationsController].
  const NotificationsControllerFamily();

  /// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
  ///
  /// Copied from [NotificationsController].
  NotificationsControllerProvider call(
    int? studentId,
  ) {
    return NotificationsControllerProvider(
      studentId,
    );
  }

  @override
  NotificationsControllerProvider getProviderOverride(
    covariant NotificationsControllerProvider provider,
  ) {
    return call(
      provider.studentId,
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
  String? get name => r'notificationsControllerProvider';
}

/// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
///
/// Copied from [NotificationsController].
class NotificationsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<NotificationsController,
        List<NoteMessage>> {
  /// ملاحظات الطالب كإشعارات، الأحدث أولاً. بلا طالب: قائمة فارغة.
  ///
  /// Copied from [NotificationsController].
  NotificationsControllerProvider(
    int? studentId,
  ) : this._internal(
          () => NotificationsController()..studentId = studentId,
          from: notificationsControllerProvider,
          name: r'notificationsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationsControllerHash,
          dependencies: NotificationsControllerFamily._dependencies,
          allTransitiveDependencies:
              NotificationsControllerFamily._allTransitiveDependencies,
          studentId: studentId,
        );

  NotificationsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentId,
  }) : super.internal();

  final int? studentId;

  @override
  FutureOr<List<NoteMessage>> runNotifierBuild(
    covariant NotificationsController notifier,
  ) {
    return notifier.build(
      studentId,
    );
  }

  @override
  Override overrideWith(NotificationsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: NotificationsControllerProvider._internal(
        () => create()..studentId = studentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentId: studentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<NotificationsController,
      List<NoteMessage>> createElement() {
    return _NotificationsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationsControllerProvider &&
        other.studentId == studentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NotificationsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<NoteMessage>> {
  /// The parameter `studentId` of this provider.
  int? get studentId;
}

class _NotificationsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<NotificationsController,
        List<NoteMessage>> with NotificationsControllerRef {
  _NotificationsControllerProviderElement(super.provider);

  @override
  int? get studentId => (origin as NotificationsControllerProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
