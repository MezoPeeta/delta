// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      json['addresses'] as List<dynamic>,
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String,
      isUserHasContract: json['isUserHasContract'] as bool,
      isUserHasMaintenanceRequest: json['isUserHasMaintenanceRequest'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'isUserHasContract': instance.isUserHasContract,
      'isUserHasMaintenanceRequest': instance.isUserHasMaintenanceRequest,
    };
