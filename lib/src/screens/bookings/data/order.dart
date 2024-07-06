
import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../products/data/product.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@Freezed(copyWith: true)
class Order with _$Order {
  const factory Order(
      {@JsonKey(name: '_id') required String id,
      required List<Product?> cartItems,
      required String status,
     }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}
