import 'dart:developer';

import 'package:delta/src/app.dart';
import 'package:delta/src/shared/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioHelperProvider = Provider(DioHelper.new);

class DioHelper {
  final Ref ref;
  DioHelper(this.ref);
  static const String url = 'https://delta-project-pzw4.onrender.com';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
            onRequest: (RequestOptions options, handler) =>
                handler.next(options),
            onError: (DioException e, handler) async {
              return handler.next(e);
            }),
      );
  }

  static final dio = createDio();

  static Future<RequestOptions> requestInterceptor(
      RequestOptions options) async {
    // Get your JWT token
    final token = await StorageRepository().read(key: "token");
    options.headers.addAll({"Authorization": "Bearer: $token"});
    return options;
  }

  Future<Response?> getHTTP(String url, {String token = ""}) async {
    try {
      Response response = await dio.get(url,
          options: token != ""
              ? Options(headers: {"Authorization": "Bearer $token"})
              : null);
      return response;
    } on DioException catch (e) {
      log("[Get Request Error]", error: e);
      log("[Get Request Error Data]| ${e.response!.data}");
    }
    return null;
  }

  Future<Response?> postHTTP(String url, dynamic data,
      {Options? options}) async {
    try {
      Response response = await dio.post(url, data: data, options: options);
      return response;
    } on DioException catch (e) {
      final errorMessage = e.response!.data["message"];

      if (errorMessage == "Incorrect phone or password") {
        snackbarKey.currentState!.showSnackBar(const SnackBar(
            content: Text("رقم الهاتف أو كلمة المرور غير صحيحة")));
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
      if (e.response!.statusCode == 500) {
        snackbarKey.currentState!.showSnackBar(
            const SnackBar(content: Text("حدث خطأ ما, حاول من جديد")));
      }
      if (e.response!.statusCode == 403) {
        snackbarKey.currentState!.showSnackBar(const SnackBar(
            content: Text("الحساب غير مفعل, ارجو من تفعيل الحساب")));
      }
      log("PostError", error: "$errorMessage | ${e.response!.statusCode}");
    }
    return null;
  }

  Future<Response?> patchHTTP(String url, dynamic data,
      {String token = ""}) async {
    try {
      Response response = await dio.patch(url,
          data: data,
          options: token != ""
              ? Options(headers: {"Authorization": "Bearer $token"})
              : null);
      return response;
    } on DioException catch (e) {
      log("[PATCH Request Error]", error: e);
      log("[PATCH Request Error Data]| ${e.response!.data}");
    }
    return null;
  }
}
