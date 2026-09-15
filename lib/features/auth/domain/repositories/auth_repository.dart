abstract class AuthRepository {
  Future<void> login({required String email, required String password});
  Future<void> register({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });
  Future<void> logout();
  Future<void> refreshSession(String refreshToken);
}