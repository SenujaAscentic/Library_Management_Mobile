// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'borrow_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BorrowFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BorrowFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BorrowFailure()';
}


}

/// @nodoc
class $BorrowFailureCopyWith<$Res>  {
$BorrowFailureCopyWith(BorrowFailure _, $Res Function(BorrowFailure) __);
}


/// Adds pattern-matching-related methods to [BorrowFailure].
extension BorrowFailurePatterns on BorrowFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LimitExceeded value)?  limitExceeded,TResult Function( _BookUnavailable value)?  bookUnavailable,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LimitExceeded() when limitExceeded != null:
return limitExceeded(_that);case _BookUnavailable() when bookUnavailable != null:
return bookUnavailable(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LimitExceeded value)  limitExceeded,required TResult Function( _BookUnavailable value)  bookUnavailable,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _LimitExceeded():
return limitExceeded(_that);case _BookUnavailable():
return bookUnavailable(_that);case _Unknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LimitExceeded value)?  limitExceeded,TResult? Function( _BookUnavailable value)?  bookUnavailable,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _LimitExceeded() when limitExceeded != null:
return limitExceeded(_that);case _BookUnavailable() when bookUnavailable != null:
return bookUnavailable(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  limitExceeded,TResult Function()?  bookUnavailable,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LimitExceeded() when limitExceeded != null:
return limitExceeded();case _BookUnavailable() when bookUnavailable != null:
return bookUnavailable();case _Unknown() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  limitExceeded,required TResult Function()  bookUnavailable,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _LimitExceeded():
return limitExceeded();case _BookUnavailable():
return bookUnavailable();case _Unknown():
return unknown(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  limitExceeded,TResult? Function()?  bookUnavailable,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _LimitExceeded() when limitExceeded != null:
return limitExceeded();case _BookUnavailable() when bookUnavailable != null:
return bookUnavailable();case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _LimitExceeded implements BorrowFailure {
  const _LimitExceeded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LimitExceeded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BorrowFailure.limitExceeded()';
}


}




/// @nodoc


class _BookUnavailable implements BorrowFailure {
  const _BookUnavailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BorrowFailure.bookUnavailable()';
}


}




/// @nodoc


class _Unknown implements BorrowFailure {
  const _Unknown(this.message);
  

 final  String message;

/// Create a copy of BorrowFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownCopyWith<_Unknown> get copyWith => __$UnknownCopyWithImpl<_Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BorrowFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $BorrowFailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) = __$UnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(this._self, this._then);

  final _Unknown _self;
  final $Res Function(_Unknown) _then;

/// Create a copy of BorrowFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
