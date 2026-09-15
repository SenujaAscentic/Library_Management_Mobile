import '../../../books/domain/usecases/get_book_by_id_usecase.dart';
import '../entities/borrow_failure.dart';
import '../entities/borrowing.dart';
import '../entities/borrowing_status.dart';
import '../repositories/borrowings_repository.dart';
import 'get_my_borrowings_usecase.dart';
import 'package:flutter/foundation.dart';

class BorrowBookUseCase {
  BorrowBookUseCase(this._repository, this._getBookById, this._getMyBorrowings);
  final BorrowingsRepository _repository;
  final GetBookByIdUseCase _getBookById;
  final GetMyBorrowingsUseCase _getMyBorrowings;

  static const _borrowingLimit = 3; // matches README.md's business rule

  Future<Borrowing> call({required String memberId, required String bookId}) async {
    final book = await _getBookById.call(bookId);
    if (!book.isAvailable) {
      throw BorrowException(const BorrowFailure.bookUnavailable());
    }

    final existing = await _getMyBorrowings.call(memberId);
    debugPrint('[BorrowLimit] Found ${existing.length} total borrowings for $memberId:');
    for (final b in existing) {
      debugPrint('[BorrowLimit]   id=${b.id} bookId=${b.bookId} status=${b.status}');
    }

    final activeCount = existing
        .where((b) => b.status == BorrowingStatus.borrowed || b.status == BorrowingStatus.overdue)
        .length;
    debugPrint('[BorrowLimit] activeCount=$activeCount (limit=$_borrowingLimit)');

    if (activeCount >= _borrowingLimit) {
      throw BorrowException(const BorrowFailure.limitExceeded());
    }

    try {
      return await _repository.createBorrowing(memberId: memberId, bookId: bookId);
    } catch (e) {
      throw BorrowException(BorrowFailure.unknown(e.toString()));
    }
  }
}