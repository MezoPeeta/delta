// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendMaintenanceRequestHash() =>
    r'a84cfb0416666e8717c58de1667283fe47a54719';

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

/// See also [sendMaintenanceRequest].
@ProviderFor(sendMaintenanceRequest)
const sendMaintenanceRequestProvider = SendMaintenanceRequestFamily();

/// See also [sendMaintenanceRequest].
class SendMaintenanceRequestFamily extends Family<AsyncValue<void>> {
  /// See also [sendMaintenanceRequest].
  const SendMaintenanceRequestFamily();

  /// See also [sendMaintenanceRequest].
  SendMaintenanceRequestProvider call({
    required String type,
    required String address,
    required String description,
    required String date,
    required String time,
  }) {
    return SendMaintenanceRequestProvider(
      type: type,
      address: address,
      description: description,
      date: date,
      time: time,
    );
  }

  @override
  SendMaintenanceRequestProvider getProviderOverride(
    covariant SendMaintenanceRequestProvider provider,
  ) {
    return call(
      type: provider.type,
      address: provider.address,
      description: provider.description,
      date: provider.date,
      time: provider.time,
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
  String? get name => r'sendMaintenanceRequestProvider';
}

/// See also [sendMaintenanceRequest].
class SendMaintenanceRequestProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendMaintenanceRequest].
  SendMaintenanceRequestProvider({
    required String type,
    required String address,
    required String description,
    required String date,
    required String time,
  }) : this._internal(
          (ref) => sendMaintenanceRequest(
            ref as SendMaintenanceRequestRef,
            type: type,
            address: address,
            description: description,
            date: date,
            time: time,
          ),
          from: sendMaintenanceRequestProvider,
          name: r'sendMaintenanceRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendMaintenanceRequestHash,
          dependencies: SendMaintenanceRequestFamily._dependencies,
          allTransitiveDependencies:
              SendMaintenanceRequestFamily._allTransitiveDependencies,
          type: type,
          address: address,
          description: description,
          date: date,
          time: time,
        );

  SendMaintenanceRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.address,
    required this.description,
    required this.date,
    required this.time,
  }) : super.internal();

  final String type;
  final String address;
  final String description;
  final String date;
  final String time;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendMaintenanceRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendMaintenanceRequestProvider._internal(
        (ref) => create(ref as SendMaintenanceRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        address: address,
        description: description,
        date: date,
        time: time,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendMaintenanceRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendMaintenanceRequestProvider &&
        other.type == type &&
        other.address == address &&
        other.description == description &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, time.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendMaintenanceRequestRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `type` of this provider.
  String get type;

  /// The parameter `address` of this provider.
  String get address;

  /// The parameter `description` of this provider.
  String get description;

  /// The parameter `date` of this provider.
  String get date;

  /// The parameter `time` of this provider.
  String get time;
}

class _SendMaintenanceRequestProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with SendMaintenanceRequestRef {
  _SendMaintenanceRequestProviderElement(super.provider);

  @override
  String get type => (origin as SendMaintenanceRequestProvider).type;
  @override
  String get address => (origin as SendMaintenanceRequestProvider).address;
  @override
  String get description =>
      (origin as SendMaintenanceRequestProvider).description;
  @override
  String get date => (origin as SendMaintenanceRequestProvider).date;
  @override
  String get time => (origin as SendMaintenanceRequestProvider).time;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
