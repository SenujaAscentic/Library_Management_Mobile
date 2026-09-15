import '../repositories/auth_repository.dart';

class RegisterUseCase {
  RegisterUseCase(this._repository);
  final AuthRepository _repository;

  Future<void> call({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    return _repository.register(
        fullName: fullName, email: email, phoneNumber: phoneNumber, password: password);
  }
}