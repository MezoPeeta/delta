import 'package:delta/src/app.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:delta/src/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@riverpod
Future<void> logOut(LogOutRef ref) async {
  final token = await StorageRepository().read(key: "token");

  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/users/logout", {},
      options: Options(headers: {"Authorization": "Bearer $token"}));
  await StorageRepository().delete(key: "token");
  await StorageRepository().delete(key: "user");
  ref.invalidate(userProvider);
  ref.watch(goRouterProvider).go("/intro");
}

@riverpod
Future<void> deleteUser(DeleteUserRef ref) async {
  final token = await StorageRepository().read(key: "token");
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/users/deleteMe", {},
      options: Options(headers: {"Authorization": "Bearer $token"}));
  await StorageRepository().delete(key: "token");
  await StorageRepository().delete(key: "user");
  ref.invalidate(userProvider);

  ref.watch(goRouterProvider).go("/intro");
  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("تم حذف الحساب بنجاح")));
}
