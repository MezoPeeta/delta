// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  List<dynamic> get addresses => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get anotherPhone => throw _privateConstructorUsedError;
  bool get isUserHasContract => throw _privateConstructorUsedError;
  bool get isUserHasMaintenanceRequest => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {List<dynamic> addresses,
      @JsonKey(name: '_id') String id,
      String name,
      String email,
      String role,
      String phone,
      String? anotherPhone,
      bool isUserHasContract,
      bool isUserHasMaintenanceRequest});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? phone = null,
    Object? anotherPhone = freezed,
    Object? isUserHasContract = null,
    Object? isUserHasMaintenanceRequest = null,
  }) {
    return _then(_value.copyWith(
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      anotherPhone: freezed == anotherPhone
          ? _value.anotherPhone
          : anotherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isUserHasContract: null == isUserHasContract
          ? _value.isUserHasContract
          : isUserHasContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserHasMaintenanceRequest: null == isUserHasMaintenanceRequest
          ? _value.isUserHasMaintenanceRequest
          : isUserHasMaintenanceRequest // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic> addresses,
      @JsonKey(name: '_id') String id,
      String name,
      String email,
      String role,
      String phone,
      String? anotherPhone,
      bool isUserHasContract,
      bool isUserHasMaintenanceRequest});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? phone = null,
    Object? anotherPhone = freezed,
    Object? isUserHasContract = null,
    Object? isUserHasMaintenanceRequest = null,
  }) {
    return _then(_$UserImpl(
      null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      anotherPhone: freezed == anotherPhone
          ? _value.anotherPhone
          : anotherPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      isUserHasContract: null == isUserHasContract
          ? _value.isUserHasContract
          : isUserHasContract // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserHasMaintenanceRequest: null == isUserHasMaintenanceRequest
          ? _value.isUserHasMaintenanceRequest
          : isUserHasMaintenanceRequest // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(final List<dynamic> addresses,
      {@JsonKey(name: '_id') required this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.phone,
      this.anotherPhone,
      required this.isUserHasContract,
      required this.isUserHasMaintenanceRequest})
      : _addresses = addresses;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  final List<dynamic> _addresses;
  @override
  List<dynamic> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String role;
  @override
  final String phone;
  @override
  final String? anotherPhone;
  @override
  final bool isUserHasContract;
  @override
  final bool isUserHasMaintenanceRequest;

  @override
  String toString() {
    return 'User(addresses: $addresses, id: $id, name: $name, email: $email, role: $role, phone: $phone, anotherPhone: $anotherPhone, isUserHasContract: $isUserHasContract, isUserHasMaintenanceRequest: $isUserHasMaintenanceRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.anotherPhone, anotherPhone) ||
                other.anotherPhone == anotherPhone) &&
            (identical(other.isUserHasContract, isUserHasContract) ||
                other.isUserHasContract == isUserHasContract) &&
            (identical(other.isUserHasMaintenanceRequest,
                    isUserHasMaintenanceRequest) ||
                other.isUserHasMaintenanceRequest ==
                    isUserHasMaintenanceRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addresses),
      id,
      name,
      email,
      role,
      phone,
      anotherPhone,
      isUserHasContract,
      isUserHasMaintenanceRequest);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(final List<dynamic> addresses,
      {@JsonKey(name: '_id') required final String id,
      required final String name,
      required final String email,
      required final String role,
      required final String phone,
      final String? anotherPhone,
      required final bool isUserHasContract,
      required final bool isUserHasMaintenanceRequest}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  List<dynamic> get addresses;
  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get role;
  @override
  String get phone;
  @override
  String? get anotherPhone;
  @override
  bool get isUserHasContract;
  @override
  bool get isUserHasMaintenanceRequest;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
