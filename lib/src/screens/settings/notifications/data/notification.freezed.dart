// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notif _$NotifFromJson(Map<String, dynamic> json) {
  return _Notif.fromJson(json);
}

/// @nodoc
mixin _$Notif {
// ignore: invalid_annotation_target
  String? get userId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;

  /// Serializes this Notif to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotifCopyWith<Notif> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifCopyWith<$Res> {
  factory $NotifCopyWith(Notif value, $Res Function(Notif) then) =
      _$NotifCopyWithImpl<$Res, Notif>;
  @useResult
  $Res call({String? userId, String? title, String? body});
}

/// @nodoc
class _$NotifCopyWithImpl<$Res, $Val extends Notif>
    implements $NotifCopyWith<$Res> {
  _$NotifCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotifImplCopyWith<$Res> implements $NotifCopyWith<$Res> {
  factory _$$NotifImplCopyWith(
          _$NotifImpl value, $Res Function(_$NotifImpl) then) =
      __$$NotifImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? title, String? body});
}

/// @nodoc
class __$$NotifImplCopyWithImpl<$Res>
    extends _$NotifCopyWithImpl<$Res, _$NotifImpl>
    implements _$$NotifImplCopyWith<$Res> {
  __$$NotifImplCopyWithImpl(
      _$NotifImpl _value, $Res Function(_$NotifImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notif
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$NotifImpl(
      freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotifImpl implements _Notif {
  const _$NotifImpl(this.userId, this.title, this.body);

  factory _$NotifImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotifImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  final String? userId;
  @override
  final String? title;
  @override
  final String? body;

  @override
  String toString() {
    return 'Notif(userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotifImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, title, body);

  /// Create a copy of Notif
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifImplCopyWith<_$NotifImpl> get copyWith =>
      __$$NotifImplCopyWithImpl<_$NotifImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotifImplToJson(
      this,
    );
  }
}

abstract class _Notif implements Notif {
  const factory _Notif(
          final String? userId, final String? title, final String? body) =
      _$NotifImpl;

  factory _Notif.fromJson(Map<String, dynamic> json) = _$NotifImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  String? get userId;
  @override
  String? get title;
  @override
  String? get body;

  /// Create a copy of Notif
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotifImplCopyWith<_$NotifImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
