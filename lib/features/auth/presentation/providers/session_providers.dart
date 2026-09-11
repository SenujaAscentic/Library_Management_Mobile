import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/fake_session_repository.dart';
import '../../domain/repositories/session_repository.dart';

part 'session_providers.g.dart';

@riverpod
SessionRepository sessionRepository(Ref ref) {
  // TODO: swap to a real implementation once backend is ready.
  return FakeSessionRepository();
}
@riverpod
Future<String> currentMemberId(Ref ref) {
  return ref.watch(sessionRepositoryProvider).getCurrentMemberId();
}