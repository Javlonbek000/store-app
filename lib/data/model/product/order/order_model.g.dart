// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  image: json['image'] as String,
  size: json['size'] as String,
  price: (json['price'] as num).toInt(),
  status: json['status'] as String,
  rating: json['rating'] as num?,
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'size': instance.size,
      'price': instance.price,
      'status': instance.status,
      'rating': instance.rating,
    };
