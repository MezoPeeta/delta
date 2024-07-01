// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_pass.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$setPasswordHash() => r'669be1c0f6742d2470f0883384f0f836fef41d5e';

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

/// See also [setPassword].
@ProviderFor(setPassword)
const setPasswordProvider = SetPasswordFamily();

/// See also [setPassword].
class SetPasswordFamily extends Family<AsyncValue<int?>> {
  /// See also [setPassword].
  const SetPasswordFamily();

  /// See also [setPassword].
  SetPasswordProvider call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return SetPasswordProvider(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  SetPasswordProvider getProviderOverride(
    covariant SetPasswordProvider provider,
  ) {
    return call(
      email: provider.email,
      password: provider.password,
      confirmPassword: provider.confirmPassword,
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
  String? get name => r'setPasswordProvider';
}

/// See also [setPassword].
class SetPasswordProvider extends AutoDisposeFutureProvider<int?> {
  /// See also [setPassword].
  SetPasswordProvider({
    required String email,
    required String password,
    required String confirmPassword,
  }) : this._internal(
          (ref) => setPassword(
            ref as SetPasswordRef,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
          from: setPasswordProvider,
          name: r'setPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$setPasswordHash,
          dependencies: SetPasswordFamily._dependencies,
          allTransitiveDependencies:
              SetPasswordFamily._allTransitiveDependencies,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        );

  SetPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
    required this.confirmPassword,
  }) : super.internal();

  final String email;
  final String password;
  final String confirmPassword;

  @override
  Override overrideWith(
    FutureOr<int?> Function(SetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SetPasswordProvider._internal(
        (ref) => create(ref as SetPasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _SetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SetPasswordProvider &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, confirmPassword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SetPasswordRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `confirmPassword` of this provider.
  String get confirmPassword;
}

class _SetPasswordProviderElement extends AutoDisposeFutureProviderElement<int?>
    with SetPasswordRef {
  _SetPasswordProviderElement(super.provider);

  @override
  String get email => (origin as SetPasswordProvider).email;
  @override
  String get password => (origin as SetPasswordProvider).password;
  @override
  String get confirmPassword => (origin as SetPasswordProvider).confirmPassword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
