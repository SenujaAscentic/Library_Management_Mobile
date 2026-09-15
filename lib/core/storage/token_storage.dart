import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage.g.dart';

class Session {
  Session({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.refreshExpiresAt,
    required this.memberId,
  });

  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;
  final DateTime refreshExpiresAt;
  final String memberId;

  bool get isExpiredOrExpiringSoon =>
      DateTime.now().isAfter(expiresAt.subtract(const Duration(seconds: 5)));

  bool get isRefreshExpired => DateTime.now().isAfter(refreshExpiresAt);
}

const _accessTokenKey = 'access_token';
const _refreshTokenKey = 'refresh_token';
const _expiresAtKey = 'expires_at';
const _refreshExpiresAtKey = 'refresh_expires_at';
const _memberIdKey = 'session_member_id';

@Riverpod(keepAlive: true)
class TokenStorage extends _$TokenStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<Session?> build() async {
    final access = await _storage.read(key: _accessTokenKey);
    final refresh = await _storage.read(key: _refreshTokenKey);
    final expiresAtRaw = await _storage.read(key: _expiresAtKey);
    final refreshExpiresAtRaw = await _storage.read(key: _refreshExpiresAtKey);
    final memberId = await _storage.read(key: _memberIdKey);
    if (access == null || refresh == null || expiresAtRaw == null ||
        refreshExpiresAtRaw == null || memberId == null) {
      return null;
    }
    return Session(
      accessToken: access,
      refreshToken: refresh,
      expiresAt: DateTime.parse(expiresAtRaw),
      refreshExpiresAt: DateTime.parse(refreshExpiresAtRaw),
      memberId: memberId,
    );
  }

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
    required int expiresInSeconds,
    required String memberId,
    DateTime? refreshExpiresAt,
  }) async {
    final expiresAt = DateTime.now().add(Duration(seconds: expiresInSeconds));
    final effectiveRefreshExpiresAt = refreshExpiresAt ??
        state.value?.refreshExpiresAt ??
        DateTime.now().add(const Duration(seconds: 90));

    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
    await _storage.write(key: _expiresAtKey, value: expiresAt.toIso8601String());
    await _storage.write(
        key: _refreshExpiresAtKey, value: effectiveRefreshExpiresAt.toIso8601String());
    await _storage.write(key: _memberIdKey, value: memberId);

    state = AsyncData(Session(
      accessToken: accessToken,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
      refreshExpiresAt: effectiveRefreshExpiresAt,
      memberId: memberId,
    ));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
    await _storage.delete(key: _expiresAtKey);
    await _storage.delete(key: _refreshExpiresAtKey);
    await _storage.delete(key: _memberIdKey);
    state = const AsyncData(null);
  }
}