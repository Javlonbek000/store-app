// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyDetailState {

 MyDetailStatus get status; String? get errorMessage;
/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyDetailStateCopyWith<MyDetailState> get copyWith => _$MyDetailStateCopyWithImpl<MyDetailState>(this as MyDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'MyDetailState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $MyDetailStateCopyWith<$Res>  {
  factory $MyDetailStateCopyWith(MyDetailState value, $Res Function(MyDetailState) _then) = _$MyDetailStateCopyWithImpl;
@useResult
$Res call({
 MyDetailStatus status, String? errorMessage
});




}
/// @nodoc
class _$MyDetailStateCopyWithImpl<$Res>
    implements $MyDetailStateCopyWith<$Res> {
  _$MyDetailStateCopyWithImpl(this._self, this._then);

  final MyDetailState _self;
  final $Res Function(MyDetailState) _then;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyDetailStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MyDetailState].
extension MyDetailStatePatterns on MyDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyDetailState value)  $default,){
final _that = this;
switch (_that) {
case _MyDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MyDetailStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MyDetailStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _MyDetailState():
return $default(_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MyDetailStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _MyDetailState() when $default != null:
return $default(_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _MyDetailState implements MyDetailState {
  const _MyDetailState({required this.status, required this.errorMessage});
  

@override final  MyDetailStatus status;
@override final  String? errorMessage;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyDetailStateCopyWith<_MyDetailState> get copyWith => __$MyDetailStateCopyWithImpl<_MyDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,errorMessage);

@override
String toString() {
  return 'MyDetailState(status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$MyDetailStateCopyWith<$Res> implements $MyDetailStateCopyWith<$Res> {
  factory _$MyDetailStateCopyWith(_MyDetailState value, $Res Function(_MyDetailState) _then) = __$MyDetailStateCopyWithImpl;
@override @useResult
$Res call({
 MyDetailStatus status, String? errorMessage
});




}
/// @nodoc
class __$MyDetailStateCopyWithImpl<$Res>
    implements _$MyDetailStateCopyWith<$Res> {
  __$MyDetailStateCopyWithImpl(this._self, this._then);

  final _MyDetailState _self;
  final $Res Function(_MyDetailState) _then;

/// Create a copy of MyDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_MyDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MyDetailStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
