import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/books_providers.dart';

class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(bookListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: booksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (books) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: books.length,
          itemBuilder: (context, i) {
            final book = books[i];
            return Card(
              child: ListTile(
                title: Text(book.title),
                subtitle: Text('${book.author} · ${book.publishedYear}'),
                trailing: Text(book.isAvailable ? 'Available' : 'Unavailable'),
              ),
            );
          },
        ),
      ),
    );
  }
}