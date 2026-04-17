// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitLogModel {

 int get id; String get habitId; String get logDate; bool get isCompleted;
/// Create a copy of HabitLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitLogModelCopyWith<HabitLogModel> get copyWith => _$HabitLogModelCopyWithImpl<HabitLogModel>(this as HabitLogModel, _$identity);

  /// Serializes this HabitLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,logDate,isCompleted);

@override
String toString() {
  return 'HabitLogModel(id: $id, habitId: $habitId, logDate: $logDate, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $HabitLogModelCopyWith<$Res>  {
  factory $HabitLogModelCopyWith(HabitLogModel value, $Res Function(HabitLogModel) _then) = _$HabitLogModelCopyWithImpl;
@useResult
$Res call({
 int id, String habitId, String logDate, bool isCompleted
});




}
/// @nodoc
class _$HabitLogModelCopyWithImpl<$Res>
    implements $HabitLogModelCopyWith<$Res> {
  _$HabitLogModelCopyWithImpl(this._self, this._then);

  final HabitLogModel _self;
  final $Res Function(HabitLogModel) _then;

/// Create a copy of HabitLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? logDate = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitLogModel].
extension HabitLogModelPatterns on HabitLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitLogModel value)  $default,){
final _that = this;
switch (_that) {
case _HabitLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _HabitLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String habitId,  String logDate,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitLogModel() when $default != null:
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String habitId,  String logDate,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _HabitLogModel():
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String habitId,  String logDate,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _HabitLogModel() when $default != null:
return $default(_that.id,_that.habitId,_that.logDate,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: .snake)
class _HabitLogModel implements HabitLogModel {
  const _HabitLogModel({required this.id, required this.habitId, required this.logDate, required this.isCompleted});
  factory _HabitLogModel.fromJson(Map<String, dynamic> json) => _$HabitLogModelFromJson(json);

@override final  int id;
@override final  String habitId;
@override final  String logDate;
@override final  bool isCompleted;

/// Create a copy of HabitLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitLogModelCopyWith<_HabitLogModel> get copyWith => __$HabitLogModelCopyWithImpl<_HabitLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,logDate,isCompleted);

@override
String toString() {
  return 'HabitLogModel(id: $id, habitId: $habitId, logDate: $logDate, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$HabitLogModelCopyWith<$Res> implements $HabitLogModelCopyWith<$Res> {
  factory _$HabitLogModelCopyWith(_HabitLogModel value, $Res Function(_HabitLogModel) _then) = __$HabitLogModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String habitId, String logDate, bool isCompleted
});




}
/// @nodoc
class __$HabitLogModelCopyWithImpl<$Res>
    implements _$HabitLogModelCopyWith<$Res> {
  __$HabitLogModelCopyWithImpl(this._self, this._then);

  final _HabitLogModel _self;
  final $Res Function(_HabitLogModel) _then;

/// Create a copy of HabitLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? logDate = null,Object? isCompleted = null,}) {
  return _then(_HabitLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
