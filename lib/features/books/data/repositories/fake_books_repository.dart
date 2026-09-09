import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';

class FakeBooksRepository implements BooksRepository {
  final _books = [
    const Book(id: '1', title: 'Clean Code', author: 'Robert C. Martin',
        isbn: '9780132350884', publishedYear: 2008, totalCopies: 5, availableCopies: 3),
    const Book(id: '2', title: 'The Pragmatic Programmer', author: 'David Thomas',
        isbn: '9780135957059', publishedYear: 2019, totalCopies: 4, availableCopies: 0),
    const Book(id: '3', title: 'Design Patterns', author: 'Erich Gamma',
        isbn: '9780201633610', publishedYear: 1994, totalCopies: 2, availableCopies: 2),
  ];

  @override
  Future<List<Book>> getBooks({String? title, int pageNumber = 1, int pageSize = 20}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _books.where((b) =>
    title == null || b.title.toLowerCase().contains(title.toLowerCase())).toList();
  }

  @override
  Future<Book> getBookById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _books.firstWhere((b) => b.id == id);
  }
}