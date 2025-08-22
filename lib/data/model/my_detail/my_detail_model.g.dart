// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyDetailModel _$MyDetailModelFromJson(Map<String, dynamic> json) =>
    _MyDetailModel(
      gender: json['gender'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      birthDate: json['birthDate'] as String,
    );

Map<String, dynamic> _$MyDetailModelToJson(_MyDetailModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'birthDate': instance.birthDate,
    };
