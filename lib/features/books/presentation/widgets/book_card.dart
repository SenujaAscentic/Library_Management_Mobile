import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';
import '../../../../shared/widgets/status_badge.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book, required this.onTap});

  final Book book;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 80,
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
                    Text(book.title,
                        style: theme.textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('${book.author} · ${book.publishedYear}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    StatusBadge(
                      status: book.isAvailable ? BookStatus.available : BookStatus.unavailable,
                      label: book.isAvailable
                          ? '${book.availableCopies} of ${book.totalCopies} available'
                          : 'Unavailable',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}