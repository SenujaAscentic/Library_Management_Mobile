import '../../../../shared/fakes/fake_data_store.dart';
import '../../domain/entities/member.dart';
import '../../domain/repositories/profile_repository.dart';

class FakeProfileRepository implements ProfileRepository {
  FakeProfileRepository(this._store);
  final FakeDataStore _store;

  @override
  Future<Member> getOwnProfile(String memberId) async {
    await Future.delayed(const Duration(milliseconds: 350));
    return _store.members.firstWhere((m) => m.id == memberId,
        orElse: () => throw Exception('Member not found'));
  }

  @override
  Future<Member> updateProfile({
    required String memberId,
    required String fullName,
    required String phoneNumber,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _store.updateMember(memberId, fullName: fullName, phoneNumber: phoneNumber);
    return _store.members.firstWhere((m) => m.id == memberId);
  }
}