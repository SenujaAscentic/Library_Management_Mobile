import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/domain/usecases/get_session_status_usecase.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/books/presentation/screens/book_list_screen.dart';
import '../../features/borrowings/presentation/screens/my_borrowings_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../widgets/app_shell.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  const authRoutes = ['/splash', '/onboarding', '/login', '/register'];

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) async {
      final status = await ref.read(getSessionStatusUseCaseProvider).call();
      final loc = state.matchedLocation;
      final onAuthRoute = authRoutes.contains(loc);

      switch (status) {
        case SessionStatus.loggedIn:
          return onAuthRoute ? '/books' : null;
        case SessionStatus.needsLogin:
          return (loc == '/login' || loc == '/register') ? null : '/login';
        case SessionStatus.needsOnboarding:
          return loc == '/onboarding' ? null : '/onboarding';
      }
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(prefillEmail: state.extra as String?),
      ),
      GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: '/books', builder: (context, state) => const BookListScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: '/my-borrowings',
                builder: (context, state) => const MyBorrowingsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen()),
          ]),
        ],
      ),
    ],
  );
}