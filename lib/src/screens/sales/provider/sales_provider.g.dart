// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSalesHash() => r'5b8ac24b2cc918ba2178b79cae0259f92c1ce6cf';

/// See also [getAllSales].
@ProviderFor(getAllSales)
final getAllSalesProvider = AutoDisposeFutureProvider<List<Sales>>.internal(
  getAllSales,
  name: r'getAllSalesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllSalesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllSalesRef = AutoDisposeFutureProviderRef<List<Sales>>;
String _$getSalesByIDHash() => r'e1ec71dec4d992c1e7a2c034d0c3965ca2fb8f3e';

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

/// See also [getSalesByID].
@ProviderFor(getSalesByID)
const getSalesByIDProvider = GetSalesByIDFamily();

/// See also [getSalesByID].
class GetSalesByIDFamily extends Family<AsyncValue<Sales>> {
  /// See also [getSalesByID].
  const GetSalesByIDFamily();

  /// See also [getSalesByID].
  GetSalesByIDProvider call({
    required String id,
  }) {
    return GetSalesByIDProvider(
      id: id,
    );
  }

  @override
  GetSalesByIDProvider getProviderOverride(
    covariant GetSalesByIDProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getSalesByIDProvider';
}

/// See also [getSalesByID].
class GetSalesByIDProvider extends AutoDisposeFutureProvider<Sales> {
  /// See also [getSalesByID].
  GetSalesByIDProvider({
    required String id,
  }) : this._internal(
          (ref) => getSalesByID(
            ref as GetSalesByIDRef,
            id: id,
          ),
          from: getSalesByIDProvider,
          name: r'getSalesByIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSalesByIDHash,
          dependencies: GetSalesByIDFamily._dependencies,
          allTransitiveDependencies:
              GetSalesByIDFamily._allTransitiveDependencies,
          id: id,
        );

  GetSalesByIDProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Sales> Function(GetSalesByIDRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSalesByIDProvider._internal(
        (ref) => create(ref as GetSalesByIDRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Sales> createElement() {
    return _GetSalesByIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSalesByIDProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSalesByIDRef on AutoDisposeFutureProviderRef<Sales> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetSalesByIDProviderElement
    extends AutoDisposeFutureProviderElement<Sales> with GetSalesByIDRef {
  _GetSalesByIDProviderElement(super.provider);

  @override
  String get id => (origin as GetSalesByIDProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
