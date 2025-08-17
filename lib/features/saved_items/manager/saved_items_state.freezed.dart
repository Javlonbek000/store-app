// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedItemsState {

 List<ProductModel> get savedItems; SavedItemsStatus get status; String? get errorMessage;
/// Create a copy of SavedItemsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedItemsStateCopyWith<SavedItemsState> get copyWith => _$SavedItemsStateCopyWithImpl<SavedItemsState>(this as SavedItemsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedItemsState&&const DeepCollectionEquality().equals(other.savedItems, savedItems)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(savedItems),status,errorMessage);

@override
String toString() {
  return 'SavedItemsState(savedItems: $savedItems, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SavedItemsStateCopyWith<$Res>  {
  factory $SavedItemsStateCopyWith(SavedItemsState value, $Res Function(SavedItemsState) _then) = _$SavedItemsStateCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> savedItems, SavedItemsStatus status, String? errorMessage
});




}
/// @nodoc
class _$SavedItemsStateCopyWithImpl<$Res>
    implements $SavedItemsStateCopyWith<$Res> {
  _$SavedItemsStateCopyWithImpl(this._self, this._then);

  final SavedItemsState _self;
  final $Res Function(SavedItemsState) _then;

/// Create a copy of SavedItemsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? savedItems = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
savedItems: null == savedItems ? _self.savedItems : savedItems // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SavedItemsStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedItemsState].
extension SavedItemsStatePatterns on SavedItemsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedItemsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedItemsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedItemsState value)  $default,){
final _that = this;
switch (_that) {
case _SavedItemsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedItemsState value)?  $default,){
final _that = this;
switch (_that) {
case _SavedItemsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductModel> savedItems,  SavedItemsStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedItemsState() when $default != null:
return $default(_that.savedItems,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductModel> savedItems,  SavedItemsStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SavedItemsState():
return $default(_that.savedItems,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductModel> savedItems,  SavedItemsStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SavedItemsState() when $default != null:
return $default(_that.savedItems,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SavedItemsState implements SavedItemsState {
  const _SavedItemsState({required final  List<ProductModel> savedItems, required this.status, required this.errorMessage}): _savedItems = savedItems;
  

 final  List<ProductModel> _savedItems;
@override List<ProductModel> get savedItems {
  if (_savedItems is EqualUnmodifiableListView) return _savedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedItems);
}

@override final  SavedItemsStatus status;
@override final  String? errorMessage;

/// Create a copy of SavedItemsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedItemsStateCopyWith<_SavedItemsState> get copyWith => __$SavedItemsStateCopyWithImpl<_SavedItemsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedItemsState&&const DeepCollectionEquality().equals(other._savedItems, _savedItems)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_savedItems),status,errorMessage);

@override
String toString() {
  return 'SavedItemsState(savedItems: $savedItems, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SavedItemsStateCopyWith<$Res> implements $SavedItemsStateCopyWith<$Res> {
  factory _$SavedItemsStateCopyWith(_SavedItemsState value, $Res Function(_SavedItemsState) _then) = __$SavedItemsStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductModel> savedItems, SavedItemsStatus status, String? errorMessage
});




}
/// @nodoc
class __$SavedItemsStateCopyWithImpl<$Res>
    implements _$SavedItemsStateCopyWith<$Res> {
  __$SavedItemsStateCopyWithImpl(this._self, this._then);

  final _SavedItemsState _self;
  final $Res Function(_SavedItemsState) _then;

/// Create a copy of SavedItemsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? savedItems = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_SavedItemsState(
savedItems: null == savedItems ? _self._savedItems : savedItems // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SavedItemsStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
