import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address(String? city, String? area, String? street,
      String? building, String? flat, int? latitude, int? longitude,
      {@JsonKey(name: '_id') required String id}) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
