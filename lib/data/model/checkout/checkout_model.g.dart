// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) =>
    _CheckoutModel(
      addressId: (json['addressId'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      cardId: (json['cardId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CheckoutModelToJson(_CheckoutModel instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'paymentMethod': instance.paymentMethod,
      'cardId': instance.cardId,
    };
