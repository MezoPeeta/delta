import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/screens/sales/data/sales.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';

part 'sales_provider.g.dart';

@riverpod
Future<List<Sales>> getAllSales(GetAllSalesRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/sells/", token: token ?? "");

  return request!.data["data"]["sells"]
      .map<Sales>((e) => Sales.fromJson(e))
      .toList();
}

@riverpod
Future<Sales> getSalesByID(GetSalesByIDRef ref, {required String id}) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/sells/$id", token: token ?? "");

  return Sales.fromJson(request!.data["data"]["sells"]);
}
