// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendOTPHash() => r'181f2ba64e3ee1ff5cf8abad7e99a6890ccd95a6';

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

/// See also [sendOTP].
@ProviderFor(sendOTP)
const sendOTPProvider = SendOTPFamily();

/// See also [sendOTP].
class SendOTPFamily extends Family<AsyncValue<void>> {
  /// See also [sendOTP].
  const SendOTPFamily();

  /// See also [sendOTP].
  SendOTPProvider call({
    required String email,
  }) {
    return SendOTPProvider(
      email: email,
    );
  }

  @override
  SendOTPProvider getProviderOverride(
    covariant SendOTPProvider provider,
  ) {
    return call(
      email: provider.email,
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
  String? get name => r'sendOTPProvider';
}

/// See also [sendOTP].
class SendOTPProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendOTP].
  SendOTPProvider({
    required String email,
  }) : this._internal(
          (ref) => sendOTP(
            ref as SendOTPRef,
            email: email,
          ),
          from: sendOTPProvider,
          name: r'sendOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendOTPHash,
          dependencies: SendOTPFamily._dependencies,
          allTransitiveDependencies: SendOTPFamily._allTransitiveDependencies,
          email: email,
        );

  SendOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendOTPProvider._internal(
        (ref) => create(ref as SendOTPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendOTPProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendOTPRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;
}

class _SendOTPProviderElement extends AutoDisposeFutureProviderElement<void>
    with SendOTPRef {
  _SendOTPProviderElement(super.provider);

  @override
  String get email => (origin as SendOTPProvider).email;
}

String _$verifyOTPHash() => r'250b5b88cd1c8f6e37bb72adcbaa75d6d7d4eec6';

/// See also [verifyOTP].
@ProviderFor(verifyOTP)
const verifyOTPProvider = VerifyOTPFamily();

/// See also [verifyOTP].
class VerifyOTPFamily extends Family<AsyncValue<void>> {
  /// See also [verifyOTP].
  const VerifyOTPFamily();

  /// See also [verifyOTP].
  VerifyOTPProvider call({
    required String email,
    required String otp,
  }) {
    return VerifyOTPProvider(
      email: email,
      otp: otp,
    );
  }

  @override
  VerifyOTPProvider getProviderOverride(
    covariant VerifyOTPProvider provider,
  ) {
    return call(
      email: provider.email,
      otp: provider.otp,
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
  String? get name => r'verifyOTPProvider';
}

/// See also [verifyOTP].
class VerifyOTPProvider extends AutoDisposeFutureProvider<void> {
  /// See also [verifyOTP].
  VerifyOTPProvider({
    required String email,
    required String otp,
  }) : this._internal(
          (ref) => verifyOTP(
            ref as VerifyOTPRef,
            email: email,
            otp: otp,
          ),
          from: verifyOTPProvider,
          name: r'verifyOTPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOTPHash,
          dependencies: VerifyOTPFamily._dependencies,
          allTransitiveDependencies: VerifyOTPFamily._allTransitiveDependencies,
          email: email,
          otp: otp,
        );

  VerifyOTPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.otp,
  }) : super.internal();

  final String email;
  final String otp;

  @override
  Override overrideWith(
    FutureOr<void> Function(VerifyOTPRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VerifyOTPProvider._internal(
        (ref) => create(ref as VerifyOTPRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        otp: otp,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _VerifyOTPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOTPProvider &&
        other.email == email &&
        other.otp == otp;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, otp.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOTPRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `otp` of this provider.
  String get otp;
}

class _VerifyOTPProviderElement extends AutoDisposeFutureProviderElement<void>
    with VerifyOTPRef {
  _VerifyOTPProviderElement(super.provider);

  @override
  String get email => (origin as VerifyOTPProvider).email;
  @override
  String get otp => (origin as VerifyOTPProvider).otp;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
