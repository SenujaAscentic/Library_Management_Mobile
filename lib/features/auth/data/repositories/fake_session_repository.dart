import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/token_refresh_service.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domain/repositories/session_repository.dart';
import 'fake_auth_session_storage.dart';

class FakeSessionRepository implements SessionRepository {
  FakeSessionRepository(this._ref, this._onboardingStorage);
  final Ref _ref;
  final FakeAuthSessionStorage _onboardingStorage;

  @override
  Future<bool> isLoggedIn() async {
    try {
      await _ref.read(tokenRefreshServiceProvider).ensureFreshToken();
    } catch (_) {
      return false;
    }
    final session = await _ref.read(tokenStorageProvider.future);
    return session != null;
  }

  @override
  Future<String> getCurrentMemberId() async {
    await _ref.read(tokenRefreshServiceProvider).ensureFreshToken();
    final session = await _ref.read(tokenStorageProvider.future);
    if (session == null) throw Exception('Not logged in');
    return session.memberId;
  }

  @override
  Future<bool> hasSeenOnboarding() => _onboardingStorage.hasSeenOnboarding();

  @override
  Future<void> markOnboardingSeen() => _onboardingStorage.markOnboardingSeen();
}