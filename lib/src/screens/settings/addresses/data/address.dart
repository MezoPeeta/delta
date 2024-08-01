import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@unfreezed
class Address with _$Address {
  factory Address(String? city, String? area, String? street, String? building,
      String? flat, String? locationLink,
      {@JsonKey(name: '_id') required String id}) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
