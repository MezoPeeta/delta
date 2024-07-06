import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import '../../../shared/routes.dart';
import '../../../shared/storage.dart';
import 'data/user.dart';

part 'login_providers.g.dart';

final userStorageProvider = FutureProvider<User?>((ref) async {
  final user = ref.watch(userProvider);
  if (user != null) {
    return user;
  }
  final currentUser = await ref.watch(currentUserProvider.future);
  return currentUser;
});

final userProvider = StateProvider<User?>((ref) {
  return null;
});

@Riverpod(keepAlive: true)
Future<User> currentUser(CurrentUserRef ref) async {
  final userToken = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/users/me", token: userToken ?? "");
  final user = User.fromJson(request?.data["data"]["user"]);
  return user;
}

@riverpod
Future<User> login(LoginRef ref,
    {required String phone, required String password}) async {
  final request = await ref
      .watch(dioHelperProvider)
      .postHTTP("/api/users/login", {"phone": phone, "password": password});

  final user = User.fromJson(request?.data["data"]["user"]);

  ref.watch(userProvider.notifier).state = user;

  final String token = request?.data["token"];

  ref.watch(tokenSProvider.notifier).state = token;
  await StorageRepository().write(key: "token", value: token);

  ref.watch(goRouterProvider).push("/");

  return user;
}
