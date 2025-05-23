// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressModel _$AddressModelFromJson(Map<String, dynamic> json) =>
    _AddressModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      fullAddress: json['fullAddress'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$AddressModelToJson(_AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'fullAddress': instance.fullAddress,
      'lat': instance.lat,
      'lng': instance.lng,
      'isDefault': instance.isDefault,
    };

_NewAddressModel _$NewAddressModelFromJson(Map<String, dynamic> json) =>
    _NewAddressModel(
      title: json['title'] as String,
      fullAddress: json['fullAddress'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      isDefault: json['isDefault'] as bool,
    );

Map<String, dynamic> _$NewAddressModelToJson(_NewAddressModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'fullAddress': instance.fullAddress,
      'lat': instance.lat,
      'lng': instance.lng,
      'isDefault': instance.isDefault,
    };
