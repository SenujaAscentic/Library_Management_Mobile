import '../../../books/domain/usecases/get_book_by_id_usecase.dart';
import '../entities/borrowing_details.dart';
import 'get_my_borrowings_usecase.dart';

class GetMyBorrowingsWithDetailsUseCase {
  GetMyBorrowingsWithDetailsUseCase(this._getMyBorrowings, this._getBookById);
  final GetMyBorrowingsUseCase _getMyBorrowings;
  final GetBookByIdUseCase _getBookById;

  Future<List<BorrowingDetails>> call(String memberId) async {
    final borrowings = await _getMyBorrowings.call(memberId);

    return Future.wait(borrowings.map((borrowing) async {
      final book = await _getBookById.call(borrowing.bookId);
      return BorrowingDetails(
        borrowing: borrowing,
        bookTitle: book.title,
        bookAuthor: book.author,
      );
    }));
  }
}