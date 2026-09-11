import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../books/domain/entities/book.dart';
import '../../domain/entities/borrow_failure.dart';
import '../providers/borrow_confirmation_providers.dart';
import 'borrow_success_screen.dart';

class BorrowConfirmationSheet extends ConsumerWidget {
  const BorrowConfirmationSheet({super.key, required this.book});

  final Book book;

  static Future<void> show(BuildContext context, Book book) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BorrowConfirmationSheet(book: book),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(borrowConfirmationProvider);
    final theme = Theme.of(context);
    final isLoading = state?.isLoading ?? false;
    final dueDatePreview = DateTime.now().add(const Duration(days: 14));

    ref.listen(borrowConfirmationProvider, (previous, next) {
      if (next != null && next.hasValue) {
        final borrowing = next.value!;
        Navigator.of(context).pop(); // close the sheet
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BorrowSuccessScreen(bookTitle: book.title, dueDate: borrowing.dueDate),
        ));
        ref.read(borrowConfirmationProvider.notifier).reset();
      }
    });

    String? errorMessage;
    if (state != null && state.hasError) {
      final error = state.error;
      errorMessage = error is BorrowException
          ? error.failure.when(
        limitExceeded: () => "You've reached your 3-book borrowing limit.",
        bookUnavailable: () => 'This book is no longer available.',
        unknown: (_) => 'Something went wrong. Please try again.',
      )
          : 'Something went wrong. Please try again.';
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 20, right: 20, top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 40, height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(book.title, style: theme.textTheme.titleMedium)),
          ]),
          const SizedBox(height: 16),
          Text('Due date: ${DateFormat('MMM d, yyyy').format(dueDatePreview)}',
              style: theme.textTheme.bodyMedium),
          if (errorMessage != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(errorMessage,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onErrorContainer)),
            ),
          ],
          const SizedBox(height: 20),
          Row(children: [
            Expanded(
              child: TextButton(
                onPressed: isLoading ? null : () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton(
                onPressed: isLoading
                    ? null
                    : () => ref.read(borrowConfirmationProvider.notifier).confirm(book.id),
                child: isLoading
                    ? const SizedBox(
                    width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Confirm Borrow'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}