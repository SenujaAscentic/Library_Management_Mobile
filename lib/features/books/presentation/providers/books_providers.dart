import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/fake_books_repository.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../../domain/usecases/get_books_usecase.dart';

part 'books_providers.g.dart';

@riverpod
BooksRepository booksRepository(Ref ref) {
  // Fake for now — swap to a real Dio-backed implementation later.
  return FakeBooksRepository();
}

@riverpod
GetBooksUseCase getBooksUseCase(Ref ref) {
  return GetBooksUseCase(ref.watch(booksRepositoryProvider));
}

@riverpod
Future<List<Book>> bookList(Ref ref) {
  return ref.watch(getBooksUseCaseProvider).call();
}