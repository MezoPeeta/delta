// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOrderHash() => r'4bc0e98777a8d6a8659851459f9fce1c3b0fbcab';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
