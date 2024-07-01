import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio_helper.dart';

part 'reset_pass_providers.g.dart';

@riverpod
Future<void> resetPassword(ResetPasswordRef ref,
    {required String email,
    required String password,
    required String confirmPassword}) async {
  final request = await ref.watch(dioHelperProvider).patchHTTP(
      "/api/users/forgotPassword", {
    "email": email,
    "password": password,
    "confirm_password": confirmPassword
  });
}
