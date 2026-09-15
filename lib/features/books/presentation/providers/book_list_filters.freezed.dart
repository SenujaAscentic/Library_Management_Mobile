// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_list_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookListFilters {

 String get searchQuery; String? get author; int? get publishedYear; BookAvailabilityFilter get availability;
/// Create a copy of BookListFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookListFiltersCopyWith<BookListFilters> get copyWith => _$BookListFiltersCopyWithImpl<BookListFilters>(this as BookListFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookListFilters&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.author, author) || other.author == author)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.availability, availability) || other.availability == availability));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,author,publishedYear,availability);

@override
String toString() {
  return 'BookListFilters(searchQuery: $searchQuery, author: $author, publishedYear: $publishedYear, availability: $availability)';
}


}

/// @nodoc
abstract mixin class $BookListFiltersCopyWith<$Res>  {
  factory $BookListFiltersCopyWith(BookListFilters value, $Res Function(BookListFilters) _then) = _$BookListFiltersCopyWithImpl;
@useResult
$Res call({
 String searchQuery, String? author, int? publishedYear, BookAvailabilityFilter availability
});




}
/// @nodoc
class _$BookListFiltersCopyWithImpl<$Res>
    implements $BookListFiltersCopyWith<$Res> {
  _$BookListFiltersCopyWithImpl(this._self, this._then);

  final BookListFilters _self;
  final $Res Function(BookListFilters) _then;

/// Create a copy of BookListFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? author = freezed,Object? publishedYear = freezed,Object? availability = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as BookAvailabilityFilter,
  ));
}

}


/// Adds pattern-matching-related methods to [BookListFilters].
extension BookListFiltersPatterns on BookListFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookListFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookListFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookListFilters value)  $default,){
final _that = this;
switch (_that) {
case _BookListFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookListFilters value)?  $default,){
final _that = this;
switch (_that) {
case _BookListFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  String? author,  int? publishedYear,  BookAvailabilityFilter availability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookListFilters() when $default != null:
return $default(_that.searchQuery,_that.author,_that.publishedYear,_that.availability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  String? author,  int? publishedYear,  BookAvailabilityFilter availability)  $default,) {final _that = this;
switch (_that) {
case _BookListFilters():
return $default(_that.searchQuery,_that.author,_that.publishedYear,_that.availability);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  String? author,  int? publishedYear,  BookAvailabilityFilter availability)?  $default,) {final _that = this;
switch (_that) {
case _BookListFilters() when $default != null:
return $default(_that.searchQuery,_that.author,_that.publishedYear,_that.availability);case _:
  return null;

}
}

}

/// @nodoc


class _BookListFilters extends BookListFilters {
  const _BookListFilters({this.searchQuery = '', this.author, this.publishedYear, this.availability = BookAvailabilityFilter.all}): super._();
  

@override@JsonKey() final  String searchQuery;
@override final  String? author;
@override final  int? publishedYear;
@override@JsonKey() final  BookAvailabilityFilter availability;

/// Create a copy of BookListFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookListFiltersCopyWith<_BookListFilters> get copyWith => __$BookListFiltersCopyWithImpl<_BookListFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookListFilters&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.author, author) || other.author == author)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.availability, availability) || other.availability == availability));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,author,publishedYear,availability);

@override
String toString() {
  return 'BookListFilters(searchQuery: $searchQuery, author: $author, publishedYear: $publishedYear, availability: $availability)';
}


}

/// @nodoc
abstract mixin class _$BookListFiltersCopyWith<$Res> implements $BookListFiltersCopyWith<$Res> {
  factory _$BookListFiltersCopyWith(_BookListFilters value, $Res Function(_BookListFilters) _then) = __$BookListFiltersCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, String? author, int? publishedYear, BookAvailabilityFilter availability
});




}
/// @nodoc
class __$BookListFiltersCopyWithImpl<$Res>
    implements _$BookListFiltersCopyWith<$Res> {
  __$BookListFiltersCopyWithImpl(this._self, this._then);

  final _BookListFilters _self;
  final $Res Function(_BookListFilters) _then;

/// Create a copy of BookListFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? author = freezed,Object? publishedYear = freezed,Object? availability = null,}) {
  return _then(_BookListFilters(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as BookAvailabilityFilter,
  ));
}


}

// dart format on
