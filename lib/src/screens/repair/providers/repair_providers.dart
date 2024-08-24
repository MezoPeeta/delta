import 'dart:developer';
import 'dart:io';

import 'package:delta/src/app.dart';
import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repair_providers.g.dart';

Future<MultipartFile> uploadMultipart(
    {required File file, required Ref ref}) async {
  String fileName = file.path.split('/').last;

  return await MultipartFile.fromFile(file.path, filename: fileName);
}

@riverpod
Future<void> sendMaintenanceRequest(SendMaintenanceRequestRef ref,
    {required String type,
    required String address,
    required List<File> photos,
    required File video,
    required String description,
    required String date,
    required String time}) async {
  FormData formData = FormData.fromMap({
    "type": type,
    "address": address,
    "description": description,
    "date": date,
    "time": time,
    "video": video.path == "" ? "" : await MultipartFile.fromFile(video.path),
  });

  for (var file in photos) {
    formData.files
        .addAll([MapEntry("photos", await MultipartFile.fromFile(file.path))]);
  }

  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/maintenance-requests/", formData,
      options: Options(headers: {"Authorization": "Bearer $token"}));
  log(request.toString());

  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("تم ارسال طلب صيانة بنجاح")));

  return;
}
