// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateUserHash() => r'd32db0c0be8106517e46b5e48239589bb426e193';

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

/// See also [updateUser].
@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily();

/// See also [updateUser].
class UpdateUserFamily extends Family<AsyncValue<void>> {
  /// See also [updateUser].
  const UpdateUserFamily();

  /// See also [updateUser].
  UpdateUserProvider call({
    String? userName,
    String? phone,
    String? newPhone,
  }) {
    return UpdateUserProvider(
      userName: userName,
      phone: phone,
      newPhone: newPhone,
    );
  }

  @override
  UpdateUserProvider getProviderOverride(
    covariant UpdateUserProvider provider,
  ) {
    return call(
      userName: provider.userName,
      phone: provider.phone,
      newPhone: provider.newPhone,
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
  String? get name => r'updateUserProvider';
}

/// See also [updateUser].
class UpdateUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateUser].
  UpdateUserProvider({
    String? userName,
    String? phone,
    String? newPhone,
  }) : this._internal(
          (ref) => updateUser(
            ref as UpdateUserRef,
            userName: userName,
            phone: phone,
            newPhone: newPhone,
          ),
          from: updateUserProvider,
          name: r'updateUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserHash,
          dependencies: UpdateUserFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserFamily._allTransitiveDependencies,
          userName: userName,
          phone: phone,
          newPhone: newPhone,
        );

  UpdateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.phone,
    required this.newPhone,
  }) : super.internal();

  final String? userName;
  final String? phone;
  final String? newPhone;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserProvider._internal(
        (ref) => create(ref as UpdateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        phone: phone,
        newPhone: newPhone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider &&
        other.userName == userName &&
        other.phone == phone &&
        other.newPhone == newPhone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, newPhone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userName` of this provider.
  String? get userName;

  /// The parameter `phone` of this provider.
  String? get phone;

  /// The parameter `newPhone` of this provider.
  String? get newPhone;
}

class _UpdateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateUserRef {
  _UpdateUserProviderElement(super.provider);

  @override
  String? get userName => (origin as UpdateUserProvider).userName;
  @override
  String? get phone => (origin as UpdateUserProvider).phone;
  @override
  String? get newPhone => (origin as UpdateUserProvider).newPhone;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
