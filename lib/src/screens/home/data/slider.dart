import 'package:freezed_annotation/freezed_annotation.dart';

import '../../products/data/product.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
class Slider with _$Slider {
  const factory Slider({
    required String status,
    required int results,
    required Data data,
  }) = _Slider;

  factory Slider.fromJson(Map<String, dynamic> json) => _$SliderFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required List<Photo> photos,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Photo with _$Photo {
  const factory Photo({
    @JsonKey(name: "_id") required String id,
    required String photoUrl,
    required String productId,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
