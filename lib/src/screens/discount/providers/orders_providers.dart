import 'dart:developer';

import 'package:delta/src/screens/bookings/data/order.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
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

  log("[Sent Order]");

  return request!.statusCode ?? 0;
}

@riverpod
Future<int> downloadPDF(DownloadPDFRef ref, {required String userID}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/pdf/$userID/download", token: token ?? "");

  log("[Download PDF]");

  return request!.statusCode ?? 0;
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
