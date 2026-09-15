abstract class SessionRepository {
  Future<bool> isLoggedIn();

  /// Unchanged from before: throws if not logged in. Every existing
  /// caller (Borrowings, Profile, Borrow Confirmation) keeps working
  /// exactly as-is — they're never reached anyway unless already logged
  /// in, since the router now gates access before those screens render.
  Future<String> getCurrentMemberId();

  Future<bool> hasSeenOnboarding();
  Future<void> markOnboardingSeen();
}