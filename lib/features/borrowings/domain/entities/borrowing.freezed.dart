// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'borrowing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Borrowing {

 String get id; String get bookId; String get memberId; DateTime get borrowedDate; DateTime get dueDate; DateTime? get returnedDate; BorrowingStatus get status;
/// Create a copy of Borrowing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BorrowingCopyWith<Borrowing> get copyWith => _$BorrowingCopyWithImpl<Borrowing>(this as Borrowing, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Borrowing&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.borrowedDate, borrowedDate) || other.borrowedDate == borrowedDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.returnedDate, returnedDate) || other.returnedDate == returnedDate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,bookId,memberId,borrowedDate,dueDate,returnedDate,status);

@override
String toString() {
  return 'Borrowing(id: $id, bookId: $bookId, memberId: $memberId, borrowedDate: $borrowedDate, dueDate: $dueDate, returnedDate: $returnedDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $BorrowingCopyWith<$Res>  {
  factory $BorrowingCopyWith(Borrowing value, $Res Function(Borrowing) _then) = _$BorrowingCopyWithImpl;
@useResult
$Res call({
 String id, String bookId, String memberId, DateTime borrowedDate, DateTime dueDate, DateTime? returnedDate, BorrowingStatus status
});




}
/// @nodoc
class _$BorrowingCopyWithImpl<$Res>
    implements $BorrowingCopyWith<$Res> {
  _$BorrowingCopyWithImpl(this._self, this._then);

  final Borrowing _self;
  final $Res Function(Borrowing) _then;

/// Create a copy of Borrowing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bookId = null,Object? memberId = null,Object? borrowedDate = null,Object? dueDate = null,Object? returnedDate = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,borrowedDate: null == borrowedDate ? _self.borrowedDate : borrowedDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnedDate: freezed == returnedDate ? _self.returnedDate : returnedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BorrowingStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Borrowing].
extension BorrowingPatterns on Borrowing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Borrowing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Borrowing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Borrowing value)  $default,){
final _that = this;
switch (_that) {
case _Borrowing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Borrowing value)?  $default,){
final _that = this;
switch (_that) {
case _Borrowing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String bookId,  String memberId,  DateTime borrowedDate,  DateTime dueDate,  DateTime? returnedDate,  BorrowingStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Borrowing() when $default != null:
return $default(_that.id,_that.bookId,_that.memberId,_that.borrowedDate,_that.dueDate,_that.returnedDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String bookId,  String memberId,  DateTime borrowedDate,  DateTime dueDate,  DateTime? returnedDate,  BorrowingStatus status)  $default,) {final _that = this;
switch (_that) {
case _Borrowing():
return $default(_that.id,_that.bookId,_that.memberId,_that.borrowedDate,_that.dueDate,_that.returnedDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String bookId,  String memberId,  DateTime borrowedDate,  DateTime dueDate,  DateTime? returnedDate,  BorrowingStatus status)?  $default,) {final _that = this;
switch (_that) {
case _Borrowing() when $default != null:
return $default(_that.id,_that.bookId,_that.memberId,_that.borrowedDate,_that.dueDate,_that.returnedDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Borrowing extends Borrowing {
  const _Borrowing({required this.id, required this.bookId, required this.memberId, required this.borrowedDate, required this.dueDate, this.returnedDate, required this.status}): super._();
  

@override final  String id;
@override final  String bookId;
@override final  String memberId;
@override final  DateTime borrowedDate;
@override final  DateTime dueDate;
@override final  DateTime? returnedDate;
@override final  BorrowingStatus status;

/// Create a copy of Borrowing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BorrowingCopyWith<_Borrowing> get copyWith => __$BorrowingCopyWithImpl<_Borrowing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Borrowing&&(identical(other.id, id) || other.id == id)&&(identical(other.bookId, bookId) || other.bookId == bookId)&&(identical(other.memberId, memberId) || other.memberId == memberId)&&(identical(other.borrowedDate, borrowedDate) || other.borrowedDate == borrowedDate)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.returnedDate, returnedDate) || other.returnedDate == returnedDate)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,bookId,memberId,borrowedDate,dueDate,returnedDate,status);

@override
String toString() {
  return 'Borrowing(id: $id, bookId: $bookId, memberId: $memberId, borrowedDate: $borrowedDate, dueDate: $dueDate, returnedDate: $returnedDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BorrowingCopyWith<$Res> implements $BorrowingCopyWith<$Res> {
  factory _$BorrowingCopyWith(_Borrowing value, $Res Function(_Borrowing) _then) = __$BorrowingCopyWithImpl;
@override @useResult
$Res call({
 String id, String bookId, String memberId, DateTime borrowedDate, DateTime dueDate, DateTime? returnedDate, BorrowingStatus status
});




}
/// @nodoc
class __$BorrowingCopyWithImpl<$Res>
    implements _$BorrowingCopyWith<$Res> {
  __$BorrowingCopyWithImpl(this._self, this._then);

  final _Borrowing _self;
  final $Res Function(_Borrowing) _then;

/// Create a copy of Borrowing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bookId = null,Object? memberId = null,Object? borrowedDate = null,Object? dueDate = null,Object? returnedDate = freezed,Object? status = null,}) {
  return _then(_Borrowing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bookId: null == bookId ? _self.bookId : bookId // ignore: cast_nullable_to_non_nullable
as String,memberId: null == memberId ? _self.memberId : memberId // ignore: cast_nullable_to_non_nullable
as String,borrowedDate: null == borrowedDate ? _self.borrowedDate : borrowedDate // ignore: cast_nullable_to_non_nullable
as DateTime,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,returnedDate: freezed == returnedDate ? _self.returnedDate : returnedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BorrowingStatus,
  ));
}


}

// dart format on
