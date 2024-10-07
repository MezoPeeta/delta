import 'dart:convert';
import 'dart:developer';

import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import '../../../app.dart';
import '../../../shared/dio_helper.dart';
import '../../bookings/data/order.dart';
import '../data/category.dart';

part 'product_provider.g.dart';

@riverpod
Future<Products> getProducts(GetProductsRef ref, {required String page}) async {
  final url = Uri.parse(
      "https://api.delta-for-elmvators.me/api/products/?page=$page&limit=4");

  final request = await http.get(url);

  final requestJson = jsonDecode(request.body);
  return Products.fromJson(requestJson);
}

@riverpod
Future<Products> getProductsbyCategory(GetProductsbyCategoryRef ref,
    {required String category, required String page}) async {
  final url = Uri.parse(
      "https://api.delta-for-elmvators.me/api/products/?category=$category&page=$page");

  final request = await http.get(url);
  final requestStringJson = request.body.toString();
  final requestJson = jsonDecode(requestStringJson);

  return Products.fromJson(requestJson);
}

@riverpod
Future<List<Product>> getRelatedProducts(GetRelatedProductsRef ref,
    {required String productID}) async {
  final url =
      Uri.parse("https://api.delta-for-elmvators.me/api/products/$productID");

  final request = await http.get(url);
  final data = jsonDecode(request.body);
  List<Product> products = data["data"]["relatedProducts"]
      .map<Product>((e) => Product.fromJson(e))
      .toList();
  return products;
}

@riverpod
Future<List<Category>> getCategories(
  GetCategoriesRef ref,
) async {
  final url = Uri.parse(
      "https://api.delta-for-elmvators.me/api/product-categories/?limit=9");

  final request = await http.get(url);

  final requestJson = jsonDecode(request.body);

  final categories = requestJson["data"]["categories"]
      .map<Category>((e) => Category.fromJson(e))
      .toList();

  categories.insert(0, const Category(title: "الكل"));
  return categories;
}

@riverpod
Future<List<CartItem>> addToCart(AddToCartRef ref,
    {required String productID}) async {
  final userToken = await ref.watch(tokenProvider.future);
  try {
    final request = await ref.watch(dioHelperProvider).postHTTP(
        "/api/carts/add", {"productId": productID},
        options: Options(headers: {"Authorization": "Bearer $userToken"}));

    if (request?.statusCode == 200) {
      log("[Product Added: $productID]");
      snackbarKey.currentState!
          .showSnackBar(const SnackBar(content: Text("تم اضافة المنتج بنجاح")));

      return request?.data["data"]["cart"]["items"]
          .map<CartItem>((e) => CartItem.fromJson(e))
          .toList();
    }
  } catch (e) {
    return [];
  }
  return [];
}

@riverpod
Future<List<CartItem>> deleteFromCart(DeleteFromCartRef ref,
    {required String productID}) async {
  final userToken = await ref.watch(tokenProvider.future);

  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/carts/remove", {"productId": productID},
      options: Options(headers: {"Authorization": "Bearer $userToken"}));
  if (request!.statusCode == 200) {
    log("[Product Deleted: $productID]");
    snackbarKey.currentState!
        .showSnackBar(const SnackBar(content: Text("تم حذف المنتج بنجاح")));
    return request.data["data"]["cart"]["items"]
        .map<CartItem>((e) => CartItem.fromJson(e))
        .toList();
  }
  return [];
}
