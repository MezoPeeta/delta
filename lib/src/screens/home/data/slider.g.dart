// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderImpl _$$SliderImplFromJson(Map<String, dynamic> json) => _$SliderImpl(
      status: json['status'] as String,
      results: (json['results'] as num).toInt(),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SliderImplToJson(_$SliderImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'results': instance.results,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };

_$PhotoImpl _$$PhotoImplFromJson(Map<String, dynamic> json) => _$PhotoImpl(
      id: json['_id'] as String,
      photoUrl: json['photoUrl'] as String,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$PhotoImplToJson(_$PhotoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'photoUrl': instance.photoUrl,
      'productId': instance.productId,
    };
