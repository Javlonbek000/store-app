// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressModel {

 int get id; String get title; String get fullAddress; double get lat; double get lng; bool get isDefault;
/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressModelCopyWith<AddressModel> get copyWith => _$AddressModelCopyWithImpl<AddressModel>(this as AddressModel, _$identity);

  /// Serializes this AddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,fullAddress,lat,lng,isDefault);

@override
String toString() {
  return 'AddressModel(id: $id, title: $title, fullAddress: $fullAddress, lat: $lat, lng: $lng, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $AddressModelCopyWith<$Res>  {
  factory $AddressModelCopyWith(AddressModel value, $Res Function(AddressModel) _then) = _$AddressModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String fullAddress, double lat, double lng, bool isDefault
});




}
/// @nodoc
class _$AddressModelCopyWithImpl<$Res>
    implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._self, this._then);

  final AddressModel _self;
  final $Res Function(AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AddressModel implements AddressModel {
  const _AddressModel({required this.id, required this.title, required this.fullAddress, required this.lat, required this.lng, required this.isDefault});
  factory _AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String fullAddress;
@override final  double lat;
@override final  double lng;
@override final  bool isDefault;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressModelCopyWith<_AddressModel> get copyWith => __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,fullAddress,lat,lng,isDefault);

@override
String toString() {
  return 'AddressModel(id: $id, title: $title, fullAddress: $fullAddress, lat: $lat, lng: $lng, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$AddressModelCopyWith<$Res> implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(_AddressModel value, $Res Function(_AddressModel) _then) = __$AddressModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String fullAddress, double lat, double lng, bool isDefault
});




}
/// @nodoc
class __$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(this._self, this._then);

  final _AddressModel _self;
  final $Res Function(_AddressModel) _then;

/// Create a copy of AddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? isDefault = null,}) {
  return _then(_AddressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NewAddressModel {

 String get title; String get fullAddress; double get lat; double get lng; bool get isDefault;
/// Create a copy of NewAddressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewAddressModelCopyWith<NewAddressModel> get copyWith => _$NewAddressModelCopyWithImpl<NewAddressModel>(this as NewAddressModel, _$identity);

  /// Serializes this NewAddressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewAddressModel&&(identical(other.title, title) || other.title == title)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,fullAddress,lat,lng,isDefault);

@override
String toString() {
  return 'NewAddressModel(title: $title, fullAddress: $fullAddress, lat: $lat, lng: $lng, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $NewAddressModelCopyWith<$Res>  {
  factory $NewAddressModelCopyWith(NewAddressModel value, $Res Function(NewAddressModel) _then) = _$NewAddressModelCopyWithImpl;
@useResult
$Res call({
 String title, String fullAddress, double lat, double lng, bool isDefault
});




}
/// @nodoc
class _$NewAddressModelCopyWithImpl<$Res>
    implements $NewAddressModelCopyWith<$Res> {
  _$NewAddressModelCopyWithImpl(this._self, this._then);

  final NewAddressModel _self;
  final $Res Function(NewAddressModel) _then;

/// Create a copy of NewAddressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NewAddressModel implements NewAddressModel {
  const _NewAddressModel({required this.title, required this.fullAddress, required this.lat, required this.lng, required this.isDefault});
  factory _NewAddressModel.fromJson(Map<String, dynamic> json) => _$NewAddressModelFromJson(json);

@override final  String title;
@override final  String fullAddress;
@override final  double lat;
@override final  double lng;
@override final  bool isDefault;

/// Create a copy of NewAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewAddressModelCopyWith<_NewAddressModel> get copyWith => __$NewAddressModelCopyWithImpl<_NewAddressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewAddressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewAddressModel&&(identical(other.title, title) || other.title == title)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,fullAddress,lat,lng,isDefault);

@override
String toString() {
  return 'NewAddressModel(title: $title, fullAddress: $fullAddress, lat: $lat, lng: $lng, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$NewAddressModelCopyWith<$Res> implements $NewAddressModelCopyWith<$Res> {
  factory _$NewAddressModelCopyWith(_NewAddressModel value, $Res Function(_NewAddressModel) _then) = __$NewAddressModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String fullAddress, double lat, double lng, bool isDefault
});




}
/// @nodoc
class __$NewAddressModelCopyWithImpl<$Res>
    implements _$NewAddressModelCopyWith<$Res> {
  __$NewAddressModelCopyWithImpl(this._self, this._then);

  final _NewAddressModel _self;
  final $Res Function(_NewAddressModel) _then;

/// Create a copy of NewAddressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? isDefault = null,}) {
  return _then(_NewAddressModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
