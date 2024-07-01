import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import '../../../shared/routes.dart';
import '../../../shared/storage.dart';
import 'data/user.dart';

part 'login_providers.g.dart';

final userStorageProvider = FutureProvider<User>((ref) async {
  final currentUser = ref.watch(userProvider);
  final user = await StorageRepository().read(key: "user");

  return currentUser ?? User.fromJson(jsonDecode(user!));
});

final userProvider = StateProvider<User?>((ref) {
  return null;
});

@riverpod
Future<User> login(LoginRef ref,
    {required String phone, required String password}) async {
  final request = await ref
      .watch(dioHelperProvider)
      .postHTTP("/api/users/login", {"phone": phone, "password": password});

  final String token = request!.data["token"];
  await StorageRepository().write(key: "token", value: token);
  final user = User.fromJson(request.data["data"]["user"]);

  // ref.watch(userProvider.notifier).state = user;
  await StorageRepository()
      .write(key: "user", value: jsonEncode(user.toJson()));

  ref.watch(goRouterProvider).push("/");

  return user;
}
