import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/session_providers.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  static const _slides = [
    (
    imageUrl: 'https://picsum.photos/seed/onboarding1/600/500',
    badgeIcon: Icons.menu_book_outlined,
    previewLabel: 'Whole archive available',
    previewValue: '32k titles',
    headline: 'Browse the whole catalogue',
    body: "Search by title or author and see what's on the shelf right now.",
    ),
    (
    imageUrl: 'https://picsum.photos/seed/onboarding2/600/500',
    badgeIcon: Icons.auto_stories_outlined,
    previewLabel: 'Borrow limit',
    previewValue: '3 books',
    headline: 'Borrow in a couple of taps',
    body: "Pick a title, confirm, and it's yours for 14 days. Up to three books at a time.",
    ),
    (
    imageUrl: 'https://picsum.photos/seed/onboarding3/600/500',
    badgeIcon: Icons.event_available_outlined,
    previewLabel: 'Lending period',
    previewValue: '14 days',
    headline: 'Keep track of due dates',
    body: 'See what\'s active, what\'s overdue, and return a book from your borrowings list.',
    ),
  ];

  Future<void> _skip() async {
    await ref.read(sessionRepositoryProvider).markOnboardingSeen();
    if (mounted) context.go('/login');
  }

  Future<void> _next() async {
    if (_page < _slides.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    } else {
      await ref.read(sessionRepositoryProvider).markOnboardingSeen();
      if (mounted) context.go('/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLast = _page == _slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                children: [
                  Row(
                    children: List.generate(_slides.length, (i) {
                      final active = i == _page;
                      return Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: active ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active ? theme.colorScheme.primary : theme.colorScheme.outlineVariant,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: isLast ? null : _skip,
                    style: TextButton.styleFrom(
                      foregroundColor: theme.colorScheme.onSurfaceVariant,
                    ),
                    child: const Text('Skip'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                itemCount: _slides.length,
                itemBuilder: (context, i) {
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Image.network(
                                  slide.imageUrl,
                                  width: double.infinity,
                                  height: 280,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) => progress == null
                                      ? child
                                      : Container(
                                    height: 280,
                                    color: theme.colorScheme.surfaceContainerHigh,
                                  ),
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    height: 280,
                                    color: theme.colorScheme.surfaceContainerHigh,
                                    child: Icon(slide.badgeIcon,
                                        size: 48, color: theme.colorScheme.onSurfaceVariant),
                                  ),
                                ),
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(slide.badgeIcon,
                                        color: theme.colorScheme.primary, size: 22),
                                  ),
                                ),
                                Positioned(
                                  left: 12,
                                  right: 12,
                                  bottom: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.08),
                                          blurRadius: 12,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.search,
                                            size: 18, color: theme.colorScheme.onSurfaceVariant),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            slide.previewLabel,
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(color: Colors.black87),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.primaryContainer,
                                            borderRadius: BorderRadius.circular(999),
                                          ),
                                          child: Text(
                                            slide.previewValue,
                                            style: theme.textTheme.labelMedium?.copyWith(
                                                color: theme.colorScheme.onPrimaryContainer),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(slide.headline, style: theme.textTheme.headlineSmall),
                          const SizedBox(height: 10),
                          Text(slide.body,
                              style: theme.textTheme.bodyLarge
                                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _next,
                      icon: Icon(isLast ? Icons.person_add_outlined : Icons.arrow_forward),
                      label: Text(isLast ? 'Create Account' : 'Next'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Preview slide: ',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      ...List.generate(_slides.length, (i) {
                        final active = i == _page;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: active
                                  ? theme.colorScheme.primaryContainer
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text('${i + 1}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                    color: active
                                        ? theme.colorScheme.onPrimaryContainer
                                        : theme.colorScheme.onSurfaceVariant)),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}