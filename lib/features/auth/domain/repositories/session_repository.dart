abstract class SessionRepository {
  Future<bool> isLoggedIn();


  Future<String> getCurrentMemberId();

  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingSeen();
}