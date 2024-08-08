import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';

part 'search_provider.g.dart';

@riverpod
Future<List<Product>> searchProduct(SearchProductRef ref,
    {required String productName}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/products/search?name=$productName", token: token ?? "");

  return request!.data["data"]["products"]
      .map<Product>((e) => Product.fromJson(e))
      .toList();
}
