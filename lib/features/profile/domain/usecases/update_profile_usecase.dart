import '../entities/member.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase {
  UpdateProfileUseCase(this._repository);
  final ProfileRepository _repository;

  Future<Member> call({
    required String memberId,
    required String fullName,
    required String phoneNumber,
  }) {
    return _repository.updateProfile(memberId: memberId, fullName: fullName, phoneNumber: phoneNumber);
  }
}