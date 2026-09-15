import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_auth_session_storage.g.dart';

const _onboardingSeenKey = 'fake_has_seen_onboarding';

class FakeAuthSessionStorage {
  final _storage = const FlutterSecureStorage();

  Future<bool> hasSeenOnboarding() async =>
      (await _storage.read(key: _onboardingSeenKey)) == 'true';
  Future<void> markOnboardingSeen() => _storage.write(key: _onboardingSeenKey, value: 'true');
}

@Riverpod(keepAlive: true)
FakeAuthSessionStorage fakeAuthSessionStorage(Ref ref) => FakeAuthSessionStorage();