// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_data_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fakeDataStore)
final fakeDataStoreProvider = FakeDataStoreProvider._();

final class FakeDataStoreProvider
    extends $FunctionalProvider<FakeDataStore, FakeDataStore, FakeDataStore>
    with $Provider<FakeDataStore> {
  FakeDataStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeDataStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeDataStoreHash();

  @$internal
  @override
  $ProviderElement<FakeDataStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FakeDataStore create(Ref ref) {
    return fakeDataStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakeDataStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakeDataStore>(value),
    );
  }
}

String _$fakeDataStoreHash() => r'3b2938997664c174d131bd930310331526755970';
