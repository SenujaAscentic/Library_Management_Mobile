import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';
import 'book_cover.dart';
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
              BookCover(imageUrl: book.coverImageUrl, width: 80, height: 116),
              const SizedBox(width: 14),
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
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        StatusBadge(
                          status: book.isAvailable ? BookStatus.available : BookStatus.unavailable,
                          label: book.isAvailable
                              ? '${book.availableCopies} of ${book.totalCopies} available'
                              : 'Unavailable',
                        ),
                        const Spacer(),
                        Text('Details',
                            style: theme.textTheme.labelMedium
                                ?.copyWith(color: theme.colorScheme.primary)),
                        Icon(Icons.chevron_right, size: 16, color: theme.colorScheme.primary),
                      ],
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