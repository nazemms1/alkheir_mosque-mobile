// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_points_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentPointsControllerHash() =>
    r'3a733bf95a3246e263a8d9ddbae9a8aa7387726d';

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

abstract class _$StudentPointsController
    extends BuildlessAutoDisposeAsyncNotifier<List<PointEntry>> {
  late final int? studentId;

  FutureOr<List<PointEntry>> build(
    int? studentId,
  );
}

/// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
///
/// Copied from [StudentPointsController].
@ProviderFor(StudentPointsController)
const studentPointsControllerProvider = StudentPointsControllerFamily();

/// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
///
/// Copied from [StudentPointsController].
class StudentPointsControllerFamily
    extends Family<AsyncValue<List<PointEntry>>> {
  /// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
  ///
  /// Copied from [StudentPointsController].
  const StudentPointsControllerFamily();

  /// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
  ///
  /// Copied from [StudentPointsController].
  StudentPointsControllerProvider call(
    int? studentId,
  ) {
    return StudentPointsControllerProvider(
      studentId,
    );
  }

  @override
  StudentPointsControllerProvider getProviderOverride(
    covariant StudentPointsControllerProvider provider,
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
  String? get name => r'studentPointsControllerProvider';
}

/// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
///
/// Copied from [StudentPointsController].
class StudentPointsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<StudentPointsController,
        List<PointEntry>> {
  /// نقاط الطالب من الخادم. فارغة عند الفشل: تُعرض البيانات الممرّرة للشاشة.
  ///
  /// Copied from [StudentPointsController].
  StudentPointsControllerProvider(
    int? studentId,
  ) : this._internal(
          () => StudentPointsController()..studentId = studentId,
          from: studentPointsControllerProvider,
          name: r'studentPointsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$studentPointsControllerHash,
          dependencies: StudentPointsControllerFamily._dependencies,
          allTransitiveDependencies:
              StudentPointsControllerFamily._allTransitiveDependencies,
          studentId: studentId,
        );

  StudentPointsControllerProvider._internal(
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
  FutureOr<List<PointEntry>> runNotifierBuild(
    covariant StudentPointsController notifier,
  ) {
    return notifier.build(
      studentId,
    );
  }

  @override
  Override overrideWith(StudentPointsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentPointsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StudentPointsController,
      List<PointEntry>> createElement() {
    return _StudentPointsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentPointsControllerProvider &&
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
mixin StudentPointsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<PointEntry>> {
  /// The parameter `studentId` of this provider.
  int? get studentId;
}

class _StudentPointsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<StudentPointsController,
        List<PointEntry>> with StudentPointsControllerRef {
  _StudentPointsControllerProviderElement(super.provider);

  @override
  int? get studentId => (origin as StudentPointsControllerProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
