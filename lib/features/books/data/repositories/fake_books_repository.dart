import '../../../../shared/fakes/fake_data_store.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';

class FakeBooksRepository implements BooksRepository {
  FakeBooksRepository(this._store);
  final FakeDataStore _store;

  @override
  Future<List<Book>> getBooks({
    String? title,
    String? author,
    int? publishedYear,
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (_store.simulateNetworkError) {
      throw Exception('Simulated network failure');
    }
    var results = _store.books.where((b) {
      if (title != null && !b.title.toLowerCase().contains(title.toLowerCase())) return false;
      if (author != null && !b.author.toLowerCase().contains(author.toLowerCase())) return false;
      if (publishedYear != null && b.publishedYear != publishedYear) return false;
      return true;
    }).toList();

    final start = (pageNumber - 1) * pageSize;
    if (start >= results.length) return [];
    return results.skip(start).take(pageSize).toList();
  }

  @override
  Future<Book> getBookById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _store.books.firstWhere((b) => b.id == id,
        orElse: () => throw Exception('Book not found'));
  }
}