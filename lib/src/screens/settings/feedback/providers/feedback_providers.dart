import 'package:delta/src/app.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/dio_helper.dart';

part 'feedback_providers.g.dart';

@riverpod
Future<void> sendFeedback(SendFeedbackRef ref,
    {required String userName,
    required String phone,
    required String message}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/complaints/create",
      {"name": userName, "phone": phone, "message": message},
      options: Options(headers: {"Authorization": "Bearer $token"}));

  if (request!.statusCode == 200) {
    snackbarKey.currentState!.showSnackBar(
        const SnackBar(content: Text("تم ارسال الشكوي بنجاح و سنرد قريبا")));
  }
}
