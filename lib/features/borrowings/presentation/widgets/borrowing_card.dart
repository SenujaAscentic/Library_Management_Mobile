import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_management_app/features/borrowings/domain/entities/borrowing_details.dart';
import '../../domain/entities/borrowing_status.dart';
import '../../../../shared/widgets/status_badge.dart';


class BorrowingCard extends StatelessWidget {
  const BorrowingCard({super.key, required this.details, required this.onReturn});

  final BorrowingDetails details;
  final VoidCallback onReturn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borrowing = details.borrowing;
    final dateFormat = DateFormat('MMM d, yyyy');

    final status = switch (borrowing.status) {
      BorrowingStatus.borrowed => BookStatus.borrowed,
      BorrowingStatus.returned => BookStatus.returned,
      BorrowingStatus.overdue => BookStatus.overdue,
    };
    final statusLabel = switch (borrowing.status) {
      BorrowingStatus.borrowed => 'Borrowed',
      BorrowingStatus.returned => 'Returned',
      BorrowingStatus.overdue => 'Overdue',
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details.bookTitle, style: theme.textTheme.titleMedium),
            const SizedBox(height: 2),
            Text(details.bookAuthor,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 8),
            Text('Borrowed: ${dateFormat.format(borrowing.borrowedDate)}',
                style: theme.textTheme.bodySmall),
            if (borrowing.status == BorrowingStatus.returned && borrowing.returnedDate != null)
              Text('Returned: ${dateFormat.format(borrowing.returnedDate!)}',
                  style: theme.textTheme.bodySmall)
            else
              Text('Due: ${dateFormat.format(borrowing.dueDate)}',
                  style: theme.textTheme.bodySmall),
            const SizedBox(height: 8),
            Row(
              children: [
                StatusBadge(status: status, label: statusLabel),
                const Spacer(),
                if (borrowing.canReturn)
                  OutlinedButton(onPressed: onReturn, child: const Text('Return')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}