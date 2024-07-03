import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';

part 'product_provider.g.dart';

@riverpod
Future<List<Product>> getProducts(GetProductsRef ref) async {
  final userToken = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/products/?page=1?limit=4", token: userToken ?? "");

  return request!.data["data"]["products"]
      .map<Product>((e) => Product.fromJson(e))
      .toList();
}

@riverpod
Future<List<Product>> getProductsbyCategory(GetProductsbyCategoryRef ref,
    {required String category}) async {
  final userToken = await ref.watch(tokenProvider.future);

  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/products/?category=$category", token: userToken ?? "");

  return request!.data["data"]["products"]
      .map<Product>((e) => Product.fromJson(e))
      .toList();
}

@riverpod
Future<List> getCategories(
  GetCategoriesRef ref,
) async {
  final request =
      await ref.watch(dioHelperProvider).getHTTP("/api/product-categories/");

  return request!.data["data"]["categories"].map((e) => e["title"]).toList();
}
