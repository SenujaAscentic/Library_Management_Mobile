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
        isAutoDispose: false,
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

String _$booksRepositoryHash() => r'f60685e681971256f55c2e6e0a46ca591a931dd3';

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

@ProviderFor(getBookByIdUseCase)
final getBookByIdUseCaseProvider = GetBookByIdUseCaseProvider._();

final class GetBookByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetBookByIdUseCase,
          GetBookByIdUseCase,
          GetBookByIdUseCase
        >
    with $Provider<GetBookByIdUseCase> {
  GetBookByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBookByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBookByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBookByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBookByIdUseCase create(Ref ref) {
    return getBookByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBookByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBookByIdUseCase>(value),
    );
  }
}

String _$getBookByIdUseCaseHash() =>
    r'29821b150e6fa655949d08655a6e4048b627cadb';

@ProviderFor(bookDetails)
final bookDetailsProvider = BookDetailsFamily._();

final class BookDetailsProvider
    extends $FunctionalProvider<AsyncValue<Book>, Book, FutureOr<Book>>
    with $FutureModifier<Book>, $FutureProvider<Book> {
  BookDetailsProvider._({
    required BookDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bookDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bookDetailsHash();

  @override
  String toString() {
    return r'bookDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Book> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Book> create(Ref ref) {
    final argument = this.argument as String;
    return bookDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BookDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bookDetailsHash() => r'fcc9c68383cb5b1b033d4b9b30c1df7931d791c9';

final class BookDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Book>, String> {
  BookDetailsFamily._()
    : super(
        retry: null,
        name: r'bookDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BookDetailsProvider call(String id) =>
      BookDetailsProvider._(argument: id, from: this);

  @override
  String toString() => r'bookDetailsProvider';
}

@ProviderFor(BookFilters)
final bookFiltersProvider = BookFiltersProvider._();

final class BookFiltersProvider
    extends $NotifierProvider<BookFilters, BookListFilters> {
  BookFiltersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookFiltersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookFiltersHash();

  @$internal
  @override
  BookFilters create() => BookFilters();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BookListFilters value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BookListFilters>(value),
    );
  }
}

String _$bookFiltersHash() => r'c1759416982c824ed3053375f11a8358bf5406e9';

abstract class _$BookFilters extends $Notifier<BookListFilters> {
  BookListFilters build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BookListFilters, BookListFilters>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BookListFilters, BookListFilters>,
              BookListFilters,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredBooks)
final filteredBooksProvider = FilteredBooksProvider._();

final class FilteredBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Book>>,
          List<Book>,
          FutureOr<List<Book>>
        >
    with $FutureModifier<List<Book>>, $FutureProvider<List<Book>> {
  FilteredBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredBooksHash();

  @$internal
  @override
  $FutureProviderElement<List<Book>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Book>> create(Ref ref) {
    return filteredBooks(ref);
  }
}

String _$filteredBooksHash() => r'b469cabbae5b1804a2dbd43e55b4d7d78ac71e6f';
