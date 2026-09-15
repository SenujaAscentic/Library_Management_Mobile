import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow_failure.freezed.dart';

@freezed
sealed class BorrowFailure with _$BorrowFailure {
  const factory BorrowFailure.limitExceeded() = _LimitExceeded;
  const factory BorrowFailure.bookUnavailable() = _BookUnavailable;
  const factory BorrowFailure.unknown(String message) = _Unknown;
}

class BorrowException implements Exception {
  BorrowException(this.failure);
  final BorrowFailure failure;
}