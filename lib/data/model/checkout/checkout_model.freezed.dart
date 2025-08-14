// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutModel {

 int get addressId; String get paymentMethod; int? get cardId;
/// Create a copy of CheckoutModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutModelCopyWith<CheckoutModel> get copyWith => _$CheckoutModelCopyWithImpl<CheckoutModel>(this as CheckoutModel, _$identity);

  /// Serializes this CheckoutModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutModel&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.cardId, cardId) || other.cardId == cardId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addressId,paymentMethod,cardId);

@override
String toString() {
  return 'CheckoutModel(addressId: $addressId, paymentMethod: $paymentMethod, cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class $CheckoutModelCopyWith<$Res>  {
  factory $CheckoutModelCopyWith(CheckoutModel value, $Res Function(CheckoutModel) _then) = _$CheckoutModelCopyWithImpl;
@useResult
$Res call({
 int addressId, String paymentMethod, int? cardId
});




}
/// @nodoc
class _$CheckoutModelCopyWithImpl<$Res>
    implements $CheckoutModelCopyWith<$Res> {
  _$CheckoutModelCopyWithImpl(this._self, this._then);

  final CheckoutModel _self;
  final $Res Function(CheckoutModel) _then;

/// Create a copy of CheckoutModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addressId = null,Object? paymentMethod = null,Object? cardId = freezed,}) {
  return _then(_self.copyWith(
addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,cardId: freezed == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CheckoutModel implements CheckoutModel {
  const _CheckoutModel({required this.addressId, required this.paymentMethod, required this.cardId});
  factory _CheckoutModel.fromJson(Map<String, dynamic> json) => _$CheckoutModelFromJson(json);

@override final  int addressId;
@override final  String paymentMethod;
@override final  int? cardId;

/// Create a copy of CheckoutModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutModelCopyWith<_CheckoutModel> get copyWith => __$CheckoutModelCopyWithImpl<_CheckoutModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutModel&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.cardId, cardId) || other.cardId == cardId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addressId,paymentMethod,cardId);

@override
String toString() {
  return 'CheckoutModel(addressId: $addressId, paymentMethod: $paymentMethod, cardId: $cardId)';
}


}

/// @nodoc
abstract mixin class _$CheckoutModelCopyWith<$Res> implements $CheckoutModelCopyWith<$Res> {
  factory _$CheckoutModelCopyWith(_CheckoutModel value, $Res Function(_CheckoutModel) _then) = __$CheckoutModelCopyWithImpl;
@override @useResult
$Res call({
 int addressId, String paymentMethod, int? cardId
});




}
/// @nodoc
class __$CheckoutModelCopyWithImpl<$Res>
    implements _$CheckoutModelCopyWith<$Res> {
  __$CheckoutModelCopyWithImpl(this._self, this._then);

  final _CheckoutModel _self;
  final $Res Function(_CheckoutModel) _then;

/// Create a copy of CheckoutModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addressId = null,Object? paymentMethod = null,Object? cardId = freezed,}) {
  return _then(_CheckoutModel(
addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,cardId: freezed == cardId ? _self.cardId : cardId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
