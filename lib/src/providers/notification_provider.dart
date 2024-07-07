import 'dart:developer';

import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/settings/settings_screen.dart';
import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/notifications.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../screens/settings/notifications/data/notification.dart';
part 'notification_provider.g.dart';

@riverpod
Future<void> sendFCMToken(SendFCMTokenRef ref) async {
  final token = await FirebaseNotifications().getToken();
  final user = await ref.watch(userStorageProvider.future);
  final userToken = await ref.watch(tokenProvider.future);
  final bool isNotify = await ref.watch(isNotifiedStorageProvider.future);
  if (isNotify) {
    await ref.watch(dioHelperProvider).postHTTP(
        "/api/notifications/registerToken",
        {"userId": user?.id, "token": token},
        options: Options(headers: {"Authorization": "Bearer $userToken"}));
    log("[Sent FCM token]");
  }
}

@riverpod
Future<List<Notif>> getNotifications(GetNotificationsRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/notifications/getNotifications", token: token ?? "");

  return request!.data["data"].map<Notif>((e) => Notif.fromJson(e)).toList();
}
