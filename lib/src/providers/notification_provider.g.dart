// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendFCMTokenHash() => r'1f5fd4eff066d5d5bd531798118d09e6218616d5';

/// See also [sendFCMToken].
@ProviderFor(sendFCMToken)
final sendFCMTokenProvider = AutoDisposeFutureProvider<void>.internal(
  sendFCMToken,
  name: r'sendFCMTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sendFCMTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SendFCMTokenRef = AutoDisposeFutureProviderRef<void>;
String _$getNotificationsHash() => r'c5d142d1f41cd5a31f3c7768e374f20d150a1def';

/// See also [getNotifications].
@ProviderFor(getNotifications)
final getNotificationsProvider =
    AutoDisposeFutureProvider<List<Notif>>.internal(
  getNotifications,
  name: r'getNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetNotificationsRef = AutoDisposeFutureProviderRef<List<Notif>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
