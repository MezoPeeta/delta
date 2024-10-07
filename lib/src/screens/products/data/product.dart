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


@freezed
class Products with _$Products {
    const factory Products({
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "results")
        required int results,
        @JsonKey(name: "data")
        required Data data,
    }) = _Products;

    factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        @JsonKey(name: "products")
        required List<Product> products,
        @JsonKey(name: "total")
        required int total,
        @JsonKey(name: "totalPages")
        required int totalPages,
        @JsonKey(name: "currentPage")
        required int currentPage,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
