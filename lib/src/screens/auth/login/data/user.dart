import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      // ignore: invalid_annotation_target
      {@JsonKey(name: '_id') required String id,
      required String name,
      required String email,
      required String role,
      required String phone,
      required List<String> addresses}) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
