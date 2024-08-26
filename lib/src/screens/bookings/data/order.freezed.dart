// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  List<CartItem> get cartItems => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get userPhone => throw _privateConstructorUsedError;
  DateTime get firstBatch => throw _privateConstructorUsedError;
  DateTime get secondBatch => throw _privateConstructorUsedError;
  DateTime get thirdBatch => throw _privateConstructorUsedError;
  String get contractStages => throw _privateConstructorUsedError;
  String get implementationStages => throw _privateConstructorUsedError;
  String? get pdfId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<CartItem> cartItems,
      String status,
      @JsonKey(name: 'name') String userName,
      @JsonKey(name: 'phone') String userPhone,
      DateTime firstBatch,
      DateTime secondBatch,
      DateTime thirdBatch,
      String contractStages,
      String implementationStages,
      String? pdfId,
      DateTime createdAt});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartItems = null,
    Object? status = null,
    Object? userName = null,
    Object? userPhone = null,
    Object? firstBatch = null,
    Object? secondBatch = null,
    Object? thirdBatch = null,
    Object? contractStages = null,
    Object? implementationStages = null,
    Object? pdfId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      firstBatch: null == firstBatch
          ? _value.firstBatch
          : firstBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      secondBatch: null == secondBatch
          ? _value.secondBatch
          : secondBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thirdBatch: null == thirdBatch
          ? _value.thirdBatch
          : thirdBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contractStages: null == contractStages
          ? _value.contractStages
          : contractStages // ignore: cast_nullable_to_non_nullable
              as String,
      implementationStages: null == implementationStages
          ? _value.implementationStages
          : implementationStages // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: freezed == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      List<CartItem> cartItems,
      String status,
      @JsonKey(name: 'name') String userName,
      @JsonKey(name: 'phone') String userPhone,
      DateTime firstBatch,
      DateTime secondBatch,
      DateTime thirdBatch,
      String contractStages,
      String implementationStages,
      String? pdfId,
      DateTime createdAt});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartItems = null,
    Object? status = null,
    Object? userName = null,
    Object? userPhone = null,
    Object? firstBatch = null,
    Object? secondBatch = null,
    Object? thirdBatch = null,
    Object? contractStages = null,
    Object? implementationStages = null,
    Object? pdfId = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      firstBatch: null == firstBatch
          ? _value.firstBatch
          : firstBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      secondBatch: null == secondBatch
          ? _value.secondBatch
          : secondBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thirdBatch: null == thirdBatch
          ? _value.thirdBatch
          : thirdBatch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contractStages: null == contractStages
          ? _value.contractStages
          : contractStages // ignore: cast_nullable_to_non_nullable
              as String,
      implementationStages: null == implementationStages
          ? _value.implementationStages
          : implementationStages // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: freezed == pdfId
          ? _value.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {@JsonKey(name: '_id') required this.id,
      required final List<CartItem> cartItems,
      required this.status,
      @JsonKey(name: 'name') required this.userName,
      @JsonKey(name: 'phone') required this.userPhone,
      required this.firstBatch,
      required this.secondBatch,
      required this.thirdBatch,
      required this.contractStages,
      required this.implementationStages,
      this.pdfId,
      required this.createdAt})
      : _cartItems = cartItems;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  final List<CartItem> _cartItems;
  @override
  List<CartItem> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final String status;
  @override
  @JsonKey(name: 'name')
  final String userName;
  @override
  @JsonKey(name: 'phone')
  final String userPhone;
  @override
  final DateTime firstBatch;
  @override
  final DateTime secondBatch;
  @override
  final DateTime thirdBatch;
  @override
  final String contractStages;
  @override
  final String implementationStages;
  @override
  final String? pdfId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Order(id: $id, cartItems: $cartItems, status: $status, userName: $userName, userPhone: $userPhone, firstBatch: $firstBatch, secondBatch: $secondBatch, thirdBatch: $thirdBatch, contractStages: $contractStages, implementationStages: $implementationStages, pdfId: $pdfId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.firstBatch, firstBatch) ||
                other.firstBatch == firstBatch) &&
            (identical(other.secondBatch, secondBatch) ||
                other.secondBatch == secondBatch) &&
            (identical(other.thirdBatch, thirdBatch) ||
                other.thirdBatch == thirdBatch) &&
            (identical(other.contractStages, contractStages) ||
                other.contractStages == contractStages) &&
            (identical(other.implementationStages, implementationStages) ||
                other.implementationStages == implementationStages) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_cartItems),
      status,
      userName,
      userPhone,
      firstBatch,
      secondBatch,
      thirdBatch,
      contractStages,
      implementationStages,
      pdfId,
      createdAt);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {@JsonKey(name: '_id') required final String id,
      required final List<CartItem> cartItems,
      required final String status,
      @JsonKey(name: 'name') required final String userName,
      @JsonKey(name: 'phone') required final String userPhone,
      required final DateTime firstBatch,
      required final DateTime secondBatch,
      required final DateTime thirdBatch,
      required final String contractStages,
      required final String implementationStages,
      final String? pdfId,
      required final DateTime createdAt}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  List<CartItem> get cartItems;
  @override
  String get status;
  @override
  @JsonKey(name: 'name')
  String get userName;
  @override
  @JsonKey(name: 'phone')
  String get userPhone;
  @override
  DateTime get firstBatch;
  @override
  DateTime get secondBatch;
  @override
  DateTime get thirdBatch;
  @override
  String get contractStages;
  @override
  String get implementationStages;
  @override
  String? get pdfId;
  @override
  DateTime get createdAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  Product? get product => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({Product? product, int? quantity});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product? product, int? quantity});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$CartItemImpl(
      freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(this.product, this.quantity);

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final Product? product;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'CartItem(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(final Product? product, final int? quantity) =
      _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  Product? get product;
  @override
  int? get quantity;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
