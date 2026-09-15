import '../entities/book.dart';
import '../repositories/books_repository.dart';

class GetBookByIdUseCase {
  GetBookByIdUseCase(this._repository);
  final BooksRepository _repository;

  Future<Book> call(String id) => _repository.getBookById(id);
}