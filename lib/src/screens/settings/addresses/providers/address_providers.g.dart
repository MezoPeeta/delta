// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserAddressesHash() => r'b9df0caabf0c392992d89f698614ca5f4f0d46a7';

/// See also [getUserAddresses].
@ProviderFor(getUserAddresses)
final getUserAddressesProvider =
    AutoDisposeFutureProvider<List<Address>>.internal(
  getUserAddresses,
  name: r'getUserAddressesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserAddressesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUserAddressesRef = AutoDisposeFutureProviderRef<List<Address>>;
String _$getLocationHash() => r'e7926bb437cda4bdaa0f59b821d88b052975254c';

/// See also [getLocation].
@ProviderFor(getLocation)
final getLocationProvider = AutoDisposeFutureProvider<Position>.internal(
  getLocation,
  name: r'getLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocationRef = AutoDisposeFutureProviderRef<Position>;
String _$getPlacemarkHash() => r'bd4fe63a9603d3436c0e603d40800a32e472e2b0';

/// See also [getPlacemark].
@ProviderFor(getPlacemark)
final getPlacemarkProvider = AutoDisposeFutureProvider<Placemark?>.internal(
  getPlacemark,
  name: r'getPlacemarkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getPlacemarkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPlacemarkRef = AutoDisposeFutureProviderRef<Placemark?>;
String _$addAddressHash() => r'd68e3472c92178f919d1fb380517f1065f195a7c';

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

/// See also [addAddress].
@ProviderFor(addAddress)
const addAddressProvider = AddAddressFamily();

/// See also [addAddress].
class AddAddressFamily extends Family<AsyncValue<void>> {
  /// See also [addAddress].
  const AddAddressFamily();

  /// See also [addAddress].
  AddAddressProvider call({
    required String city,
    required String area,
    required String street,
    required String building,
    required String flat,
    required double latitude,
    required double longitude,
  }) {
    return AddAddressProvider(
      city: city,
      area: area,
      street: street,
      building: building,
      flat: flat,
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  AddAddressProvider getProviderOverride(
    covariant AddAddressProvider provider,
  ) {
    return call(
      city: provider.city,
      area: provider.area,
      street: provider.street,
      building: provider.building,
      flat: provider.flat,
      latitude: provider.latitude,
      longitude: provider.longitude,
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
  String? get name => r'addAddressProvider';
}

/// See also [addAddress].
class AddAddressProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addAddress].
  AddAddressProvider({
    required String city,
    required String area,
    required String street,
    required String building,
    required String flat,
    required double latitude,
    required double longitude,
  }) : this._internal(
          (ref) => addAddress(
            ref as AddAddressRef,
            city: city,
            area: area,
            street: street,
            building: building,
            flat: flat,
            latitude: latitude,
            longitude: longitude,
          ),
          from: addAddressProvider,
          name: r'addAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addAddressHash,
          dependencies: AddAddressFamily._dependencies,
          allTransitiveDependencies:
              AddAddressFamily._allTransitiveDependencies,
          city: city,
          area: area,
          street: street,
          building: building,
          flat: flat,
          latitude: latitude,
          longitude: longitude,
        );

  AddAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.city,
    required this.area,
    required this.street,
    required this.building,
    required this.flat,
    required this.latitude,
    required this.longitude,
  }) : super.internal();

  final String city;
  final String area;
  final String street;
  final String building;
  final String flat;
  final double latitude;
  final double longitude;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddAddressProvider._internal(
        (ref) => create(ref as AddAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        city: city,
        area: area,
        street: street,
        building: building,
        flat: flat,
        latitude: latitude,
        longitude: longitude,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddAddressProvider &&
        other.city == city &&
        other.area == area &&
        other.street == street &&
        other.building == building &&
        other.flat == flat &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);
    hash = _SystemHash.combine(hash, area.hashCode);
    hash = _SystemHash.combine(hash, street.hashCode);
    hash = _SystemHash.combine(hash, building.hashCode);
    hash = _SystemHash.combine(hash, flat.hashCode);
    hash = _SystemHash.combine(hash, latitude.hashCode);
    hash = _SystemHash.combine(hash, longitude.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddAddressRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `city` of this provider.
  String get city;

  /// The parameter `area` of this provider.
  String get area;

  /// The parameter `street` of this provider.
  String get street;

  /// The parameter `building` of this provider.
  String get building;

  /// The parameter `flat` of this provider.
  String get flat;

  /// The parameter `latitude` of this provider.
  double get latitude;

  /// The parameter `longitude` of this provider.
  double get longitude;
}

class _AddAddressProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddAddressRef {
  _AddAddressProviderElement(super.provider);

  @override
  String get city => (origin as AddAddressProvider).city;
  @override
  String get area => (origin as AddAddressProvider).area;
  @override
  String get street => (origin as AddAddressProvider).street;
  @override
  String get building => (origin as AddAddressProvider).building;
  @override
  String get flat => (origin as AddAddressProvider).flat;
  @override
  double get latitude => (origin as AddAddressProvider).latitude;
  @override
  double get longitude => (origin as AddAddressProvider).longitude;
}

String _$deleteAddressHash() => r'7aefd3698fb15326a6742518e9d05134af8ff04a';

/// See also [deleteAddress].
@ProviderFor(deleteAddress)
const deleteAddressProvider = DeleteAddressFamily();

/// See also [deleteAddress].
class DeleteAddressFamily extends Family<AsyncValue<void>> {
  /// See also [deleteAddress].
  const DeleteAddressFamily();

  /// See also [deleteAddress].
  DeleteAddressProvider call({
    required String addressID,
  }) {
    return DeleteAddressProvider(
      addressID: addressID,
    );
  }

  @override
  DeleteAddressProvider getProviderOverride(
    covariant DeleteAddressProvider provider,
  ) {
    return call(
      addressID: provider.addressID,
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
  String? get name => r'deleteAddressProvider';
}

/// See also [deleteAddress].
class DeleteAddressProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteAddress].
  DeleteAddressProvider({
    required String addressID,
  }) : this._internal(
          (ref) => deleteAddress(
            ref as DeleteAddressRef,
            addressID: addressID,
          ),
          from: deleteAddressProvider,
          name: r'deleteAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteAddressHash,
          dependencies: DeleteAddressFamily._dependencies,
          allTransitiveDependencies:
              DeleteAddressFamily._allTransitiveDependencies,
          addressID: addressID,
        );

  DeleteAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.addressID,
  }) : super.internal();

  final String addressID;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteAddressProvider._internal(
        (ref) => create(ref as DeleteAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        addressID: addressID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteAddressProvider && other.addressID == addressID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, addressID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteAddressRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `addressID` of this provider.
  String get addressID;
}

class _DeleteAddressProviderElement
    extends AutoDisposeFutureProviderElement<void> with DeleteAddressRef {
  _DeleteAddressProviderElement(super.provider);

  @override
  String get addressID => (origin as DeleteAddressProvider).addressID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
