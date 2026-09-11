import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/books/presentation/screens/book_list_screen.dart';
import '../../features/borrowings/presentation/screens/my_borrowings_screen.dart';
import '../widgets/app_shell.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/books',
    routes: [
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

