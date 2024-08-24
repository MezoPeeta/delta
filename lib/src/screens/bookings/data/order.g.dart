// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['_id'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      firstBatch: json['firstBatch'] as String,
      secondBatch: json['secondBatch'] as String,
      thirdBatch: json['thirdBatch'] as String,
      contractStages: json['contractStages'] as String,
      implementationStages: json['implementationStages'] as String,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cartItems': instance.cartItems,
      'status': instance.status,
      'firstBatch': instance.firstBatch,
      'secondBatch': instance.secondBatch,
      'thirdBatch': instance.thirdBatch,
      'contractStages': instance.contractStages,
      'implementationStages': instance.implementationStages,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
