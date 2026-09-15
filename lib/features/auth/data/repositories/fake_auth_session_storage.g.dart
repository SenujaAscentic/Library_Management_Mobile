// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_auth_session_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fakeAuthSessionStorage)
final fakeAuthSessionStorageProvider = FakeAuthSessionStorageProvider._();

final class FakeAuthSessionStorageProvider
    extends
        $FunctionalProvider<
          FakeAuthSessionStorage,
          FakeAuthSessionStorage,
          FakeAuthSessionStorage
        >
    with $Provider<FakeAuthSessionStorage> {
  FakeAuthSessionStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeAuthSessionStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeAuthSessionStorageHash();

  @$internal
  @override
  $ProviderElement<FakeAuthSessionStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FakeAuthSessionStorage create(Ref ref) {
    return fakeAuthSessionStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakeAuthSessionStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakeAuthSessionStorage>(value),
    );
  }
}

String _$fakeAuthSessionStorageHash() =>
    r'f5242877f9a04c568896e596a0674a48c9d0cbf9';
