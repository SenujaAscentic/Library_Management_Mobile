import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
abstract class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required String author,
    required String isbn,
    required int publishedYear,
    required int totalCopies,
    required int availableCopies,
    String? coverImageUrl,
  }) = _Book;

  const Book._();

  bool get isAvailable => availableCopies > 0;

}