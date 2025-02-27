// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getProductsHash() => r'fffb72d1471a1f81a3ddee149b74a1c47b47e4e1';

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

/// See also [getProducts].
@ProviderFor(getProducts)
const getProductsProvider = GetProductsFamily();

/// See also [getProducts].
class GetProductsFamily extends Family<AsyncValue<Products>> {
  /// See also [getProducts].
  const GetProductsFamily();

  /// See also [getProducts].
  GetProductsProvider call({
    required String page,
  }) {
    return GetProductsProvider(
      page: page,
    );
  }

  @override
  GetProductsProvider getProviderOverride(
    covariant GetProductsProvider provider,
  ) {
    return call(
      page: provider.page,
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
  String? get name => r'getProductsProvider';
}

/// See also [getProducts].
class GetProductsProvider extends AutoDisposeFutureProvider<Products> {
  /// See also [getProducts].
  GetProductsProvider({
    required String page,
  }) : this._internal(
          (ref) => getProducts(
            ref as GetProductsRef,
            page: page,
          ),
          from: getProductsProvider,
          name: r'getProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductsHash,
          dependencies: GetProductsFamily._dependencies,
          allTransitiveDependencies:
              GetProductsFamily._allTransitiveDependencies,
          page: page,
        );

  GetProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final String page;

  @override
  Override overrideWith(
    FutureOr<Products> Function(GetProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetProductsProvider._internal(
        (ref) => create(ref as GetProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Products> createElement() {
    return _GetProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsRef on AutoDisposeFutureProviderRef<Products> {
  /// The parameter `page` of this provider.
  String get page;
}

class _GetProductsProviderElement
    extends AutoDisposeFutureProviderElement<Products> with GetProductsRef {
  _GetProductsProviderElement(super.provider);

  @override
  String get page => (origin as GetProductsProvider).page;
}

String _$getProductsbyCategoryHash() =>
    r'63261383d2ef29d8854729f07a3438fb9f62e71a';

/// See also [getProductsbyCategory].
@ProviderFor(getProductsbyCategory)
const getProductsbyCategoryProvider = GetProductsbyCategoryFamily();

/// See also [getProductsbyCategory].
class GetProductsbyCategoryFamily extends Family<AsyncValue<Products>> {
  /// See also [getProductsbyCategory].
  const GetProductsbyCategoryFamily();

  /// See also [getProductsbyCategory].
  GetProductsbyCategoryProvider call({
    required String category,
    required String page,
  }) {
    return GetProductsbyCategoryProvider(
      category: category,
      page: page,
    );
  }

  @override
  GetProductsbyCategoryProvider getProviderOverride(
    covariant GetProductsbyCategoryProvider provider,
  ) {
    return call(
      category: provider.category,
      page: provider.page,
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
    extends AutoDisposeFutureProvider<Products> {
  /// See also [getProductsbyCategory].
  GetProductsbyCategoryProvider({
    required String category,
    required String page,
  }) : this._internal(
          (ref) => getProductsbyCategory(
            ref as GetProductsbyCategoryRef,
            category: category,
            page: page,
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
          page: page,
        );

  GetProductsbyCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
    required this.page,
  }) : super.internal();

  final String category;
  final String page;

  @override
  Override overrideWith(
    FutureOr<Products> Function(GetProductsbyCategoryRef provider) create,
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
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Products> createElement() {
    return _GetProductsbyCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductsbyCategoryProvider &&
        other.category == category &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductsbyCategoryRef on AutoDisposeFutureProviderRef<Products> {
  /// The parameter `category` of this provider.
  String get category;

  /// The parameter `page` of this provider.
  String get page;
}

class _GetProductsbyCategoryProviderElement
    extends AutoDisposeFutureProviderElement<Products>
    with GetProductsbyCategoryRef {
  _GetProductsbyCategoryProviderElement(super.provider);

  @override
  String get category => (origin as GetProductsbyCategoryProvider).category;
  @override
  String get page => (origin as GetProductsbyCategoryProvider).page;
}

String _$getRelatedProductsHash() =>
    r'fd4a93c0cdbb2788fb726ab83d38348859247c46';

/// See also [getRelatedProducts].
@ProviderFor(getRelatedProducts)
const getRelatedProductsProvider = GetRelatedProductsFamily();

/// See also [getRelatedProducts].
class GetRelatedProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [getRelatedProducts].
  const GetRelatedProductsFamily();

  /// See also [getRelatedProducts].
  GetRelatedProductsProvider call({
    required String productID,
  }) {
    return GetRelatedProductsProvider(
      productID: productID,
    );
  }

  @override
  GetRelatedProductsProvider getProviderOverride(
    covariant GetRelatedProductsProvider provider,
  ) {
    return call(
      productID: provider.productID,
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
  String? get name => r'getRelatedProductsProvider';
}

/// See also [getRelatedProducts].
class GetRelatedProductsProvider
    extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [getRelatedProducts].
  GetRelatedProductsProvider({
    required String productID,
  }) : this._internal(
          (ref) => getRelatedProducts(
            ref as GetRelatedProductsRef,
            productID: productID,
          ),
          from: getRelatedProductsProvider,
          name: r'getRelatedProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRelatedProductsHash,
          dependencies: GetRelatedProductsFamily._dependencies,
          allTransitiveDependencies:
              GetRelatedProductsFamily._allTransitiveDependencies,
          productID: productID,
        );

  GetRelatedProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productID,
  }) : super.internal();

  final String productID;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(GetRelatedProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRelatedProductsProvider._internal(
        (ref) => create(ref as GetRelatedProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productID: productID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Product>> createElement() {
    return _GetRelatedProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRelatedProductsProvider && other.productID == productID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetRelatedProductsRef on AutoDisposeFutureProviderRef<List<Product>> {
  /// The parameter `productID` of this provider.
  String get productID;
}

class _GetRelatedProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<Product>>
    with GetRelatedProductsRef {
  _GetRelatedProductsProviderElement(super.provider);

  @override
  String get productID => (origin as GetRelatedProductsProvider).productID;
}

String _$getCategoriesHash() => r'352768494c34bcb5ece9ad3483dbabbef1b8fb10';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<Category>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$addToCartHash() => r'6d9c77322d367ea2bf7846742ddcffb66380c500';

/// See also [addToCart].
@ProviderFor(addToCart)
const addToCartProvider = AddToCartFamily();

/// See also [addToCart].
class AddToCartFamily extends Family<AsyncValue<List<CartItem>>> {
  /// See also [addToCart].
  const AddToCartFamily();

  /// See also [addToCart].
  AddToCartProvider call({
    required String productID,
  }) {
    return AddToCartProvider(
      productID: productID,
    );
  }

  @override
  AddToCartProvider getProviderOverride(
    covariant AddToCartProvider provider,
  ) {
    return call(
      productID: provider.productID,
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
  String? get name => r'addToCartProvider';
}

/// See also [addToCart].
class AddToCartProvider extends AutoDisposeFutureProvider<List<CartItem>> {
  /// See also [addToCart].
  AddToCartProvider({
    required String productID,
  }) : this._internal(
          (ref) => addToCart(
            ref as AddToCartRef,
            productID: productID,
          ),
          from: addToCartProvider,
          name: r'addToCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addToCartHash,
          dependencies: AddToCartFamily._dependencies,
          allTransitiveDependencies: AddToCartFamily._allTransitiveDependencies,
          productID: productID,
        );

  AddToCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productID,
  }) : super.internal();

  final String productID;

  @override
  Override overrideWith(
    FutureOr<List<CartItem>> Function(AddToCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddToCartProvider._internal(
        (ref) => create(ref as AddToCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productID: productID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CartItem>> createElement() {
    return _AddToCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddToCartProvider && other.productID == productID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddToCartRef on AutoDisposeFutureProviderRef<List<CartItem>> {
  /// The parameter `productID` of this provider.
  String get productID;
}

class _AddToCartProviderElement
    extends AutoDisposeFutureProviderElement<List<CartItem>> with AddToCartRef {
  _AddToCartProviderElement(super.provider);

  @override
  String get productID => (origin as AddToCartProvider).productID;
}

String _$deleteFromCartHash() => r'8372d6168655a12009acc530d8de0aa801a26c52';

/// See also [deleteFromCart].
@ProviderFor(deleteFromCart)
const deleteFromCartProvider = DeleteFromCartFamily();

/// See also [deleteFromCart].
class DeleteFromCartFamily extends Family<AsyncValue<List<CartItem>>> {
  /// See also [deleteFromCart].
  const DeleteFromCartFamily();

  /// See also [deleteFromCart].
  DeleteFromCartProvider call({
    required String productID,
  }) {
    return DeleteFromCartProvider(
      productID: productID,
    );
  }

  @override
  DeleteFromCartProvider getProviderOverride(
    covariant DeleteFromCartProvider provider,
  ) {
    return call(
      productID: provider.productID,
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
  String? get name => r'deleteFromCartProvider';
}

/// See also [deleteFromCart].
class DeleteFromCartProvider extends AutoDisposeFutureProvider<List<CartItem>> {
  /// See also [deleteFromCart].
  DeleteFromCartProvider({
    required String productID,
  }) : this._internal(
          (ref) => deleteFromCart(
            ref as DeleteFromCartRef,
            productID: productID,
          ),
          from: deleteFromCartProvider,
          name: r'deleteFromCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFromCartHash,
          dependencies: DeleteFromCartFamily._dependencies,
          allTransitiveDependencies:
              DeleteFromCartFamily._allTransitiveDependencies,
          productID: productID,
        );

  DeleteFromCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productID,
  }) : super.internal();

  final String productID;

  @override
  Override overrideWith(
    FutureOr<List<CartItem>> Function(DeleteFromCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFromCartProvider._internal(
        (ref) => create(ref as DeleteFromCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productID: productID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CartItem>> createElement() {
    return _DeleteFromCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFromCartProvider && other.productID == productID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteFromCartRef on AutoDisposeFutureProviderRef<List<CartItem>> {
  /// The parameter `productID` of this provider.
  String get productID;
}

class _DeleteFromCartProviderElement
    extends AutoDisposeFutureProviderElement<List<CartItem>>
    with DeleteFromCartRef {
  _DeleteFromCartProviderElement(super.provider);

  @override
  String get productID => (origin as DeleteFromCartProvider).productID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
