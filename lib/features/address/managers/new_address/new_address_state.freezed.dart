// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewAddressState {

 LatLng? get currentLocation; String? get address; List<Marker> get markers; NewAddressStatus get status; String? get errorMassage;
/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewAddressStateCopyWith<NewAddressState> get copyWith => _$NewAddressStateCopyWithImpl<NewAddressState>(this as NewAddressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewAddressState&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.markers, markers)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,address,const DeepCollectionEquality().hash(markers),status,errorMassage);

@override
String toString() {
  return 'NewAddressState(currentLocation: $currentLocation, address: $address, markers: $markers, status: $status, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $NewAddressStateCopyWith<$Res>  {
  factory $NewAddressStateCopyWith(NewAddressState value, $Res Function(NewAddressState) _then) = _$NewAddressStateCopyWithImpl;
@useResult
$Res call({
 LatLng? currentLocation, String? address, List<Marker> markers, NewAddressStatus status, String? errorMassage
});




}
/// @nodoc
class _$NewAddressStateCopyWithImpl<$Res>
    implements $NewAddressStateCopyWith<$Res> {
  _$NewAddressStateCopyWithImpl(this._self, this._then);

  final NewAddressState _self;
  final $Res Function(NewAddressState) _then;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentLocation = freezed,Object? address = freezed,Object? markers = null,Object? status = null,Object? errorMassage = freezed,}) {
  return _then(_self.copyWith(
currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as List<Marker>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewAddressStatus,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewAddressState].
extension NewAddressStatePatterns on NewAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewAddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewAddressState value)  $default,){
final _that = this;
switch (_that) {
case _NewAddressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewAddressState value)?  $default,){
final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LatLng? currentLocation,  String? address,  List<Marker> markers,  NewAddressStatus status,  String? errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
return $default(_that.currentLocation,_that.address,_that.markers,_that.status,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LatLng? currentLocation,  String? address,  List<Marker> markers,  NewAddressStatus status,  String? errorMassage)  $default,) {final _that = this;
switch (_that) {
case _NewAddressState():
return $default(_that.currentLocation,_that.address,_that.markers,_that.status,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LatLng? currentLocation,  String? address,  List<Marker> markers,  NewAddressStatus status,  String? errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _NewAddressState() when $default != null:
return $default(_that.currentLocation,_that.address,_that.markers,_that.status,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _NewAddressState implements NewAddressState {
  const _NewAddressState({required this.currentLocation, required this.address, required final  List<Marker> markers, required this.status, required this.errorMassage}): _markers = markers;
  

@override final  LatLng? currentLocation;
@override final  String? address;
 final  List<Marker> _markers;
@override List<Marker> get markers {
  if (_markers is EqualUnmodifiableListView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_markers);
}

@override final  NewAddressStatus status;
@override final  String? errorMassage;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewAddressStateCopyWith<_NewAddressState> get copyWith => __$NewAddressStateCopyWithImpl<_NewAddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewAddressState&&(identical(other.currentLocation, currentLocation) || other.currentLocation == currentLocation)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._markers, _markers)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,currentLocation,address,const DeepCollectionEquality().hash(_markers),status,errorMassage);

@override
String toString() {
  return 'NewAddressState(currentLocation: $currentLocation, address: $address, markers: $markers, status: $status, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$NewAddressStateCopyWith<$Res> implements $NewAddressStateCopyWith<$Res> {
  factory _$NewAddressStateCopyWith(_NewAddressState value, $Res Function(_NewAddressState) _then) = __$NewAddressStateCopyWithImpl;
@override @useResult
$Res call({
 LatLng? currentLocation, String? address, List<Marker> markers, NewAddressStatus status, String? errorMassage
});




}
/// @nodoc
class __$NewAddressStateCopyWithImpl<$Res>
    implements _$NewAddressStateCopyWith<$Res> {
  __$NewAddressStateCopyWithImpl(this._self, this._then);

  final _NewAddressState _self;
  final $Res Function(_NewAddressState) _then;

/// Create a copy of NewAddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentLocation = freezed,Object? address = freezed,Object? markers = null,Object? status = null,Object? errorMassage = freezed,}) {
  return _then(_NewAddressState(
currentLocation: freezed == currentLocation ? _self.currentLocation : currentLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as List<Marker>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewAddressStatus,errorMassage: freezed == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
