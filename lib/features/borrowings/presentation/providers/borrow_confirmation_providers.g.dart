// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_confirmation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(borrowBookUseCase)
final borrowBookUseCaseProvider = BorrowBookUseCaseProvider._();

final class BorrowBookUseCaseProvider
    extends
        $FunctionalProvider<
          BorrowBookUseCase,
          BorrowBookUseCase,
          BorrowBookUseCase
        >
    with $Provider<BorrowBookUseCase> {
  BorrowBookUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'borrowBookUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$borrowBookUseCaseHash();

  @$internal
  @override
  $ProviderElement<BorrowBookUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BorrowBookUseCase create(Ref ref) {
    return borrowBookUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BorrowBookUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BorrowBookUseCase>(value),
    );
  }
}

String _$borrowBookUseCaseHash() => r'8520530de9bbc515c19ae0ecfa4990548b504f02';

@ProviderFor(BorrowConfirmation)
final borrowConfirmationProvider = BorrowConfirmationProvider._();

final class BorrowConfirmationProvider
    extends $NotifierProvider<BorrowConfirmation, AsyncValue<Borrowing>?> {
  BorrowConfirmationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'borrowConfirmationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$borrowConfirmationHash();

  @$internal
  @override
  BorrowConfirmation create() => BorrowConfirmation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Borrowing>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Borrowing>?>(value),
    );
  }
}

String _$borrowConfirmationHash() =>
    r'c5aec4695bd3da185d16cea614db5306a5137913';

abstract class _$BorrowConfirmation extends $Notifier<AsyncValue<Borrowing>?> {
  AsyncValue<Borrowing>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<Borrowing>?, AsyncValue<Borrowing>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Borrowing>?, AsyncValue<Borrowing>?>,
              AsyncValue<Borrowing>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
