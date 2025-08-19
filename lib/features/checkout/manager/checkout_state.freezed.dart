// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 CartModel? get cart; CheckoutStatus get status; PaymentModel? get card; AddressModel? get address; String? get errorMessage;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.status, status) || other.status == status)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,cart,status,card,address,errorMessage);

@override
String toString() {
  return 'CheckoutState(cart: $cart, status: $status, card: $card, address: $address, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CartModel? cart, CheckoutStatus status, PaymentModel? card, AddressModel? address, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? cart = freezed,Object? status = null,Object? card = freezed,Object? address = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
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


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutState value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CartModel? cart,  CheckoutStatus status,  PaymentModel? card,  AddressModel? address,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.cart,_that.status,_that.card,_that.address,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CartModel? cart,  CheckoutStatus status,  PaymentModel? card,  AddressModel? address,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.cart,_that.status,_that.card,_that.address,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CartModel? cart,  CheckoutStatus status,  PaymentModel? card,  AddressModel? address,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.cart,_that.status,_that.card,_that.address,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState implements CheckoutState {
  const _CheckoutState({required this.cart, required this.status, required this.card, required this.address, required this.errorMessage});
  

@override final  CartModel? cart;
@override final  CheckoutStatus status;
@override final  PaymentModel? card;
@override final  AddressModel? address;
@override final  String? errorMessage;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.status, status) || other.status == status)&&(identical(other.card, card) || other.card == card)&&(identical(other.address, address) || other.address == address)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,cart,status,card,address,errorMessage);

@override
String toString() {
  return 'CheckoutState(cart: $cart, status: $status, card: $card, address: $address, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CartModel? cart, CheckoutStatus status, PaymentModel? card, AddressModel? address, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? cart = freezed,Object? status = null,Object? card = freezed,Object? address = freezed,Object? errorMessage = freezed,}) {
  return _then(_CheckoutState(
cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as CartModel?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CheckoutStatus,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as PaymentModel?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
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
