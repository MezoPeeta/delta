// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'afee51857dd4e81d95455622bca2dfb3bf5d64a9';

/// See also [getProducts].
@ProviderFor(getProducts)
final getProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  getProducts,
  name: r'getProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$getProductsbyCategoryHash() =>
    r'd1f6e86f7d99999c72e5833061d56e849c77578b';

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

/// See also [getProductsbyCategory].
@ProviderFor(getProductsbyCategory)
const getProductsbyCategoryProvider = GetProductsbyCategoryFamily();

/// See also [getProductsbyCategory].
class GetProductsbyCategoryFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [getProductsbyCategory].
  const GetProductsbyCategoryFamily();

  /// See also [getProductsbyCategory].
  GetProductsbyCategoryProvider call({
    required String category,
  }) {
    return GetProductsbyCategoryProvider(
      category: category,
    );
  }

  @override
  GetProductsbyCategoryProvider getProviderOverride(
    covariant GetProductsbyCategoryProvider provider,
  ) {
    return call(
      category: provider.category,
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
  String? get name => r'getProductsbyCategoryProvider';
}

/// See also [getProductsbyCategory].
class GetProductsbyCategoryProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [getProductsbyCategory].
  GetProductsbyCategoryProvider({
    required String category,
  }) : this._internal(
          (ref) => getProductsbyCategory(
            ref as GetProductsbyCategoryRef,
            category: category,
          ),
          from: getProductsbyCategoryProvider,
          name: r'getProductsbyCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsbyCategoryHash,
          dependencies: GetProductsbyCategoryFamily._dependencies,
          allTransitiveDependencies:
              GetProductsbyCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  GetProductsbyCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(GetProductsbyCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsbyCategoryProvider._internal(
        (ref) => create(ref as GetProductsbyCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _GetProductsbyCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsbyCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsbyCategoryRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _GetProductsbyCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with GetProductsbyCategoryRef {
  _GetProductsbyCategoryProviderElement(super.provider);

  @override
  String get category => (origin as GetProductsbyCategoryProvider).category;
}

String _$getCategoriesHash() => r'dbe1efb05199d29cf4dfbea135a92f6042c58c31';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = AutoDisposeFutureProvider<List>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
