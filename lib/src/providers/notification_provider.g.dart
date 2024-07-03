// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendFCMTokenHash() => r'f63d79f95def0cdb418f8bf3bf2cb828003c390c';

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
String _$getNotificationsHash() => r'1e0a8b785edb4ff12bd5b3d699c2512564d2b42f';

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
