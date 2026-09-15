import '../entities/member.dart';
import '../repositories/profile_repository.dart';

class GetOwnProfileUseCase {
  GetOwnProfileUseCase(this._repository);
  final ProfileRepository _repository;

  Future<Member> call(String memberId) => _repository.getOwnProfile(memberId);
}