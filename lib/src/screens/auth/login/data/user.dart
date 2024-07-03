import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(copyWith: true)
class User with _$User {
  const factory User(
      List addresses,
      {@JsonKey(name: '_id') required String id,
      required String name,
      required String email,
      required String role,
      required String phone,
     }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
