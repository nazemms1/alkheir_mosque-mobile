// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$childProfileControllerHash() =>
    r'779f50c3fb7fdd4e829488f291f735b5f6a351b9';

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

abstract class _$ChildProfileController
    extends BuildlessAutoDisposeAsyncNotifier<ChildDetail?> {
  late final int? studentId;

  FutureOr<ChildDetail?> build(
    int? studentId,
  );
}

/// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
///
/// Copied from [ChildProfileController].
@ProviderFor(ChildProfileController)
const childProfileControllerProvider = ChildProfileControllerFamily();

/// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
///
/// Copied from [ChildProfileController].
class ChildProfileControllerFamily extends Family<AsyncValue<ChildDetail?>> {
  /// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
  ///
  /// Copied from [ChildProfileController].
  const ChildProfileControllerFamily();

  /// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
  ///
  /// Copied from [ChildProfileController].
  ChildProfileControllerProvider call(
    int? studentId,
  ) {
    return ChildProfileControllerProvider(
      studentId,
    );
  }

  @override
  ChildProfileControllerProvider getProviderOverride(
    covariant ChildProfileControllerProvider provider,
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
  String? get name => r'childProfileControllerProvider';
}

/// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
///
/// Copied from [ChildProfileController].
class ChildProfileControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChildProfileController,
        ChildDetail?> {
  /// تفاصيل ملف الطالب. `null` إن تعذّر الجلب: تبقى البيانات المختصرة معروضة.
  ///
  /// Copied from [ChildProfileController].
  ChildProfileControllerProvider(
    int? studentId,
  ) : this._internal(
          () => ChildProfileController()..studentId = studentId,
          from: childProfileControllerProvider,
          name: r'childProfileControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$childProfileControllerHash,
          dependencies: ChildProfileControllerFamily._dependencies,
          allTransitiveDependencies:
              ChildProfileControllerFamily._allTransitiveDependencies,
          studentId: studentId,
        );

  ChildProfileControllerProvider._internal(
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
  FutureOr<ChildDetail?> runNotifierBuild(
    covariant ChildProfileController notifier,
  ) {
    return notifier.build(
      studentId,
    );
  }

  @override
  Override overrideWith(ChildProfileController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChildProfileControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ChildProfileController, ChildDetail?>
      createElement() {
    return _ChildProfileControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChildProfileControllerProvider &&
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
mixin ChildProfileControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ChildDetail?> {
  /// The parameter `studentId` of this provider.
  int? get studentId;
}

class _ChildProfileControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChildProfileController,
        ChildDetail?> with ChildProfileControllerRef {
  _ChildProfileControllerProviderElement(super.provider);

  @override
  int? get studentId => (origin as ChildProfileControllerProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
