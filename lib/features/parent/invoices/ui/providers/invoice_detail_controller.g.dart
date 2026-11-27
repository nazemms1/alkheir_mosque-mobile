// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$invoiceDetailControllerHash() =>
    r'ab2a1a1265238ecb4b85ab80ef46824e82339cba';

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

abstract class _$InvoiceDetailController
    extends BuildlessAutoDisposeAsyncNotifier<InvoiceDetail> {
  late final int invoiceId;

  FutureOr<InvoiceDetail> build(
    int invoiceId,
  );
}

/// تفاصيل فاتورة واحدة لولي الأمر.
///
/// Copied from [InvoiceDetailController].
@ProviderFor(InvoiceDetailController)
const invoiceDetailControllerProvider = InvoiceDetailControllerFamily();

/// تفاصيل فاتورة واحدة لولي الأمر.
///
/// Copied from [InvoiceDetailController].
class InvoiceDetailControllerFamily extends Family<AsyncValue<InvoiceDetail>> {
  /// تفاصيل فاتورة واحدة لولي الأمر.
  ///
  /// Copied from [InvoiceDetailController].
  const InvoiceDetailControllerFamily();

  /// تفاصيل فاتورة واحدة لولي الأمر.
  ///
  /// Copied from [InvoiceDetailController].
  InvoiceDetailControllerProvider call(
    int invoiceId,
  ) {
    return InvoiceDetailControllerProvider(
      invoiceId,
    );
  }

  @override
  InvoiceDetailControllerProvider getProviderOverride(
    covariant InvoiceDetailControllerProvider provider,
  ) {
    return call(
      provider.invoiceId,
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
  String? get name => r'invoiceDetailControllerProvider';
}

/// تفاصيل فاتورة واحدة لولي الأمر.
///
/// Copied from [InvoiceDetailController].
class InvoiceDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<InvoiceDetailController,
        InvoiceDetail> {
  /// تفاصيل فاتورة واحدة لولي الأمر.
  ///
  /// Copied from [InvoiceDetailController].
  InvoiceDetailControllerProvider(
    int invoiceId,
  ) : this._internal(
          () => InvoiceDetailController()..invoiceId = invoiceId,
          from: invoiceDetailControllerProvider,
          name: r'invoiceDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$invoiceDetailControllerHash,
          dependencies: InvoiceDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              InvoiceDetailControllerFamily._allTransitiveDependencies,
          invoiceId: invoiceId,
        );

  InvoiceDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.invoiceId,
  }) : super.internal();

  final int invoiceId;

  @override
  FutureOr<InvoiceDetail> runNotifierBuild(
    covariant InvoiceDetailController notifier,
  ) {
    return notifier.build(
      invoiceId,
    );
  }

  @override
  Override overrideWith(InvoiceDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: InvoiceDetailControllerProvider._internal(
        () => create()..invoiceId = invoiceId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        invoiceId: invoiceId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<InvoiceDetailController,
      InvoiceDetail> createElement() {
    return _InvoiceDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InvoiceDetailControllerProvider &&
        other.invoiceId == invoiceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, invoiceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InvoiceDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<InvoiceDetail> {
  /// The parameter `invoiceId` of this provider.
  int get invoiceId;
}

class _InvoiceDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<InvoiceDetailController,
        InvoiceDetail> with InvoiceDetailControllerRef {
  _InvoiceDetailControllerProviderElement(super.provider);

  @override
  int get invoiceId => (origin as InvoiceDetailControllerProvider).invoiceId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
