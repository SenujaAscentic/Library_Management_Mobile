

import 'package:library_management_app/features/books/domain/usecases/get_book_by_id_usecase.dart';
import 'package:library_management_app/shared/fakes/fake_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/fake_books_repository.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../../domain/usecases/get_books_usecase.dart';

part 'books_providers.g.dart';

@Riverpod(keepAlive: true)
BooksRepository booksRepository(Ref ref) {
  // Fake for now — swap to a real Dio-backed implementation later.
  return FakeBooksRepository(ref.watch(fakeDataStoreProvider));
}

@riverpod
GetBooksUseCase getBooksUseCase(Ref ref) {
  return GetBooksUseCase(ref.watch(booksRepositoryProvider));
}


@riverpod
Future<List<Book>> bookList(Ref ref) {
  return ref.watch(getBooksUseCaseProvider).call();
}

@riverpod
GetBookByIdUseCase getBookByIdUseCase(Ref ref){
  return GetBookByIdUseCase(ref.watch(booksRepositoryProvider));
}

@riverpod
Future<Book> bookDetails(Ref ref , String id){
  return ref.watch(getBookByIdUseCaseProvider).call(id);
}