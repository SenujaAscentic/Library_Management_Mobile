import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../providers/books_providers.dart';

class BookDetailsScreen extends ConsumerWidget {
  const BookDetailsScreen({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookDetailsProvider(bookId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(), // back arrow appears automatically via Navigator
      body: bookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Book not found', style: theme.textTheme.titleMedium),
          ),
        ),
        data: (book) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(book.title, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(book.author,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 16),
              Text('ISBN: ${book.isbn}', style: theme.textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text('Published: ${book.publishedYear}', style: theme.textTheme.bodyMedium),
              const SizedBox(height: 12),
              StatusBadge(
                status: book.isAvailable ? BookStatus.available : BookStatus.unavailable,
                label: book.isAvailable
                    ? '${book.availableCopies} of ${book.totalCopies} available'
                    : 'Unavailable',
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: book.isAvailable
                    ? () {
                  // TODO: wire to Borrow Confirmation once Borrowings feature exists
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Borrowing not implemented yet')),
                  );
                }
                    : null, // null onPressed = disabled button, per M3 convention
                child: const Text('Borrow this Book'),
              ),
              if (!book.isAvailable) ...[
                const SizedBox(height: 8),
                Text(
                  'No copies available',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}