// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(booksRepository)
final booksRepositoryProvider = BooksRepositoryProvider._();

final class BooksRepositoryProvider
    extends
        $FunctionalProvider<BooksRepository, BooksRepository, BooksRepository>
    with $Provider<BooksRepository> {
  BooksRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'booksRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$booksRepositoryHash();

  @$internal
  @override
  $ProviderElement<BooksRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BooksRepository create(Ref ref) {
    return booksRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BooksRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BooksRepository>(value),
    );
  }
}

String _$booksRepositoryHash() => r'd5a6d3e29d3a674969cea68e82dae8b653a8dd25';

@ProviderFor(getBooksUseCase)
final getBooksUseCaseProvider = GetBooksUseCaseProvider._();

final class GetBooksUseCaseProvider
    extends
        $FunctionalProvider<GetBooksUseCase, GetBooksUseCase, GetBooksUseCase>
    with $Provider<GetBooksUseCase> {
  GetBooksUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBooksUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBooksUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBooksUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetBooksUseCase create(Ref ref) {
    return getBooksUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBooksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBooksUseCase>(value),
    );
  }
}

String _$getBooksUseCaseHash() => r'85d095b8a0bfb7f0f3c822436e4a89128609b0d8';

@ProviderFor(bookList)
final bookListProvider = BookListProvider._();

final class BookListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          FutureOr<List<Book>>
        >
    with $FutureModifier<List<Book>>, $FutureProvider<List<Book>> {
  BookListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookListHash();

  @$internal
  @override
  $FutureProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Book>> create(Ref ref) {
    return bookList(ref);
  }
}

String _$bookListHash() => r'650a2e213a1b742ec9e6cc1f934c83a448934568';
