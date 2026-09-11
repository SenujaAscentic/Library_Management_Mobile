import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../../borrowings/presentation/screens/borrow_confirmation_sheet.dart';
import '../providers/books_providers.dart';
import '../widgets/book_cover.dart';

class BookDetailsScreen extends ConsumerWidget {
  const BookDetailsScreen({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookDetailsProvider(bookId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: bookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Book not found', style: theme.textTheme.titleMedium),
          ),
        ),
        data: (book) => SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            children: [
              Center(
                child: BookCover(
                  imageUrl: book.coverImageUrl,
                  width: 220,
                  height: 300,
                  borderRadius: 16,
                ),
              ),
              const SizedBox(height: 20),
              Text(book.title, style: theme.textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(book.author,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 20),

              // Info card: ISBN / Published Year, then Availability
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: _infoBlock(theme, 'ISBN', book.isbn)),
                        Expanded(
                            child: _infoBlock(
                                theme, 'Published Year', book.publishedYear.toString())),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 1),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Availability',
                                  style: theme.textTheme.labelMedium
                                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                              const SizedBox(height: 4),
                              Text(
                                book.isAvailable
                                    ? '${book.availableCopies} of ${book.totalCopies} copies available'
                                    : 'No copies currently available',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        StatusBadge(
                          status: book.isAvailable ? BookStatus.available : BookStatus.unavailable,
                          label: book.isAvailable ? 'Available' : 'Unavailable',
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.auto_stories_outlined),
                  onPressed:
                  book.isAvailable ? () => BorrowConfirmationSheet.show(context, book) : null,
                  label: const Text('Borrow this Book'),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '14-day lending period', // "free renewal" dropped — no such feature exists yet
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBlock(ThemeData theme, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        const SizedBox(height: 4),
        Text(value, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}