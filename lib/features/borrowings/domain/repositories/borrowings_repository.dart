import '../entities/borrowing.dart';

abstract class BorrowingsRepository {
  Future<List<Borrowing>> getMyBorrowings(String memberId);
  Future<Borrowing> returnBorrowing(String borrowingId);
  Future<Borrowing> createBorrowing({required String memberId, required String bookId});
}