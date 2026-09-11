import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../auth/presentation/providers/session_providers.dart';
import '../../../books/presentation/providers/books_providers.dart';
import '../../domain/usecases/borrow_book_usecase.dart';
import '../../domain/entities/borrowing.dart';
import 'borrowings_providers.dart';

part 'borrow_confirmation_providers.g.dart';

@riverpod
BorrowBookUseCase borrowBookUseCase(Ref ref) {
  return BorrowBookUseCase(
    ref.watch(borrowingsRepositoryProvider),
    ref.watch(getBookByIdUseCaseProvider),
    ref.watch(getMyBorrowingsUseCaseProvider),
  );
}

@riverpod
class BorrowConfirmation extends _$BorrowConfirmation {
  @override
  AsyncValue<Borrowing>? build() => null; // null = Default state, not yet attempted

  Future<void> confirm(String bookId) async {
    state = const AsyncLoading();
    final memberId = await ref.read(sessionRepositoryProvider).getCurrentMemberId();
    state = await AsyncValue.guard(
            () => ref.read(borrowBookUseCaseProvider).call(memberId: memberId, bookId: bookId));

    if (state?.hasValue == true) {
      // Refresh everything that depends on this data
      ref.invalidate(filteredBooksProvider);
      ref.invalidate(myBorrowingsProvider);
      ref.invalidate(bookDetailsProvider(bookId));
    }
  }

  void reset() => state = null;
}