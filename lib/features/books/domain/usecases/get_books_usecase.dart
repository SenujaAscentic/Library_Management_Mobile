import '../entities/book.dart';
import '../repositories/books_repository.dart';

class GetBooksUseCase {
  GetBooksUseCase(this._repository);
  final BooksRepository _repository;

  Future<List<Book>> call({
    String? title,
    int pageNumber = 1,
    int pageSize = 20
  }) {
    return _repository.getBooks(
        title: title,
        pageNumber: pageNumber,
        pageSize: pageSize
    );
  }
}