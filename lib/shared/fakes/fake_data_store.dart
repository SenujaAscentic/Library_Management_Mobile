import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/books/domain/entities/book.dart';
import '../../features/borrowings/domain/entities/borrowing.dart';
import '../../features/borrowings/domain/entities/borrowing_status.dart';
import '../../features/profile/domain/entities/member.dart';


part 'fake_data_store.g.dart';

/// Single shared in-memory store so the fake Books and Borrowings
/// repositories see the same mutable data — specifically so borrowing
/// a book actually decrements its available copies, matching what the
/// real backend does server-side in one atomic operation. This has no
/// equivalent in the real Dio-backed repositories; it's purely a
/// fake-data wiring concern.
class FakeDataStore {
  final List<Book> books = [
    const Book(id: '1', title: 'Clean Code', author: 'Robert C. Martin',
        isbn: '9780132350884', publishedYear: 2008, totalCopies: 5, availableCopies: 3),
    const Book(id: '2', title: 'The Pragmatic Programmer', author: 'David Thomas',
        isbn: '9780135957059', publishedYear: 2019, totalCopies: 4, availableCopies: 0),
    const Book(id: '3', title: 'Design Patterns', author: 'Erich Gamma',
        isbn: '9780201633610', publishedYear: 1994, totalCopies: 2, availableCopies: 2),
  ];

  final List<Borrowing> borrowings = [
    Borrowing(
      id: 'b1', bookId: '1', memberId: 'member-1',
      borrowedDate: DateTime.now().subtract(const Duration(days: 5)),
      dueDate: DateTime.now().add(const Duration(days: 9)),
      status: BorrowingStatus.borrowed,
    ),
    Borrowing(
      id: 'b2', bookId: '3', memberId: 'member-1',
      borrowedDate: DateTime.now().subtract(const Duration(days: 20)),
      dueDate: DateTime.now().subtract(const Duration(days: 6)),
      status: BorrowingStatus.overdue,
    ),
    Borrowing(
      id: 'b3', bookId: '2', memberId: 'member-1',
      borrowedDate: DateTime.now().subtract(const Duration(days: 30)),
      dueDate: DateTime.now().subtract(const Duration(days: 16)),
      returnedDate: DateTime.now().subtract(const Duration(days: 18)),
      status: BorrowingStatus.returned,
    ),
  ];
  final List<Member> members = [
    Member(
      id: 'member-1',
      fullName: 'Alex Morgan',
      email: 'alex.morgan@example.com',
      phoneNumber: '+1 555-0134',
      registeredDate: DateTime(2024, 3, 12),
      isActive: true,
    ),
  ];

  void updateMember(String memberId, {required String fullName, required String phoneNumber}) {
    final index = members.indexWhere((m) => m.id == memberId);
    if (index != -1) {
      members[index] = members[index].copyWith(fullName: fullName, phoneNumber: phoneNumber);
    }
  }

  void decrementAvailableCopies(String bookId) {
    final index = books.indexWhere((b) => b.id == bookId);
    if (index != -1) {
      books[index] = books[index].copyWith(availableCopies: books[index].availableCopies - 1);
    }
  }
}

@Riverpod(keepAlive: true)
FakeDataStore fakeDataStore(Ref ref) => FakeDataStore();