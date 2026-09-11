// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'borrowing_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BorrowingDetails {

 Borrowing get borrowing; String get bookTitle; String get bookAuthor;
/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BorrowingDetailsCopyWith<BorrowingDetails> get copyWith => _$BorrowingDetailsCopyWithImpl<BorrowingDetails>(this as BorrowingDetails, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BorrowingDetails&&(identical(other.borrowing, borrowing) || other.borrowing == borrowing)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.bookAuthor, bookAuthor) || other.bookAuthor == bookAuthor));
}


@override
int get hashCode => Object.hash(runtimeType,borrowing,bookTitle,bookAuthor);

@override
String toString() {
  return 'BorrowingDetails(borrowing: $borrowing, bookTitle: $bookTitle, bookAuthor: $bookAuthor)';
}


}

/// @nodoc
abstract mixin class $BorrowingDetailsCopyWith<$Res>  {
  factory $BorrowingDetailsCopyWith(BorrowingDetails value, $Res Function(BorrowingDetails) _then) = _$BorrowingDetailsCopyWithImpl;
@useResult
$Res call({
 Borrowing borrowing, String bookTitle, String bookAuthor
});


$BorrowingCopyWith<$Res> get borrowing;

}
/// @nodoc
class _$BorrowingDetailsCopyWithImpl<$Res>
    implements $BorrowingDetailsCopyWith<$Res> {
  _$BorrowingDetailsCopyWithImpl(this._self, this._then);

  final BorrowingDetails _self;
  final $Res Function(BorrowingDetails) _then;

/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? borrowing = null,Object? bookTitle = null,Object? bookAuthor = null,}) {
  return _then(_self.copyWith(
borrowing: null == borrowing ? _self.borrowing : borrowing // ignore: cast_nullable_to_non_nullable
as Borrowing,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,bookAuthor: null == bookAuthor ? _self.bookAuthor : bookAuthor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BorrowingCopyWith<$Res> get borrowing {
  
  return $BorrowingCopyWith<$Res>(_self.borrowing, (value) {
    return _then(_self.copyWith(borrowing: value));
  });
}
}


/// Adds pattern-matching-related methods to [BorrowingDetails].
extension BorrowingDetailsPatterns on BorrowingDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BorrowingDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BorrowingDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BorrowingDetails value)  $default,){
final _that = this;
switch (_that) {
case _BorrowingDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BorrowingDetails value)?  $default,){
final _that = this;
switch (_that) {
case _BorrowingDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Borrowing borrowing,  String bookTitle,  String bookAuthor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BorrowingDetails() when $default != null:
return $default(_that.borrowing,_that.bookTitle,_that.bookAuthor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Borrowing borrowing,  String bookTitle,  String bookAuthor)  $default,) {final _that = this;
switch (_that) {
case _BorrowingDetails():
return $default(_that.borrowing,_that.bookTitle,_that.bookAuthor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Borrowing borrowing,  String bookTitle,  String bookAuthor)?  $default,) {final _that = this;
switch (_that) {
case _BorrowingDetails() when $default != null:
return $default(_that.borrowing,_that.bookTitle,_that.bookAuthor);case _:
  return null;

}
}

}

/// @nodoc


class _BorrowingDetails implements BorrowingDetails {
  const _BorrowingDetails({required this.borrowing, required this.bookTitle, required this.bookAuthor});
  

@override final  Borrowing borrowing;
@override final  String bookTitle;
@override final  String bookAuthor;

/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BorrowingDetailsCopyWith<_BorrowingDetails> get copyWith => __$BorrowingDetailsCopyWithImpl<_BorrowingDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BorrowingDetails&&(identical(other.borrowing, borrowing) || other.borrowing == borrowing)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.bookAuthor, bookAuthor) || other.bookAuthor == bookAuthor));
}


@override
int get hashCode => Object.hash(runtimeType,borrowing,bookTitle,bookAuthor);

@override
String toString() {
  return 'BorrowingDetails(borrowing: $borrowing, bookTitle: $bookTitle, bookAuthor: $bookAuthor)';
}


}

/// @nodoc
abstract mixin class _$BorrowingDetailsCopyWith<$Res> implements $BorrowingDetailsCopyWith<$Res> {
  factory _$BorrowingDetailsCopyWith(_BorrowingDetails value, $Res Function(_BorrowingDetails) _then) = __$BorrowingDetailsCopyWithImpl;
@override @useResult
$Res call({
 Borrowing borrowing, String bookTitle, String bookAuthor
});


@override $BorrowingCopyWith<$Res> get borrowing;

}
/// @nodoc
class __$BorrowingDetailsCopyWithImpl<$Res>
    implements _$BorrowingDetailsCopyWith<$Res> {
  __$BorrowingDetailsCopyWithImpl(this._self, this._then);

  final _BorrowingDetails _self;
  final $Res Function(_BorrowingDetails) _then;

/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? borrowing = null,Object? bookTitle = null,Object? bookAuthor = null,}) {
  return _then(_BorrowingDetails(
borrowing: null == borrowing ? _self.borrowing : borrowing // ignore: cast_nullable_to_non_nullable
as Borrowing,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,bookAuthor: null == bookAuthor ? _self.bookAuthor : bookAuthor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BorrowingDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BorrowingCopyWith<$Res> get borrowing {
  
  return $BorrowingCopyWith<$Res>(_self.borrowing, (value) {
    return _then(_self.copyWith(borrowing: value));
  });
}
}

// dart format on
