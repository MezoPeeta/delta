import 'dart:developer';
import 'dart:io';

import 'package:delta/src/app.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final dioHelperProvider = Provider(DioHelper.new);

class DioHelper {
  final Ref ref;
  DioHelper(this.ref);
  static const String url = 'https://api.delta-for-elmvators.me';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options, handler) =>
                handler.next(options),
            onError: (DioException e, handler) async {
              if (e.response?.statusCode == 429) {
                await Future.delayed(const Duration(hours: 1));
              }
              return handler.next(e);
            }),
      );
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response?> getHTTP(String url, {String token = ""}) async {
    try {
      
      final response = await baseAPI.get(url,
          options: token != ""
              ? Options(headers: {"Authorization": "Bearer $token"})
              : null);
      return response;
    } on DioException catch (e) {
      log("[Get Request Error]", error: e);
      log("[Get Request Error Data]| ${e.response!.data}");
      final errorMessage = e.response!.data["message"];
      if (errorMessage == "PDF not found") {
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("لا يوجد عقد حاليا")));
        return null;
      }
    }
    return null;
  }

  Future<Response?> postHTTP(String url, dynamic data,
      {Options? options}) async {
    try {
      Response response = await baseAPI.post(url, data: data, options: options);
      return response;
    } on DioException catch (e) {
      final errorMessage = e.response!.data["message"];

      if (errorMessage == "Incorrect phone or password") {
        snackbarKey.currentState!.showSnackBar(const SnackBar(
            content: Text("رقم الهاتف أو كلمة المرور غير صحيحة")));
        return null;
      }
      if (errorMessage == "User already exists") {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("هذا الحساب موجود بالفعل")));
      }
      if (errorMessage.contains("phone") && errorMessage.contains("index")) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("هذا الرقم متسجل من قبل")));
      }
      if (errorMessage.contains("index: email_1 dup")) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("هذا الايميل متسجل من قبل")));
      }
      if (errorMessage == "There is no user with that email address.") {
        snackbarKey.currentState!
            .showSnackBar(const SnackBar(content: Text("لا يوجد ايميل بهذا")));
      }
      if (errorMessage == "You already have an active maintenance request") {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("لقد ارسلت طلب صيانة من قبل")));
      }
      if (errorMessage == "Product is already in the cart") {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("هذا المنتج موجود بالفعل")));
      }
      if (errorMessage.contains("(reading 'isVerified')")) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("هذا الحساب غير موجود")));
        return null;
      }
      if (errorMessage == "Cart is empty") {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("لا يوجد طلبات في السلة")));

        return null;
      }
      if (errorMessage.contains("Your current password is wrong")) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("كلمة المرور الحالية غير صحيحة")));
        return null;
      }
      if (e.response!.statusCode == 403) {
        snackbarKey.currentState!.showSnackBar(const SnackBar(
            content: Text("الحساب غير مفعل, ارجو من تفعيل الحساب")));
        ref.watch(goRouterProvider).go("/otp_verify", extra: '');
      }
      snackbarKey.currentState!.showSnackBar(
          SnackBar(content: Text("مشكلة سيرفر ${e.response?.statusCode}")));
      log("PostError", error: "$errorMessage | ${e.response?.statusCode}");
      return null;
    }
  }

  Future<Response?> patchHTTP(String url, dynamic data,
      {String token = ""}) async {
    try {
      Response response = await baseAPI.patch(url,
          data: data,
          options: token != ""
              ? Options(headers: {"Authorization": "Bearer $token"})
              : null);
      return response;
    } on DioException catch (e) {
      log("[PATCH Request Error Data]| ${e.response!.data}");
      if (e.response?.data["message"].contains("current password")) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("كلمة المرور الحالية غير صحيحة")));
        return null;
      }
    }
    return null;
  }

  Future<Response?> deleteHTTP(String url, dynamic data,
      {String token = ""}) async {
    try {
      Response response = await baseAPI.delete(url,
          data: data,
          options: token != ""
              ? Options(headers: {"Authorization": "Bearer $token"})
              : null);
      return response;
    } on DioException catch (e) {
      log("[Delete Request Error]", error: e);
      log("[Delete Request Error Data]| ${e.response!.data}");
    }
    return null;
  }

  Future<Response?> downloadHTTP(String url, dynamic data,
      {String token = ""}) async {
    print("Downloading");
    try {
      final savePath = await getDownloadsDirectory();
      final pdfPath = "${savePath?.path}/contract.pdf";

      Response response = await baseAPI.download(url, pdfPath,
          data: data,
          options: Options(headers: {"Content-Type": "application/json"}));
      print(response.data);
      return response;
    } on DioException catch (e) {
      log("[Download Request Error]", error: e);
      log("[Download Request Error Data]| ${e.response!.data}");
    }
    return null;
  }
}
