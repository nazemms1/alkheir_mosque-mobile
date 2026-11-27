// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_attendance_records_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studentAttendanceRecordsControllerHash() =>
    r'36276817b84bc5771cfddfa223867c4f3219123a';

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

abstract class _$StudentAttendanceRecordsController
    extends BuildlessAutoDisposeAsyncNotifier<List<AttendanceRecord>> {
  late final int? studentId;

  FutureOr<List<AttendanceRecord>> build(
    int? studentId,
  );
}

/// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
///
/// Copied from [StudentAttendanceRecordsController].
@ProviderFor(StudentAttendanceRecordsController)
const studentAttendanceRecordsControllerProvider =
    StudentAttendanceRecordsControllerFamily();

/// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
///
/// Copied from [StudentAttendanceRecordsController].
class StudentAttendanceRecordsControllerFamily
    extends Family<AsyncValue<List<AttendanceRecord>>> {
  /// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
  ///
  /// Copied from [StudentAttendanceRecordsController].
  const StudentAttendanceRecordsControllerFamily();

  /// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
  ///
  /// Copied from [StudentAttendanceRecordsController].
  StudentAttendanceRecordsControllerProvider call(
    int? studentId,
  ) {
    return StudentAttendanceRecordsControllerProvider(
      studentId,
    );
  }

  @override
  StudentAttendanceRecordsControllerProvider getProviderOverride(
    covariant StudentAttendanceRecordsControllerProvider provider,
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
  String? get name => r'studentAttendanceRecordsControllerProvider';
}

/// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
///
/// Copied from [StudentAttendanceRecordsController].
class StudentAttendanceRecordsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        StudentAttendanceRecordsController, List<AttendanceRecord>> {
  /// سجل حضور الطالب من الخادم. فارغ عند الفشل: تُعرض السجلات الممرّرة للشاشة.
  ///
  /// Copied from [StudentAttendanceRecordsController].
  StudentAttendanceRecordsControllerProvider(
    int? studentId,
  ) : this._internal(
          () => StudentAttendanceRecordsController()..studentId = studentId,
          from: studentAttendanceRecordsControllerProvider,
          name: r'studentAttendanceRecordsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$studentAttendanceRecordsControllerHash,
          dependencies: StudentAttendanceRecordsControllerFamily._dependencies,
          allTransitiveDependencies: StudentAttendanceRecordsControllerFamily
              ._allTransitiveDependencies,
          studentId: studentId,
        );

  StudentAttendanceRecordsControllerProvider._internal(
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
  FutureOr<List<AttendanceRecord>> runNotifierBuild(
    covariant StudentAttendanceRecordsController notifier,
  ) {
    return notifier.build(
      studentId,
    );
  }

  @override
  Override overrideWith(StudentAttendanceRecordsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentAttendanceRecordsControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<StudentAttendanceRecordsController,
      List<AttendanceRecord>> createElement() {
    return _StudentAttendanceRecordsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentAttendanceRecordsControllerProvider &&
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
mixin StudentAttendanceRecordsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<AttendanceRecord>> {
  /// The parameter `studentId` of this provider.
  int? get studentId;
}

class _StudentAttendanceRecordsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        StudentAttendanceRecordsController,
        List<AttendanceRecord>> with StudentAttendanceRecordsControllerRef {
  _StudentAttendanceRecordsControllerProviderElement(super.provider);

  @override
  int? get studentId =>
      (origin as StudentAttendanceRecordsControllerProvider).studentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
