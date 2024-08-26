// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOrderHash() => r'1b45783b93d34c8665e86aa742dabe034e5a1f0e';

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

/// See also [sendOrder].
@ProviderFor(sendOrder)
const sendOrderProvider = SendOrderFamily();

/// See also [sendOrder].
class SendOrderFamily extends Family<AsyncValue<int>> {
  /// See also [sendOrder].
  const SendOrderFamily();

  /// See also [sendOrder].
  SendOrderProvider call({
    required String address,
  }) {
    return SendOrderProvider(
      address: address,
    );
  }

  @override
  SendOrderProvider getProviderOverride(
    covariant SendOrderProvider provider,
  ) {
    return call(
      address: provider.address,
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
  String? get name => r'sendOrderProvider';
}

/// See also [sendOrder].
class SendOrderProvider extends AutoDisposeFutureProvider<int> {
  /// See also [sendOrder].
  SendOrderProvider({
    required String address,
  }) : this._internal(
          (ref) => sendOrder(
            ref as SendOrderRef,
            address: address,
          ),
          from: sendOrderProvider,
          name: r'sendOrderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOrderHash,
          dependencies: SendOrderFamily._dependencies,
          allTransitiveDependencies: SendOrderFamily._allTransitiveDependencies,
          address: address,
        );

  SendOrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String address;

  @override
  Override overrideWith(
    FutureOr<int> Function(SendOrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOrderProvider._internal(
        (ref) => create(ref as SendOrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _SendOrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOrderProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOrderRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `address` of this provider.
  String get address;
}

class _SendOrderProviderElement extends AutoDisposeFutureProviderElement<int>
    with SendOrderRef {
  _SendOrderProviderElement(super.provider);

  @override
  String get address => (origin as SendOrderProvider).address;
}

String _$downloadOrderPDFHash() => r'cb47021c2a5a02510991993ade617b274751bc66';

/// See also [downloadOrderPDF].
@ProviderFor(downloadOrderPDF)
const downloadOrderPDFProvider = DownloadOrderPDFFamily();

/// See also [downloadOrderPDF].
class DownloadOrderPDFFamily extends Family<AsyncValue<int>> {
  /// See also [downloadOrderPDF].
  const DownloadOrderPDFFamily();

  /// See also [downloadOrderPDF].
  DownloadOrderPDFProvider call({
    required String pdfID,
  }) {
    return DownloadOrderPDFProvider(
      pdfID: pdfID,
    );
  }

  @override
  DownloadOrderPDFProvider getProviderOverride(
    covariant DownloadOrderPDFProvider provider,
  ) {
    return call(
      pdfID: provider.pdfID,
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
  String? get name => r'downloadOrderPDFProvider';
}

/// See also [downloadOrderPDF].
class DownloadOrderPDFProvider extends AutoDisposeFutureProvider<int> {
  /// See also [downloadOrderPDF].
  DownloadOrderPDFProvider({
    required String pdfID,
  }) : this._internal(
          (ref) => downloadOrderPDF(
            ref as DownloadOrderPDFRef,
            pdfID: pdfID,
          ),
          from: downloadOrderPDFProvider,
          name: r'downloadOrderPDFProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadOrderPDFHash,
          dependencies: DownloadOrderPDFFamily._dependencies,
          allTransitiveDependencies:
              DownloadOrderPDFFamily._allTransitiveDependencies,
          pdfID: pdfID,
        );

  DownloadOrderPDFProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pdfID,
  }) : super.internal();

  final String pdfID;

  @override
  Override overrideWith(
    FutureOr<int> Function(DownloadOrderPDFRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadOrderPDFProvider._internal(
        (ref) => create(ref as DownloadOrderPDFRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pdfID: pdfID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _DownloadOrderPDFProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadOrderPDFProvider && other.pdfID == pdfID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pdfID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadOrderPDFRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `pdfID` of this provider.
  String get pdfID;
}

class _DownloadOrderPDFProviderElement
    extends AutoDisposeFutureProviderElement<int> with DownloadOrderPDFRef {
  _DownloadOrderPDFProviderElement(super.provider);

  @override
  String get pdfID => (origin as DownloadOrderPDFProvider).pdfID;
}

String _$downloadContractPDFHash() =>
    r'81577e38a419f6a33b9d533fd663ccfa23731a2e';

/// See also [downloadContractPDF].
@ProviderFor(downloadContractPDF)
const downloadContractPDFProvider = DownloadContractPDFFamily();

/// See also [downloadContractPDF].
class DownloadContractPDFFamily extends Family<AsyncValue<int>> {
  /// See also [downloadContractPDF].
  const DownloadContractPDFFamily();

  /// See also [downloadContractPDF].
  DownloadContractPDFProvider call({
    required String pdfID,
  }) {
    return DownloadContractPDFProvider(
      pdfID: pdfID,
    );
  }

  @override
  DownloadContractPDFProvider getProviderOverride(
    covariant DownloadContractPDFProvider provider,
  ) {
    return call(
      pdfID: provider.pdfID,
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
  String? get name => r'downloadContractPDFProvider';
}

/// See also [downloadContractPDF].
class DownloadContractPDFProvider extends AutoDisposeFutureProvider<int> {
  /// See also [downloadContractPDF].
  DownloadContractPDFProvider({
    required String pdfID,
  }) : this._internal(
          (ref) => downloadContractPDF(
            ref as DownloadContractPDFRef,
            pdfID: pdfID,
          ),
          from: downloadContractPDFProvider,
          name: r'downloadContractPDFProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$downloadContractPDFHash,
          dependencies: DownloadContractPDFFamily._dependencies,
          allTransitiveDependencies:
              DownloadContractPDFFamily._allTransitiveDependencies,
          pdfID: pdfID,
        );

  DownloadContractPDFProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pdfID,
  }) : super.internal();

  final String pdfID;

  @override
  Override overrideWith(
    FutureOr<int> Function(DownloadContractPDFRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DownloadContractPDFProvider._internal(
        (ref) => create(ref as DownloadContractPDFRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pdfID: pdfID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _DownloadContractPDFProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DownloadContractPDFProvider && other.pdfID == pdfID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pdfID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DownloadContractPDFRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `pdfID` of this provider.
  String get pdfID;
}

class _DownloadContractPDFProviderElement
    extends AutoDisposeFutureProviderElement<int> with DownloadContractPDFRef {
  _DownloadContractPDFProviderElement(super.provider);

  @override
  String get pdfID => (origin as DownloadContractPDFProvider).pdfID;
}

String _$getCartHash() => r'e53be77b8e75cbaa6b25c1551a6e539509727768';

/// See also [getCart].
@ProviderFor(getCart)
final getCartProvider = AutoDisposeFutureProvider<List<CartItem>>.internal(
  getCart,
  name: r'getCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCartRef = AutoDisposeFutureProviderRef<List<CartItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
