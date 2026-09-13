import 'package:freezed_annotation/freezed_annotation.dart';
import 'borrowing.dart';

part 'borrowing_details.freezed.dart';

/// Combines a Borrowing with its book's title/author — the real API's
/// BorrowingResponse has no book details on it (flagged gap), so this
/// is assembled by a use case joining Borrowings + Books, not returned
/// by any single endpoint.
@freezed
abstract class BorrowingDetails with _$BorrowingDetails {
  const factory BorrowingDetails({
    required Borrowing borrowing,
    required String bookTitle,
    required String bookAuthor,
    String? bookCoverUrl,
  }) = _BorrowingDetails;
}