// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendFeedbackHash() => r'ae27d88b549f8c28508c669c88e93ff707b363c6';

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

/// See also [sendFeedback].
@ProviderFor(sendFeedback)
const sendFeedbackProvider = SendFeedbackFamily();

/// See also [sendFeedback].
class SendFeedbackFamily extends Family<AsyncValue<void>> {
  /// See also [sendFeedback].
  const SendFeedbackFamily();

  /// See also [sendFeedback].
  SendFeedbackProvider call({
    required String userName,
    required String phone,
    required String message,
  }) {
    return SendFeedbackProvider(
      userName: userName,
      phone: phone,
      message: message,
    );
  }

  @override
  SendFeedbackProvider getProviderOverride(
    covariant SendFeedbackProvider provider,
  ) {
    return call(
      userName: provider.userName,
      phone: provider.phone,
      message: provider.message,
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
  String? get name => r'sendFeedbackProvider';
}

/// See also [sendFeedback].
class SendFeedbackProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendFeedback].
  SendFeedbackProvider({
    required String userName,
    required String phone,
    required String message,
  }) : this._internal(
          (ref) => sendFeedback(
            ref as SendFeedbackRef,
            userName: userName,
            phone: phone,
            message: message,
          ),
          from: sendFeedbackProvider,
          name: r'sendFeedbackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendFeedbackHash,
          dependencies: SendFeedbackFamily._dependencies,
          allTransitiveDependencies:
              SendFeedbackFamily._allTransitiveDependencies,
          userName: userName,
          phone: phone,
          message: message,
        );

  SendFeedbackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userName,
    required this.phone,
    required this.message,
  }) : super.internal();

  final String userName;
  final String phone;
  final String message;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendFeedbackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendFeedbackProvider._internal(
        (ref) => create(ref as SendFeedbackRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userName: userName,
        phone: phone,
        message: message,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendFeedbackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendFeedbackProvider &&
        other.userName == userName &&
        other.phone == phone &&
        other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);
    hash = _SystemHash.combine(hash, phone.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendFeedbackRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userName` of this provider.
  String get userName;

  /// The parameter `phone` of this provider.
  String get phone;

  /// The parameter `message` of this provider.
  String get message;
}

class _SendFeedbackProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendFeedbackRef {
  _SendFeedbackProviderElement(super.provider);

  @override
  String get userName => (origin as SendFeedbackProvider).userName;
  @override
  String get phone => (origin as SendFeedbackProvider).phone;
  @override
  String get message => (origin as SendFeedbackProvider).message;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
