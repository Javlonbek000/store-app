// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {

 CartModel? get cart; CheckoutStatus get status; PaymentModel? get card; AddressModel? get address;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.status, status) || other.status == status)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,cart,status,card,address);

@override
String toString() {
  return 'CheckoutState(cart: $cart, status: $status, card: $card, address: $address)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CartModel? cart, CheckoutStatus status, PaymentModel? card, AddressModel? address
});


$CartModelCopyWith<$Res>? get cart;$PaymentModelCopyWith<$Res>? get card;$AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cart = freezed,Object? status = null,Object? card = freezed,Object? address = freezed,}) {
  return _then(_self.copyWith(
cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,
  ));
}
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartModelCopyWith<$Res>? get cart {
    if (_self.cart == null) {
    return null;
  }

  return $CartModelCopyWith<$Res>(_self.cart!, (value) {
    return _then(_self.copyWith(cart: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res>? get card {
    if (_self.card == null) {
    return null;
  }

  return $PaymentModelCopyWith<$Res>(_self.card!, (value) {
    return _then(_self.copyWith(card: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// @nodoc


class _CheckoutState implements CheckoutState {
  const _CheckoutState({required this.cart, required this.status, required this.card, required this.address});
  

@override final  CartModel? cart;
@override final  CheckoutStatus status;
@override final  PaymentModel? card;
@override final  AddressModel? address;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.status, status) || other.status == status)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,cart,status,card,address);

@override
String toString() {
  return 'CheckoutState(cart: $cart, status: $status, card: $card, address: $address)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CartModel? cart, CheckoutStatus status, PaymentModel? card, AddressModel? address
});


@override $CartModelCopyWith<$Res>? get cart;@override $PaymentModelCopyWith<$Res>? get card;@override $AddressModelCopyWith<$Res>? get address;

}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cart = freezed,Object? status = null,Object? card = freezed,Object? address = freezed,}) {
  return _then(_CheckoutState(
cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,
  ));
}

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartModelCopyWith<$Res>? get cart {
    if (_self.cart == null) {
    return null;
  }

  return $CartModelCopyWith<$Res>(_self.cart!, (value) {
    return _then(_self.copyWith(cart: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<$Res>? get card {
    if (_self.card == null) {
    return null;
  }

  return $PaymentModelCopyWith<$Res>(_self.card!, (value) {
    return _then(_self.copyWith(card: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressModelCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressModelCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
