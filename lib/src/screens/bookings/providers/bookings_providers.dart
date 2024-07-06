import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import '../../../shared/routes.dart';
import '../data/order.dart';

part 'bookings_providers.g.dart';

@riverpod
Future<List<Order>> getOrders(GetOrdersRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/orders/user", token: token ?? "");

  return request!.data["data"]["orders"].map<Order>((e) => Order.fromJson(e)).toList();
}
