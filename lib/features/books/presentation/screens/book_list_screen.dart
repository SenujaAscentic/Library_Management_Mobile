import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_filter_sheet.dart';
import 'book_details_screen.dart';
import '../providers/books_providers.dart';
import '../widgets/book_card.dart';


class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(filteredBooksProvider);
    final filters = ref.watch(bookFiltersProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.menu_book_outlined, color: theme.colorScheme.onPrimary, size: 18),
            ),
            const SizedBox(width: 10),
            Text('Book List', style: theme.textTheme.titleLarge),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: SearchBar(
                    hintText: 'Search title or author',
                    leading: const Icon(Icons.search_outlined),
                    trailing: filters.searchQuery.isNotEmpty
                        ? [
                      IconButton(
                        icon: const Icon(Icons.clear_outlined),
                        onPressed: () =>
                            ref.read(bookFiltersProvider.notifier).setSearchQuery(''),
                      ),
                    ]
                        : null,
                    onChanged: (value) =>
                        ref.read(bookFiltersProvider.notifier).setSearchQuery(value),
                  ),
                ),
                const SizedBox(width: 8),
                Badge(
                  isLabelVisible: filters.hasActiveFilters,
                  smallSize: 8,
                  child: IconButton.filledTonal(
                    icon: const Icon(Icons.tune_outlined),
                    onPressed: () => BookFilterSheet.show(context),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: booksAsync.when(
              loading: () => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 5,
                itemBuilder: (context, i) => Container(
                  height: 108,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 72, height: 72,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.cloud_off_outlined,
                            size: 32, color: theme.colorScheme.error),
                      ),
                      const SizedBox(height: 20),
                      Text("Couldn't load books",
                          style: theme.textTheme.titleLarge
                              ?.copyWith(color: theme.colorScheme.error)),
                      const SizedBox(height: 8),
                      Text('Check your connection and try again to view catalog titles.',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      FilledButton.icon(
                        icon: const Icon(Icons.refresh_outlined),
                        onPressed: () => ref.invalidate(filteredBooksProvider),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
              data: (books) {
                if (books.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 72, height: 72,
                            decoration:
                            BoxDecoration(color: theme.colorScheme.primaryContainer, shape: BoxShape.circle),
                            child: Icon(Icons.menu_book_outlined,
                                size: 32, color: theme.colorScheme.onPrimaryContainer),
                          ),
                          const SizedBox(height: 20),
                          Text('No books match your search', style: theme.textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text('Try a different title, author, or published year to discover titles.',
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 20),
                          FilledButton.tonalIcon(
                            icon: const Icon(Icons.filter_alt_off_outlined),
                            onPressed: () => ref.read(bookFiltersProvider.notifier).clearFilters(),
                            label: const Text('Clear filters'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () => ref.refresh(filteredBooksProvider.future),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: books.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: BookCard(
                        book: books[i],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BookDetailsScreen(bookId: books[i].id),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}