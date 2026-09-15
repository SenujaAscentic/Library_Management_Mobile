import '../../../../shared/fakes/fake_data_store.dart';
import '../../domain/entities/borrowing.dart';
import '../../domain/entities/borrowing_status.dart';
import '../../domain/repositories/borrowings_repository.dart';

class FakeBorrowingsRepository implements BorrowingsRepository {
  FakeBorrowingsRepository(this._store);
  final FakeDataStore _store;

  @override
  Future<List<Borrowing>> getMyBorrowings(String memberId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _store.borrowings.where((b) => b.memberId == memberId).toList();
  }

  @override
  Future<Borrowing> returnBorrowing(String borrowingId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _store.borrowings.indexWhere((b) => b.id == borrowingId);
    if (index == -1) throw Exception('Borrowing not found');
    final updated = _store.borrowings[index].copyWith(
      status: BorrowingStatus.returned,
      returnedDate: DateTime.now(),
    );
    _store.borrowings[index] = updated;
    _store.incrementAvailableCopies(updated.bookId);
    return updated;
  }

  @override
  Future<Borrowing> createBorrowing({required String memberId, required String bookId}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final borrowing = Borrowing(
      id: 'b${_store.borrowings.length + 1}',
      bookId: bookId,
      memberId: memberId,
      borrowedDate: DateTime.now(),
      dueDate: DateTime.now().add(const Duration(days: 14)),
      status: BorrowingStatus.borrowed,
    );
    _store.borrowings.add(borrowing);
    _store.decrementAvailableCopies(bookId);
    return borrowing;
  }
}