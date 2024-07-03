import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import '../../../shared/routes.dart';
import '../../../shared/storage.dart';
import 'data/user.dart';

part 'login_providers.g.dart';

final userStorageProvider = FutureProvider<User?>((ref) async {
  final currentUser = ref.watch(userProvider);
  final user = await ref.watch(currentUserProvider.future);

  return currentUser ?? user;
});

final userProvider = StateProvider<User?>((ref) {
  return null;
});

@Riverpod(keepAlive: true)
Future<User> currentUser(CurrentUserRef ref) async {
  final userToken = await ref.watch(tokenProvider.future);
  print(userToken);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/users/me", token: userToken!);
  final user = User.fromJson(request?.data["data"]["user"]);
  return user;
}

@riverpod
Future<User> login(LoginRef ref,
    {required String phone, required String password}) async {
  final request = await ref
      .watch(dioHelperProvider)
      .postHTTP("/api/users/login", {"phone": phone, "password": password});

  final String token = request?.data["token"];
  await StorageRepository().write(key: "token", value: token);
  final user = User.fromJson(request?.data["data"]["user"]);
  ref.watch(userProvider.notifier).state = user;

  ref.watch(goRouterProvider).push("/");

  return user;
}
