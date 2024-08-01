// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      json['city'] as String?,
      json['area'] as String?,
      json['street'] as String?,
      json['building'] as String?,
      json['flat'] as String?,
      json['locationLink'] as String?,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'area': instance.area,
      'street': instance.street,
      'building': instance.building,
      'flat': instance.flat,
      'locationLink': instance.locationLink,
      '_id': instance.id,
    };
