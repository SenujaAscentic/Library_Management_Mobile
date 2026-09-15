import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../auth/presentation/providers/session_providers.dart';
import '../../../books/domain/entities/book.dart';
import '../../domain/entities/borrow_failure.dart';
import '../providers/borrow_confirmation_providers.dart';
import 'borrow_success_screen.dart';

class BorrowConfirmationSheet extends ConsumerWidget {
  const BorrowConfirmationSheet({super.key, required this.book});

  final Book book;

  static Future<void> show(BuildContext context, Book book) {
    final container = ProviderScope.containerOf(context);
    container.read(borrowConfirmationProvider.notifier).reset();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => BorrowConfirmationSheet(book: book),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(borrowConfirmationProvider);
    final memberIdAsync = ref.watch(currentMemberIdProvider);
    final theme = Theme.of(context);
    final isLoading = state?.isLoading ?? false;
    final dueDatePreview = DateTime.now().add(const Duration(days: 14));

    ref.listen(borrowConfirmationProvider, (previous, next) {
      if (next != null && next.hasValue) {
        final borrowing = next.value!;
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BorrowSuccessScreen(book:book, dueDate: borrowing.dueDate),
        ));
        ref.read(borrowConfirmationProvider.notifier).reset();
      }
    });

    BorrowFailure? failure;
    if (state != null && state.hasError && state.error is BorrowException) {
      failure = (state.error as BorrowException).failure;
    }

    final (bannerTitle, bannerMessage) = failure?.when(
      limitExceeded: () => (
      "Borrowing Limit Reached",
      "You've reached your 3-book borrowing limit. Return a book to borrow another.",
      ),
      bookUnavailable: () => (
      "Book Unavailable",
      "This book is no longer available.",
      ),
      unknown: (_) => (
      "Something Went Wrong",
      "Please try again.",
      ),
    ) ??
        (null, null);

    // Only the limit-exceeded case is un-retryable without returning a
    // book first — other failures might succeed on a genuine retry.
    final isBlocked = failure?.when(
      limitExceeded: () => true,
      bookUnavailable: () => false,
      unknown: (_) => false,
    ) ??
        false;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40, height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              if (bannerTitle != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.error_outline, color: theme.colorScheme.error, size: 22),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(bannerTitle,
                                style: theme.textTheme.titleSmall
                                    ?.copyWith(color: theme.colorScheme.error)),
                            const SizedBox(height: 2),
                            Text(bannerMessage!,
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(color: theme.colorScheme.error)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Confirm borrow', style: theme.textTheme.headlineSmall),
                        const SizedBox(height: 4),
                        Text('Verify your checkout details and return timetable',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.menu_book_outlined, color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Book info card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40, height: 56,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(book.title,
                                    style: theme.textTheme.titleMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text('In Stack',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                        color: theme.colorScheme.onPrimaryContainer)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(book.author,
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                          const SizedBox(height: 4),
                          Text('ISBN  ${book.isbn}',
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Due date row
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 18, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 8),
                    Text('Due date', style: theme.textTheme.bodyMedium),
                    const Spacer(),
                    Text(DateFormat('d MMM yyyy').format(dueDatePreview),
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 6),
                    Text('(14 days)',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Disclaimer with Member ID
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.verified_user_outlined,
                      size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: memberIdAsync.when(
                      loading: () => Text('Loading member details…',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      error: (_, __) => Text('Borrowing associates with your member account.',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                      data: (memberId) => Text(
                        'Borrowing automatically associates with Member ID #$memberId.',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: isLoading
                      ? const SizedBox(
                      width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
                      : Icon(isBlocked ? Icons.block : Icons.check_circle_outline),
                  onPressed: (isLoading || isBlocked)
                      ? null
                      : () => ref.read(borrowConfirmationProvider.notifier).confirm(book.id),
                  label: Text(isLoading ? 'Confirming…' : 'Confirm Borrow'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}