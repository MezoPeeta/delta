// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_pass_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$resetPasswordHash() => r'ddf87531c9ebdd1cc4d0349abe4676cb04801096';

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

/// See also [resetPassword].
@ProviderFor(resetPassword)
const resetPasswordProvider = ResetPasswordFamily();

/// See also [resetPassword].
class ResetPasswordFamily extends Family<AsyncValue<void>> {
  /// See also [resetPassword].
  const ResetPasswordFamily();

  /// See also [resetPassword].
  ResetPasswordProvider call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return ResetPasswordProvider(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  ResetPasswordProvider getProviderOverride(
    covariant ResetPasswordProvider provider,
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
  String? get name => r'resetPasswordProvider';
}

/// See also [resetPassword].
class ResetPasswordProvider extends AutoDisposeFutureProvider<void> {
  /// See also [resetPassword].
  ResetPasswordProvider({
    required String email,
    required String password,
    required String confirmPassword,
  }) : this._internal(
          (ref) => resetPassword(
            ref as ResetPasswordRef,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
          from: resetPasswordProvider,
          name: r'resetPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$resetPasswordHash,
          dependencies: ResetPasswordFamily._dependencies,
          allTransitiveDependencies:
              ResetPasswordFamily._allTransitiveDependencies,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        );

  ResetPasswordProvider._internal(
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
    FutureOr<void> Function(ResetPasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ResetPasswordProvider._internal(
        (ref) => create(ref as ResetPasswordRef),
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ResetPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ResetPasswordProvider &&
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

mixin ResetPasswordRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `confirmPassword` of this provider.
  String get confirmPassword;
}

class _ResetPasswordProviderElement
    extends AutoDisposeFutureProviderElement<void> with ResetPasswordRef {
  _ResetPasswordProviderElement(super.provider);

  @override
  String get email => (origin as ResetPasswordProvider).email;
  @override
  String get password => (origin as ResetPasswordProvider).password;
  @override
  String get confirmPassword =>
      (origin as ResetPasswordProvider).confirmPassword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
