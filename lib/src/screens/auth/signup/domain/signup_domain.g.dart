// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_domain.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpHash() => r'7d1abece29b059a78c4f4b3d6da433642a773816';

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

/// See also [signUp].
@ProviderFor(signUp)
const signUpProvider = SignUpFamily();

/// See also [signUp].
class SignUpFamily extends Family<AsyncValue<void>> {
  /// See also [signUp].
  const SignUpFamily();

  /// See also [signUp].
  SignUpProvider call({
    required String userName,
    required String email,
    required String phone,
  }) {
    return SignUpProvider(
      userName: userName,
      email: email,
      phone: phone,
    );
  }

  @override
  SignUpProvider getProviderOverride(
    covariant SignUpProvider provider,
  ) {
    return call(
      userName: provider.userName,
      email: provider.email,
      phone: provider.phone,
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
  String? get name => r'signUpProvider';
}

/// See also [signUp].
class SignUpProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signUp].
  SignUpProvider({
    required String userName,
    required String email,
    required String phone,
  }) : this._internal(
          (ref) => signUp(
            ref as SignUpRef,
            userName: userName,
            email: email,
            phone: phone,
          ),
          from: signUpProvider,
          name: r'signUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpHash,
          dependencies: SignUpFamily._dependencies,
          allTransitiveDependencies: SignUpFamily._allTransitiveDependencies,
          userName: userName,
          email: email,
          phone: phone,
        );

  SignUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.email,
    required this.phone,
  }) : super.internal();

  final String userName;
  final String email;
  final String phone;

  @override
  Override overrideWith(
    FutureOr<void> Function(SignUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpProvider._internal(
        (ref) => create(ref as SignUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        email: email,
        phone: phone,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SignUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpProvider &&
        other.userName == userName &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignUpRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `phone` of this provider.
  String get phone;
}

class _SignUpProviderElement extends AutoDisposeFutureProviderElement<void>
    with SignUpRef {
  _SignUpProviderElement(super.provider);

  @override
  String get userName => (origin as SignUpProvider).userName;
  @override
  String get email => (origin as SignUpProvider).email;
  @override
  String get phone => (origin as SignUpProvider).phone;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
