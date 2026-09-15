import '../entities/member.dart';

abstract class ProfileRepository {
  Future<Member> getOwnProfile(String memberId);
  Future<Member> updateProfile({
    required String memberId,
    required String fullName,
    required String phoneNumber,
  });
}