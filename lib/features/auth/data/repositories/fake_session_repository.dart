import '../../domain/repositories/session_repository.dart';

/// Stand-in until backend registration/login blockers are resolved.
class FakeSessionRepository implements SessionRepository {
  @override
  Future<String> getCurrentMemberId() async => 'member-1';
}