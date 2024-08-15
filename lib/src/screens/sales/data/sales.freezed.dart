// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sales _$SalesFromJson(Map<String, dynamic> json) {
  return _Sales.fromJson(json);
}

/// @nodoc
mixin _$Sales {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get mobilePhone => throw _privateConstructorUsedError;
  String get whatsapp => throw _privateConstructorUsedError;

  /// Serializes this Sales to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesCopyWith<Sales> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesCopyWith<$Res> {
  factory $SalesCopyWith(Sales value, $Res Function(Sales) then) =
      _$SalesCopyWithImpl<$Res, Sales>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String mobilePhone,
      String whatsapp});
}

/// @nodoc
class _$SalesCopyWithImpl<$Res, $Val extends Sales>
    implements $SalesCopyWith<$Res> {
  _$SalesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? mobilePhone = null,
    Object? whatsapp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: null == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesImplCopyWith<$Res> implements $SalesCopyWith<$Res> {
  factory _$$SalesImplCopyWith(
          _$SalesImpl value, $Res Function(_$SalesImpl) then) =
      __$$SalesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String name,
      String email,
      String mobilePhone,
      String whatsapp});
}

/// @nodoc
class __$$SalesImplCopyWithImpl<$Res>
    extends _$SalesCopyWithImpl<$Res, _$SalesImpl>
    implements _$$SalesImplCopyWith<$Res> {
  __$$SalesImplCopyWithImpl(
      _$SalesImpl _value, $Res Function(_$SalesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sales
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? mobilePhone = null,
    Object? whatsapp = null,
  }) {
    return _then(_$SalesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
      whatsapp: null == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesImpl implements _Sales {
  const _$SalesImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.email,
      required this.mobilePhone,
      required this.whatsapp});

  factory _$SalesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String mobilePhone;
  @override
  final String whatsapp;

  @override
  String toString() {
    return 'Sales(id: $id, name: $name, email: $email, mobilePhone: $mobilePhone, whatsapp: $whatsapp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobilePhone, mobilePhone) ||
                other.mobilePhone == mobilePhone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, mobilePhone, whatsapp);

  /// Create a copy of Sales
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesImplCopyWith<_$SalesImpl> get copyWith =>
      __$$SalesImplCopyWithImpl<_$SalesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesImplToJson(
      this,
    );
  }
}

abstract class _Sales implements Sales {
  const factory _Sales(
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String email,
      required final String mobilePhone,
      required final String whatsapp}) = _$SalesImpl;

  factory _Sales.fromJson(Map<String, dynamic> json) = _$SalesImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get mobilePhone;
  @override
  String get whatsapp;

  /// Create a copy of Sales
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesImplCopyWith<_$SalesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
