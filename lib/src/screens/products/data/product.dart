import 'package:delta/src/screens/products/data/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@Freezed(copyWith: true)
class Product with _$Product {
  const factory Product({
    @JsonKey(name: '_id') required String id,
    String? name,
    String? description,
    String? mainPhoto,
    Category? category,
    List<String>? photos,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
