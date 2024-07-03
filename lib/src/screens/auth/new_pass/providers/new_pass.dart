
import 'package:delta/src/shared/dio_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/storage.dart';
import '../../login/data/user.dart';
import '../../login/login_providers.dart';
part 'new_pass.g.dart';

@riverpod
Future<int?> setPassword(SetPasswordRef ref,
    {required String email,
    required String password,
    required String confirmPassword}) async {
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/users/set-password", {
    "email": email,
    "password": password,
    "confirm_password": confirmPassword
  });
  final String token = request!.data["token"];
  await StorageRepository().write(key: "token", value: token);
  final user = User.fromJson(request.data["data"]["user"]);



  ref.watch(userProvider.notifier).state = user;

  return request.statusCode;
}
