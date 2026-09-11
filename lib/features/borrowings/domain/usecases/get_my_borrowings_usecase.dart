import '../entities/borrowing.dart';
import '../repositories/borrowings_repository.dart';

class GetMyBorrowingsUseCase {
  GetMyBorrowingsUseCase(this._repository);
  final BorrowingsRepository _repository;

  Future<List<Borrowing>> call(String memberId)=> _repository.getMyBorrowings(memberId);

}