import '../entities/borrowing.dart';
import '../repositories/borrowings_repository.dart';

class ReturnBorrowingUseCase {
  ReturnBorrowingUseCase(this._repository);
  final BorrowingsRepository _repository;

  Future<Borrowing> call(String borrowingId)=> _repository.returnBorrowing(borrowingId);
}