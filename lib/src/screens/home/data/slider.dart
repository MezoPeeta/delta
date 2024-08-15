import 'package:freezed_annotation/freezed_annotation.dart';

import '../../products/data/product.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
class Slider with _$Slider {
  const factory Slider({
    @JsonKey(name: '_id') required String id,
    required String photoUrl,
    required String productId,
  }) = _Slider;

  factory Slider.fromJson(Map<String, Object?> json) => _$SliderFromJson(json);
}
