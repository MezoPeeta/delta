import 'package:delta/src/app.dart';
import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_pass_provider.g.dart';

@riverpod
Future<void> changePassword(ChangePasswordRef ref,
    {required String currentPassword,
    required String newPassword,
    required String confirmPassword}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).patchHTTP(
      "/api/users/updateMyPassword",
      {
        "passwordCurrent": currentPassword,
        "password": newPassword,
        "confirm_password": confirmPassword
      },
      token: token!);
  print(request!.data);
  if (request.statusCode == 200) {
    snackbarKey.currentState!.showSnackBar(
        const SnackBar(content: Text("تم تغير كلمة المرور بنجاح")));
  }
}
