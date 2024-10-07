// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchProductHash() => r'7d2a1bf017e3ebd2685dda53012c4885cb042874';

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

/// See also [searchProduct].
@ProviderFor(searchProduct)
const searchProductProvider = SearchProductFamily();

/// See also [searchProduct].
class SearchProductFamily extends Family<AsyncValue<Products>> {
  /// See also [searchProduct].
  const SearchProductFamily();

  /// See also [searchProduct].
  SearchProductProvider call({
    required String productName,
  }) {
    return SearchProductProvider(
      productName: productName,
    );
  }

  @override
  SearchProductProvider getProviderOverride(
    covariant SearchProductProvider provider,
  ) {
    return call(
      productName: provider.productName,
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
  String? get name => r'searchProductProvider';
}

/// See also [searchProduct].
class SearchProductProvider extends AutoDisposeFutureProvider<Products> {
  /// See also [searchProduct].
  SearchProductProvider({
    required String productName,
  }) : this._internal(
          (ref) => searchProduct(
            ref as SearchProductRef,
            productName: productName,
          ),
          from: searchProductProvider,
          name: r'searchProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchProductHash,
          dependencies: SearchProductFamily._dependencies,
          allTransitiveDependencies:
              SearchProductFamily._allTransitiveDependencies,
          productName: productName,
        );

  SearchProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productName,
  }) : super.internal();

  final String productName;

  @override
  Override overrideWith(
    FutureOr<Products> Function(SearchProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchProductProvider._internal(
        (ref) => create(ref as SearchProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productName: productName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Products> createElement() {
    return _SearchProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchProductProvider && other.productName == productName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchProductRef on AutoDisposeFutureProviderRef<Products> {
  /// The parameter `productName` of this provider.
  String get productName;
}

class _SearchProductProviderElement
    extends AutoDisposeFutureProviderElement<Products> with SearchProductRef {
  _SearchProductProviderElement(super.provider);

  @override
  String get productName => (origin as SearchProductProvider).productName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
