import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../books/domain/entities/book.dart';
import '../../../books/presentation/widgets/book_cover.dart';

class BorrowSuccessScreen extends StatelessWidget {
  const BorrowSuccessScreen({super.key, required this.book, required this.dueDate});

  final Book book;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            children: [
              _celebrationHeader(theme),
              const SizedBox(height: 24),
              Text('Book borrowed successfully',
                  style: theme.textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text('${book.title} · ${book.author}',
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookCover(
                          imageUrl: book.coverImageUrl,
                          width: 56,
                          height: 76,
                          borderRadius: 8,
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CATALOGUE ID · #${book.id}',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                      letterSpacing: 0.5)),
                              const SizedBox(height: 4),
                              Text(book.title, style: theme.textTheme.titleMedium),
                              const SizedBox(height: 2),
                              Text('Standard Physical Loan',
                                  style: theme.textTheme.bodyMedium
                                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                            ],
                          ),
                        ),
                        Icon(Icons.auto_stories_outlined,
                            color: theme.colorScheme.onSurfaceVariant),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Due date', style: theme.textTheme.bodyMedium),
                              const Spacer(),
                              Icon(Icons.event_available_outlined,
                                  size: 16, color: theme.colorScheme.primary),
                              const SizedBox(width: 4),
                              Text('14-day loan',
                                  style: theme.textTheme.labelMedium
                                      ?.copyWith(color: theme.colorScheme.primary)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(DateFormat('d MMM yyyy').format(dueDate),
                              style: theme.textTheme.headlineSmall),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.info_outline,
                                  size: 16, color: theme.colorScheme.onSurfaceVariant),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  'Return by the due date — books not returned on time are marked overdue.',
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    context.go('/my-borrowings');
                  },
                  label: const Text('View My Borrowings'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.search_outlined),
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  label: const Text('Continue Browsing'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _celebrationHeader(ThemeData theme) {
    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Scattered decorative confetti — purely decorative, low-key.
          _confetti(theme, top: 10, left: 40, color: theme.colorScheme.primary, size: 8),
          _confetti(theme, top: 30, right: 30, color: theme.colorScheme.tertiary, size: 6),
          _confetti(theme, top: 70, left: 10, color: theme.colorScheme.secondary, size: 10),
          _confetti(theme, top: 90, right: 10, color: theme.colorScheme.primaryContainer, size: 14),
          _confetti(theme, top: 130, left: 60, color: theme.colorScheme.tertiaryContainer, size: 8),
          _confetti(theme, top: 140, right: 55, color: theme.colorScheme.primary, size: 6),

          Column(
            children: [
              Container(
                width: 96, height: 96,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, size: 32, color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.verified_outlined, size: 16, color: theme.colorScheme.onPrimaryContainer),
                    const SizedBox(width: 6),
                    Text('LOAN ACTIVE',
                        style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.onPrimaryContainer,
                            letterSpacing: 0.5)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _confetti(ThemeData theme,
      {double? top, double? left, double? right, required Color color, required double size}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}