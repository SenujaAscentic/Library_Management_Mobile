import 'package:freezed_annotation/freezed_annotation.dart';
import 'borrowing_status.dart';

part 'borrowing.freezed.dart';

@freezed
abstract class Borrowing with _$Borrowing {
  const factory Borrowing({
    required String id,
    required String bookId,
    required String memberId,
    required DateTime borrowedDate,
    required DateTime dueDate,
    DateTime? returnedDate,
    required BorrowingStatus status,
  }) = _Borrowing;

  const Borrowing._();

  bool get canReturn =>
      status == BorrowingStatus.borrowed || status == BorrowingStatus.overdue;
}