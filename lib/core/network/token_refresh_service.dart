import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../storage/token_storage.dart';

part 'token_refresh_service.g.dart';

class TokenRefreshService {
  TokenRefreshService(this._ref);
  final Ref _ref;
  Future<void>? _refreshLock;

  Future<void> ensureFreshToken() async {
    final session = await _ref.read(tokenStorageProvider.future);
    if (session == null) return;
    if (!session.isExpiredOrExpiringSoon) return;

    if (_refreshLock != null) {
      await _refreshLock;
      return;
    }

    _refreshLock = _ref.read(authRepositoryProvider).refreshSession(session.refreshToken);
    try {
      await _refreshLock;
    } catch (e) {
      await _ref.read(tokenStorageProvider.notifier).clearSession();
      rethrow;
    } finally {
      _refreshLock = null;
    }
  }
}

@Riverpod(keepAlive: true)
TokenRefreshService tokenRefreshService(Ref ref) => TokenRefreshService(ref);