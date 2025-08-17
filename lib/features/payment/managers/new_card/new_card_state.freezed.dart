// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_card_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewCardState {

 NewCardStatus get status; String get errorMassage;
/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewCardStateCopyWith<NewCardState> get copyWith => _$NewCardStateCopyWithImpl<NewCardState>(this as NewCardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMassage);

@override
String toString() {
  return 'NewCardState(status: $status, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class $NewCardStateCopyWith<$Res>  {
  factory $NewCardStateCopyWith(NewCardState value, $Res Function(NewCardState) _then) = _$NewCardStateCopyWithImpl;
@useResult
$Res call({
 NewCardStatus status, String errorMassage
});




}
/// @nodoc
class _$NewCardStateCopyWithImpl<$Res>
    implements $NewCardStateCopyWith<$Res> {
  _$NewCardStateCopyWithImpl(this._self, this._then);

  final NewCardState _self;
  final $Res Function(NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMassage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewCardStatus,errorMassage: null == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewCardState].
extension NewCardStatePatterns on NewCardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewCardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewCardState value)  $default,){
final _that = this;
switch (_that) {
case _NewCardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewCardState value)?  $default,){
final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NewCardStatus status,  String errorMassage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
return $default(_that.status,_that.errorMassage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NewCardStatus status,  String errorMassage)  $default,) {final _that = this;
switch (_that) {
case _NewCardState():
return $default(_that.status,_that.errorMassage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NewCardStatus status,  String errorMassage)?  $default,) {final _that = this;
switch (_that) {
case _NewCardState() when $default != null:
return $default(_that.status,_that.errorMassage);case _:
  return null;

}
}

}

/// @nodoc


class _NewCardState implements NewCardState {
  const _NewCardState({required this.status, required this.errorMassage});
  

@override final  NewCardStatus status;
@override final  String errorMassage;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewCardStateCopyWith<_NewCardState> get copyWith => __$NewCardStateCopyWithImpl<_NewCardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewCardState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMassage, errorMassage) || other.errorMassage == errorMassage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMassage);

@override
String toString() {
  return 'NewCardState(status: $status, errorMassage: $errorMassage)';
}


}

/// @nodoc
abstract mixin class _$NewCardStateCopyWith<$Res> implements $NewCardStateCopyWith<$Res> {
  factory _$NewCardStateCopyWith(_NewCardState value, $Res Function(_NewCardState) _then) = __$NewCardStateCopyWithImpl;
@override @useResult
$Res call({
 NewCardStatus status, String errorMassage
});




}
/// @nodoc
class __$NewCardStateCopyWithImpl<$Res>
    implements _$NewCardStateCopyWith<$Res> {
  __$NewCardStateCopyWithImpl(this._self, this._then);

  final _NewCardState _self;
  final $Res Function(_NewCardState) _then;

/// Create a copy of NewCardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMassage = null,}) {
  return _then(_NewCardState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as NewCardStatus,errorMassage: null == errorMassage ? _self.errorMassage : errorMassage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
