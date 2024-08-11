import 'dart:developer';

import 'package:delta/src/app.dart';
import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repair_providers.g.dart';

@riverpod
Future<void> sendMaintenanceRequest(SendMaintenanceRequestRef ref,
    {required String type,
    required String address,
    required String description,
    required String date,
    required String time}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/maintenance-requests/",
      {
        "type": type,
        "address": address,
        "description": description,
        "date": date,
        "time": time
      },
      options: Options(headers: {"Authorization": "Bearer $token"}));

  if (request!.statusCode == 200) {
    snackbarKey.currentState!.showSnackBar(
        const SnackBar(content: Text("تم ارسال طلب صيانة بنجاح")));
  }
  return;
}
