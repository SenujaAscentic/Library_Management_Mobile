import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
sealed class AuthFailure with _$AuthFailure {
  const factory AuthFailure.invalidCredentials() = _InvalidCredentials;
  const factory AuthFailure.duplicateEmail() = _DuplicateEmail;
  const factory AuthFailure.sessionExpired() = _SessionExpired;
  const factory AuthFailure.unknown(String message) = _Unknown;
}

class AuthException implements Exception {
  AuthException(this.failure);
  final AuthFailure failure;
}