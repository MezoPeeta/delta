// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pass_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$changePasswordHash() => r'ead6e1f3ac0ffa0a579cc432aec86d557a83919a';

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

/// See also [changePassword].
@ProviderFor(changePassword)
const changePasswordProvider = ChangePasswordFamily();

/// See also [changePassword].
class ChangePasswordFamily extends Family<AsyncValue<void>> {
  /// See also [changePassword].
  const ChangePasswordFamily();

  /// See also [changePassword].
  ChangePasswordProvider call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    return ChangePasswordProvider(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }

  @override
  ChangePasswordProvider getProviderOverride(
    covariant ChangePasswordProvider provider,
  ) {
    return call(
      currentPassword: provider.currentPassword,
      newPassword: provider.newPassword,
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
  String? get name => r'changePasswordProvider';
}

/// See also [changePassword].
class ChangePasswordProvider extends AutoDisposeFutureProvider<void> {
  /// See also [changePassword].
  ChangePasswordProvider({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) : this._internal(
          (ref) => changePassword(
            ref as ChangePasswordRef,
            currentPassword: currentPassword,
            newPassword: newPassword,
            confirmPassword: confirmPassword,
          ),
          from: changePasswordProvider,
          name: r'changePasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$changePasswordHash,
          dependencies: ChangePasswordFamily._dependencies,
          allTransitiveDependencies:
              ChangePasswordFamily._allTransitiveDependencies,
          currentPassword: currentPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword,
        );

  ChangePasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  }) : super.internal();

  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  @override
  Override overrideWith(
    FutureOr<void> Function(ChangePasswordRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChangePasswordProvider._internal(
        (ref) => create(ref as ChangePasswordRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ChangePasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChangePasswordProvider &&
        other.currentPassword == currentPassword &&
        other.newPassword == newPassword &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentPassword.hashCode);
    hash = _SystemHash.combine(hash, newPassword.hashCode);
    hash = _SystemHash.combine(hash, confirmPassword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChangePasswordRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentPassword` of this provider.
  String get currentPassword;

  /// The parameter `newPassword` of this provider.
  String get newPassword;

  /// The parameter `confirmPassword` of this provider.
  String get confirmPassword;
}

class _ChangePasswordProviderElement
    extends AutoDisposeFutureProviderElement<void> with ChangePasswordRef {
  _ChangePasswordProviderElement(super.provider);

  @override
  String get currentPassword =>
      (origin as ChangePasswordProvider).currentPassword;
  @override
  String get newPassword => (origin as ChangePasswordProvider).newPassword;
  @override
  String get confirmPassword =>
      (origin as ChangePasswordProvider).confirmPassword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
