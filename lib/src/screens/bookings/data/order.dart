import 'package:delta/src/screens/auth/login/data/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../products/data/product.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@Freezed(copyWith: true)
class Order with _$Order {
  const factory Order({
    @JsonKey(name: '_id') required String id,
    required List<CartItem> cartItems,
    required String status,
    @JsonKey(name: 'name') required String userName,
    @JsonKey(name: 'phone') required String userPhone,
    Object? firstBatch,
    Object? secondBatch,
    Object? thirdBatch,
    required String contractStages,
    required String implementationStages,
    String? pdfId,
    required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem(
    Product? product,
    int? quantity,
  ) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);
}
