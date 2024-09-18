import 'dart:developer';
import 'dart:io';

import 'package:delta/src/app.dart';
import 'package:delta/src/screens/bookings/data/order.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../shared/dio_helper.dart';

part 'orders_providers.g.dart';

@riverpod
Future<int> sendOrder(SendOrderRef ref, {required String address}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/orders/",
      {
        "address": address,
      },
      options: Options(headers: {"Authorization": "Bearer $token"}));
  final status = request?.statusCode ?? 0;

  log("[Sent Order]: $address");

  return status;
}

@riverpod
Future<int> downloadOrderPDF(DownloadOrderPDFRef ref,
    {required String pdfID}) async {
  final token = await ref.watch(tokenProvider.future);

  final download = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/order-contract/$pdfID/download", token: token ?? "");

  final downloadURL = download?.data["data"]["downloadUrl"];

  final iosPath = await getDownloadsDirectory();

  String? savePath;
  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("جاري تحميل العقد")));
  if (Platform.isAndroid) {
    Directory? saveDir = Directory('/storage/emulated/0/Download');
    savePath = saveDir.path;
    // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
    // ignore: avoid_slow_async_io
    if (!await saveDir.exists()) saveDir = await getExternalStorageDirectory();
    savePath = '${saveDir?.path}/contract.pdf';
  } else {
    savePath = '${iosPath?.path}/contract.pdf';
  }
  print(downloadURL);
  await Dio().download(
    downloadURL,
    savePath,
  );
  snackbarKey.currentState!.showSnackBar(
      const SnackBar(content: Text("تم الانتهاء من تحميل العقد")));
  return download?.statusCode ?? 0;
}

@riverpod
Future<int> downloadContractPDF(DownloadContractPDFRef ref,
    {required String pdfID}) async {
  final token = await ref.watch(tokenProvider.future);
  final download = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/maintenance-contract/$pdfID/download", token: token ?? "");

  final downloadURL = download?.data["data"]["downloadUrl"];

  final iosPath = await getDownloadsDirectory();

  String? savePath;
  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("جاري تحميل العقد")));
  if (Platform.isAndroid) {
    savePath = "/storage/emulated/0/Download/contract.pdf";
  } else {
    savePath = '${iosPath?.path}/عقد صيانة.pdf';
  }
  await Dio().download(
    downloadURL,
    savePath,
  );
  snackbarKey.currentState!.showSnackBar(
      const SnackBar(content: Text("تم الانتهاء من تحميل العقد")));
  return download?.statusCode ?? 0;
}

@riverpod
Future<List<CartItem>> getCart(GetCartRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/carts/?limit=50", token: token ?? "");
  return request?.data["data"]["cart"]["items"]
      .map<CartItem>((e) => CartItem.fromJson(e))
      .toList();
}
