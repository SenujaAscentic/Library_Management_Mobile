import '../repositories/session_repository.dart';

enum SessionStatus { loggedIn, needsLogin, needsOnboarding }

class GetSessionStatusUseCase {
  GetSessionStatusUseCase(this._repository);
  final SessionRepository _repository;

  Future<SessionStatus> call() async {
    if (await _repository.isLoggedIn()) return SessionStatus.loggedIn;
    final seenOnboarding = await _repository.hasSeenOnboarding();
    return seenOnboarding ? SessionStatus.needsLogin : SessionStatus.needsOnboarding;
  }
}