import 'dart:convert';

import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import 'package:http/http.dart' as http;

part 'search_provider.g.dart';

@riverpod
Future<Products> searchProduct(SearchProductRef ref,
    {required String productName}) async {
  final url = Uri.parse(
      "https://api.delta-for-elmvators.me/api/products/search?name=$productName");
  final request = await http.get(url);

  final requestJson = jsonDecode(request.body);

  return Products.fromJson(requestJson);
}
