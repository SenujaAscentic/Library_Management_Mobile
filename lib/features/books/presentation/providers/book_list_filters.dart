import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_list_filters.freezed.dart';

enum BookAvailabilityFilter { all, availableOnly, unavailableOnly }

@freezed
abstract class BookListFilters with _$BookListFilters {
  const factory BookListFilters({
    @Default('') String searchQuery,
    String? author,
    int? publishedYear,
    @Default(BookAvailabilityFilter.all) BookAvailabilityFilter availability,
  }) = _BookListFilters;

  const BookListFilters._();

  bool get hasActiveFilters =>
      author != null || publishedYear != null || availability != BookAvailabilityFilter.all;
}