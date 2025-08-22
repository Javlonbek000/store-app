// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyDetailModel {

 String get gender; String get fullName; String get email; String get phoneNumber; String get birthDate;
/// Create a copy of MyDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyDetailModelCopyWith<MyDetailModel> get copyWith => _$MyDetailModelCopyWithImpl<MyDetailModel>(this as MyDetailModel, _$identity);

  /// Serializes this MyDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyDetailModel&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,fullName,email,phoneNumber,birthDate);

@override
String toString() {
  return 'MyDetailModel(gender: $gender, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class $MyDetailModelCopyWith<$Res>  {
  factory $MyDetailModelCopyWith(MyDetailModel value, $Res Function(MyDetailModel) _then) = _$MyDetailModelCopyWithImpl;
@useResult
$Res call({
 String gender, String fullName, String email, String phoneNumber, String birthDate
});




}
/// @nodoc
class _$MyDetailModelCopyWithImpl<$Res>
    implements $MyDetailModelCopyWith<$Res> {
  _$MyDetailModelCopyWithImpl(this._self, this._then);

  final MyDetailModel _self;
  final $Res Function(MyDetailModel) _then;

/// Create a copy of MyDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gender = null,Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? birthDate = null,}) {
  return _then(_self.copyWith(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MyDetailModel].
extension MyDetailModelPatterns on MyDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MyDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MyDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String gender,  String fullName,  String email,  String phoneNumber,  String birthDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyDetailModel() when $default != null:
return $default(_that.gender,_that.fullName,_that.email,_that.phoneNumber,_that.birthDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String gender,  String fullName,  String email,  String phoneNumber,  String birthDate)  $default,) {final _that = this;
switch (_that) {
case _MyDetailModel():
return $default(_that.gender,_that.fullName,_that.email,_that.phoneNumber,_that.birthDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String gender,  String fullName,  String email,  String phoneNumber,  String birthDate)?  $default,) {final _that = this;
switch (_that) {
case _MyDetailModel() when $default != null:
return $default(_that.gender,_that.fullName,_that.email,_that.phoneNumber,_that.birthDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyDetailModel implements MyDetailModel {
  const _MyDetailModel({required this.gender, required this.fullName, required this.email, required this.phoneNumber, required this.birthDate});
  factory _MyDetailModel.fromJson(Map<String, dynamic> json) => _$MyDetailModelFromJson(json);

@override final  String gender;
@override final  String fullName;
@override final  String email;
@override final  String phoneNumber;
@override final  String birthDate;

/// Create a copy of MyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyDetailModelCopyWith<_MyDetailModel> get copyWith => __$MyDetailModelCopyWithImpl<_MyDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyDetailModel&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gender,fullName,email,phoneNumber,birthDate);

@override
String toString() {
  return 'MyDetailModel(gender: $gender, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, birthDate: $birthDate)';
}


}

/// @nodoc
abstract mixin class _$MyDetailModelCopyWith<$Res> implements $MyDetailModelCopyWith<$Res> {
  factory _$MyDetailModelCopyWith(_MyDetailModel value, $Res Function(_MyDetailModel) _then) = __$MyDetailModelCopyWithImpl;
@override @useResult
$Res call({
 String gender, String fullName, String email, String phoneNumber, String birthDate
});




}
/// @nodoc
class __$MyDetailModelCopyWithImpl<$Res>
    implements _$MyDetailModelCopyWith<$Res> {
  __$MyDetailModelCopyWithImpl(this._self, this._then);

  final _MyDetailModel _self;
  final $Res Function(_MyDetailModel) _then;

/// Create a copy of MyDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gender = null,Object? fullName = null,Object? email = null,Object? phoneNumber = null,Object? birthDate = null,}) {
  return _then(_MyDetailModel(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
