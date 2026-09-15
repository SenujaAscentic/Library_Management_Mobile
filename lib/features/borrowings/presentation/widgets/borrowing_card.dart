import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/borrowing_details.dart';
import '../../domain/entities/borrowing_status.dart';
import '../../../books/presentation/widgets/book_cover.dart';

class BorrowingCard extends StatelessWidget {
  const BorrowingCard({super.key, required this.details, required this.onReturn});

  final BorrowingDetails details;
  final VoidCallback onReturn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borrowing = details.borrowing;
    final dateFormat = DateFormat('dd MMM yyyy');
    final isOverdue = borrowing.status == BorrowingStatus.overdue;

    final (chipBg, chipFg, chipLabel) = switch (borrowing.status) {
      BorrowingStatus.borrowed => (
      theme.colorScheme.tertiaryContainer,
      theme.colorScheme.onTertiaryContainer,
      'Borrowed'
      ),
      BorrowingStatus.overdue => (
      theme.colorScheme.errorContainer,
      theme.colorScheme.onErrorContainer,
      'Overdue'
      ),
      BorrowingStatus.returned => (
      theme.colorScheme.secondaryContainer,
      theme.colorScheme.onSecondaryContainer,
      'Returned'
      ),
    };

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(imageUrl: details.bookCoverUrl, width: 72, height: 104, borderRadius: 10),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: chipBg,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(chipLabel,
                          style: theme.textTheme.labelSmall?.copyWith(color: chipFg)),
                    ),
                    if (isOverdue) ...[
                      const Spacer(),
                      Icon(Icons.priority_high, color: theme.colorScheme.error, size: 20),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(details.bookTitle, style: theme.textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(details.bookAuthor,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 14, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 6),
                    Text('Borrowed: ${dateFormat.format(borrowing.borrowedDate)}',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 4),
                if (borrowing.status == BorrowingStatus.returned && borrowing.returnedDate != null)
                  Row(
                    children: [
                      Icon(Icons.assignment_turned_in_outlined,
                          size: 14, color: theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 6),
                      Text('Returned: ${dateFormat.format(borrowing.returnedDate!)}',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  )
                else
                  Row(
                    children: [
                      Icon(isOverdue ? Icons.alarm : Icons.sync_alt,
                          size: 14,
                          color: isOverdue ? theme.colorScheme.error : theme.colorScheme.onSurfaceVariant),
                      const SizedBox(width: 6),
                      Text('Due: ${dateFormat.format(borrowing.dueDate)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                              color: isOverdue
                                  ? theme.colorScheme.error
                                  : theme.colorScheme.onSurfaceVariant,
                              fontWeight: isOverdue ? FontWeight.w700 : null)),
                    ],
                  ),
                if (borrowing.canReturn) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton.tonalIcon(
                      style: FilledButton.styleFrom(
                        backgroundColor: isOverdue
                            ? theme.colorScheme.errorContainer
                            : theme.colorScheme.surfaceContainerHigh,
                        foregroundColor:
                        isOverdue ? theme.colorScheme.error : theme.colorScheme.primary,
                      ),
                      icon: const Icon(Icons.assignment_return_outlined, size: 18),
                      onPressed: onReturn,
                      label: const Text('Return'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}