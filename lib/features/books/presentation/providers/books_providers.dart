import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/fake_books_repository.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../../domain/usecases/get_books_usecase.dart';
import '../../domain/usecases/get_book_by_id_usecase.dart';
import '../../../../shared/fakes/fake_data_store.dart';
import 'book_list_filters.dart';

part 'books_providers.g.dart';

@Riverpod(keepAlive: true)
BooksRepository booksRepository(Ref ref) {
  return FakeBooksRepository(ref.watch(fakeDataStoreProvider));
}

@riverpod
GetBooksUseCase getBooksUseCase(Ref ref) {
  return GetBooksUseCase(ref.watch(booksRepositoryProvider));
}

@riverpod
GetBookByIdUseCase getBookByIdUseCase(Ref ref) {
  return GetBookByIdUseCase(ref.watch(booksRepositoryProvider));
}

@riverpod
Future<Book> bookDetails(Ref ref, String id) {
  return ref.watch(getBookByIdUseCaseProvider).call(id);
}

@riverpod
class BookFilters extends _$BookFilters {
  @override
  BookListFilters build() => const BookListFilters();

  void setSearchQuery(String value) => state = state.copyWith(searchQuery: value);
  void setAuthor(String? value) => state = state.copyWith(author: value);
  void setPublishedYear(int? value) => state = state.copyWith(publishedYear: value);
  void setAvailability(BookAvailabilityFilter value) =>
      state = state.copyWith(availability: value);
  void clearFilters() => state = const BookListFilters();
}

@riverpod
Future<List<Book>> filteredBooks(Ref ref) async {
  final filters = ref.watch(bookFiltersProvider);
  final all = await ref.watch(getBooksUseCaseProvider).call(pageSize: 100);

  return all.where((book) {
    if (filters.searchQuery.isNotEmpty) {
      final q = filters.searchQuery.toLowerCase();
      final matches =
          book.title.toLowerCase().contains(q) || book.author.toLowerCase().contains(q);
      if (!matches) return false;
    }
    if (filters.author != null &&
        filters.author!.isNotEmpty &&
        !book.author.toLowerCase().contains(filters.author!.toLowerCase())) {
      return false;
    }
    if (filters.publishedYear != null && book.publishedYear != filters.publishedYear) {
      return false;
    }
    if (filters.availability == BookAvailabilityFilter.availableOnly && !book.isAvailable) {
      return false;
    }
    if (filters.availability == BookAvailabilityFilter.unavailableOnly && book.isAvailable) {
      return false;
    }
    return true;
  }).toList();
}