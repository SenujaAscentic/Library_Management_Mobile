// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(borrowingsRepository)
final borrowingsRepositoryProvider = BorrowingsRepositoryProvider._();

final class BorrowingsRepositoryProvider
    extends
        $FunctionalProvider<
          BorrowingsRepository,
          BorrowingsRepository,
          BorrowingsRepository
        >
    with $Provider<BorrowingsRepository> {
  BorrowingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'borrowingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$borrowingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<BorrowingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BorrowingsRepository create(Ref ref) {
    return borrowingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BorrowingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BorrowingsRepository>(value),
    );
  }
}

String _$borrowingsRepositoryHash() =>
    r'28f68f7729c52fe5ade6b4ffd06dcf48e28102c5';

@ProviderFor(getMyBorrowingsUseCase)
final getMyBorrowingsUseCaseProvider = GetMyBorrowingsUseCaseProvider._();

final class GetMyBorrowingsUseCaseProvider
    extends
        $FunctionalProvider<
          GetMyBorrowingsUseCase,
          GetMyBorrowingsUseCase,
          GetMyBorrowingsUseCase
        >
    with $Provider<GetMyBorrowingsUseCase> {
  GetMyBorrowingsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMyBorrowingsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMyBorrowingsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMyBorrowingsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMyBorrowingsUseCase create(Ref ref) {
    return getMyBorrowingsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMyBorrowingsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMyBorrowingsUseCase>(value),
    );
  }
}

String _$getMyBorrowingsUseCaseHash() =>
    r'b567ac897b75ade74ba3dd215ce6a721ffff1082';

@ProviderFor(returnBorrowingUseCase)
final returnBorrowingUseCaseProvider = ReturnBorrowingUseCaseProvider._();

final class ReturnBorrowingUseCaseProvider
    extends
        $FunctionalProvider<
          ReturnBorrowingUseCase,
          ReturnBorrowingUseCase,
          ReturnBorrowingUseCase
        >
    with $Provider<ReturnBorrowingUseCase> {
  ReturnBorrowingUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'returnBorrowingUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$returnBorrowingUseCaseHash();

  @$internal
  @override
  $ProviderElement<ReturnBorrowingUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReturnBorrowingUseCase create(Ref ref) {
    return returnBorrowingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReturnBorrowingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReturnBorrowingUseCase>(value),
    );
  }
}

String _$returnBorrowingUseCaseHash() =>
    r'662f65d73f9c3db5f9eb32a06e0c930a00815b01';

@ProviderFor(getMyBorrowingsWithDetailsUseCase)
final getMyBorrowingsWithDetailsUseCaseProvider =
    GetMyBorrowingsWithDetailsUseCaseProvider._();

final class GetMyBorrowingsWithDetailsUseCaseProvider
    extends
        $FunctionalProvider<
          GetMyBorrowingsWithDetailsUseCase,
          GetMyBorrowingsWithDetailsUseCase,
          GetMyBorrowingsWithDetailsUseCase
        >
    with $Provider<GetMyBorrowingsWithDetailsUseCase> {
  GetMyBorrowingsWithDetailsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMyBorrowingsWithDetailsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$getMyBorrowingsWithDetailsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMyBorrowingsWithDetailsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMyBorrowingsWithDetailsUseCase create(Ref ref) {
    return getMyBorrowingsWithDetailsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMyBorrowingsWithDetailsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMyBorrowingsWithDetailsUseCase>(
        value,
      ),
    );
  }
}

String _$getMyBorrowingsWithDetailsUseCaseHash() =>
    r'e7c0fa96b6d3693497171f449979609b4fd33f67';

@ProviderFor(MyBorrowings)
final myBorrowingsProvider = MyBorrowingsProvider._();

final class MyBorrowingsProvider
    extends $AsyncNotifierProvider<MyBorrowings, List<BorrowingDetails>> {
  MyBorrowingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myBorrowingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myBorrowingsHash();

  @$internal
  @override
  MyBorrowings create() => MyBorrowings();
}

String _$myBorrowingsHash() => r'ad7dfa8e917918b38d566caa7328ebb365238e56';

abstract class _$MyBorrowings extends $AsyncNotifier<List<BorrowingDetails>> {
  FutureOr<List<BorrowingDetails>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<BorrowingDetails>>, List<BorrowingDetails>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<BorrowingDetails>>,
                List<BorrowingDetails>
              >,
              AsyncValue<List<BorrowingDetails>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
