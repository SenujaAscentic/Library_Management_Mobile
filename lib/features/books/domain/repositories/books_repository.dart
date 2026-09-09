import '../entities/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getBooks({
    String? title,
    int pageNumber = 1,
    int pageSize = 20,
  });

  Future<Book> getBookById(String id);
}