import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app.dart';
import '../../../auth/login/login_providers.dart';

part 'profile_provider.g.dart';

@riverpod
Future<void> updateUser(UpdateUserRef ref,
    {String? userName, String? phone, String? newPhone}) async {
  final userToken = await ref.watch(tokenProvider.future);
  final user = await ref.watch(userStorageProvider.future);
  final request = await ref.watch(dioHelperProvider).patchHTTP(
      "/api/users/updateMe",
      {"name": userName, "phone": phone, "anotherPhone": newPhone},
      token: userToken!);

  if (request!.statusCode == 200) {
    snackbarKey.currentState!
        .showSnackBar(const SnackBar(content: Text("تم حفظ البيانات بنجاح")));
    ref.watch(userProvider.notifier).state =
        user!.copyWith(name: userName!, phone: phone!);
  }
}
