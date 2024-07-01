import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:delta/src/shared/storage.dart';
import 'package:dio/dio.dart';
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

  ref.watch(goRouterProvider).go("/signin");
}
