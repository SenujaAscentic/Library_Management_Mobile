import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/fake_auth_session_storage.dart';
import '../../data/repositories/fake_session_repository.dart';
import '../../domain/repositories/session_repository.dart';

part 'session_providers.g.dart';

@Riverpod(keepAlive: true)
SessionRepository sessionRepository(Ref ref) {
  return FakeSessionRepository(ref, ref.watch(fakeAuthSessionStorageProvider));
}

@riverpod
Future<String> currentMemberId(Ref ref) {
  return ref.watch(sessionRepositoryProvider).getCurrentMemberId();
}