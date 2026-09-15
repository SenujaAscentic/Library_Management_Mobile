import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/token_storage.dart';
import '../../../../shared/fakes/fake_data_store.dart';
import '../../../profile/domain/entities/member.dart';
import '../../domain/entities/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this._ref, this._store);
  final Ref _ref;
  final FakeDataStore _store;

  // Deliberately short for testing the refresh cycle — increase once
  // you're done observing it.
  static const _accessTtl = Duration(seconds: 3600);
  static const _refreshTtl = Duration(seconds: 7200);

  String _generateToken(String prefix) => '$prefix-${DateTime.now().microsecondsSinceEpoch}';

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final exists = _store.members.any((m) => m.email.toLowerCase() == email.toLowerCase());
    if (exists) throw AuthException(const AuthFailure.duplicateEmail());

    _store.members.add(Member(
      id: 'member-${_store.members.length + 1}',
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      registeredDate: DateTime.now(),
      isActive: true,
    ));
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Member? member;
    for (final m in _store.members) {
      if (m.email.toLowerCase() == email.toLowerCase()) {
        member = m;
        break;
      }
    }
    if (member == null || password.isEmpty) {
      throw AuthException(const AuthFailure.invalidCredentials());
    }

    await _ref.read(tokenStorageProvider.notifier).saveSession(
      accessToken: _generateToken('fake-access'),
      refreshToken: _generateToken('fake-refresh'),
      expiresInSeconds: _accessTtl.inSeconds,
      memberId: member.id,
      refreshExpiresAt: DateTime.now().add(_refreshTtl),
    );
    debugPrint('[Auth] Logged in as ${member.id}, access token expires in ${_accessTtl.inSeconds}s');
  }

  @override
  Future<void> logout() => _ref.read(tokenStorageProvider.notifier).clearSession();

  @override
  Future<void> refreshSession(String refreshToken) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final current = await _ref.read(tokenStorageProvider.future);
    if (current == null || current.refreshToken != refreshToken) {
      throw AuthException(const AuthFailure.sessionExpired());
    }
    if (current.isRefreshExpired) {
      debugPrint('[Auth] Refresh token expired — forcing logout');
      throw AuthException(const AuthFailure.sessionExpired());
    }

    debugPrint('[Auth] Refreshing access token for ${current.memberId}');
    await _ref.read(tokenStorageProvider.notifier).saveSession(
      accessToken: _generateToken('fake-access'),
      refreshToken: _generateToken('fake-refresh'),
      expiresInSeconds: _accessTtl.inSeconds,
      memberId: current.memberId,
    );
  }
}