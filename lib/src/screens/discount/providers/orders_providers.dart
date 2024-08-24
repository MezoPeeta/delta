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
  final status = request?.statusCode ?? 0;

  log("[Sent Order]: $address");

  return status;
}

@riverpod
Future<int> downloadOrderPDF(DownloadOrderPDFRef ref,
    {required String userID}) async {
  final token = await ref.watch(tokenProvider.future);

  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/order-contract/$userID/download", token: token ?? "");

  log("[Download PDF]");

  return request!.statusCode ?? 0;
}

@riverpod
Future<String> getPDFIDByUser(GetPDFIDByUserRef ref,
    {required String userID, required bool isOrder}) async {
  final token = await ref.watch(tokenProvider.future);
  final String url = isOrder
      ? "/api/order-contract/user/$userID"
      : "/api/maintenance-contract/user/$userID";
  final request =
      await ref.watch(dioHelperProvider).getHTTP(url, token: token ?? "");

  log("[Download PDF]");
  return request?.data["message"];
}

@riverpod
Future<int> downloadContractPDF(DownloadContractPDFRef ref,
    {required String userID}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).getHTTP(
      "/api/maintenance-contract/$userID/download",
      token: token ?? "");

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
