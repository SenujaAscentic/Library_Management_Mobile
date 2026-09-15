import 'package:library_management_app/shared/fakes/fake_data_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/providers/session_providers.dart';
import '../../../books/presentation/providers/books_providers.dart';
import '../../data/repositories/fake_borrowings_repository.dart';
import '../../domain/entities/borrowing_details.dart';
import '../../domain/repositories/borrowings_repository.dart';
import '../../domain/usecases/get_my_borrowings_usecase.dart';
import '../../domain/usecases/get_my_borrowings_with_details_usecase.dart';
import '../../domain/usecases/return_borrowing_usecase.dart';


part 'borrowings_providers.g.dart';

@riverpod
BorrowingsRepository borrowingsRepository(Ref ref) {
  return FakeBorrowingsRepository(ref.watch(fakeDataStoreProvider));
}

@riverpod
GetMyBorrowingsUseCase getMyBorrowingsUseCase(Ref ref) {
  return GetMyBorrowingsUseCase(ref.watch(borrowingsRepositoryProvider));
}

@riverpod
ReturnBorrowingUseCase returnBorrowingUseCase(Ref ref) {
  return ReturnBorrowingUseCase(ref.watch(borrowingsRepositoryProvider));
}

@riverpod
GetMyBorrowingsWithDetailsUseCase getMyBorrowingsWithDetailsUseCase(Ref ref) {
  return GetMyBorrowingsWithDetailsUseCase(
    ref.watch(getMyBorrowingsUseCaseProvider),
    ref.watch(getBookByIdUseCaseProvider),
  );
}

@Riverpod(keepAlive: true)
class MyBorrowings extends _$MyBorrowings {
  @override
  Future<List<BorrowingDetails>> build() async {
    final memberId = await ref.read(sessionRepositoryProvider).getCurrentMemberId();
    return ref.read(getMyBorrowingsWithDetailsUseCaseProvider).call(memberId);
  }

  Future<void> returnBorrowing(String borrowingId) async {
    final borrowing = await ref.read(returnBorrowingUseCaseProvider).call(borrowingId);
    ref.invalidateSelf();
    ref.invalidate(filteredBooksProvider);
    ref.invalidate(bookDetailsProvider(borrowing.bookId));
  }
}