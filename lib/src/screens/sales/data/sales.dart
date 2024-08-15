import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales.freezed.dart';
part 'sales.g.dart';

@freezed
class Sales with _$Sales {
  const factory Sales(
      {@JsonKey(name: '_id') required String id,
      required String name,
      required String email,
      required String mobilePhone,
      required String whatsapp,
      
     }) = _Sales;

  factory Sales.fromJson(Map<String, Object?> json) => _$SalesFromJson(json);
}
