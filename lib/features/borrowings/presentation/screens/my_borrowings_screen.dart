import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/borrowing_card.dart';
import '../../domain/entities/borrowing_details.dart';
import '../../domain/entities/borrowing_status.dart';
import '../providers/borrowings_providers.dart';
import 'package:go_router/go_router.dart';
class MyBorrowingsScreen extends ConsumerStatefulWidget {
  const MyBorrowingsScreen({super.key});

  @override
  ConsumerState<MyBorrowingsScreen> createState() => _MyBorrowingsScreenState();
}

class _MyBorrowingsScreenState extends ConsumerState<MyBorrowingsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {

      if (!_tabController.indexIsChanging) setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borrowingsAsync = ref.watch(myBorrowingsProvider);
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
            Text('My Borrowings', style: theme.textTheme.titleLarge),
          ],
        ),
      ),
      body: borrowingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 96, height: 96,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.cloud_off_outlined, size: 40, color: theme.colorScheme.error),
                ),
                const SizedBox(height: 20),
                Text("Couldn't load your borrowings", style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Something went wrong.',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                const SizedBox(height: 20),
                FilledButton.icon(
                  icon: const Icon(Icons.refresh_outlined),
                  onPressed: () => ref.invalidate(myBorrowingsProvider),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (all) {
          final active = all
              .where((d) =>
          d.borrowing.status == BorrowingStatus.borrowed ||
              d.borrowing.status == BorrowingStatus.overdue)
              .toList();
          final returned =
          all.where((d) => d.borrowing.status == BorrowingStatus.returned).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    children: [
                      _segment(theme, 'All', all.length, 0),
                      _segment(theme, 'Active', active.length, 1),
                      _segment(theme, 'Returned', returned.length, 2),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _list(all, theme),
                    _list(active, theme),
                    _list(returned, theme),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _segment(ThemeData theme, String label, int count, int index) {
    final selected = _tabController.index == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => _tabController.animateTo(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? theme.colorScheme.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label,
                  style: theme.textTheme.labelLarge?.copyWith(
                      color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant)),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                decoration: BoxDecoration(
                  color: selected
                      ? theme.colorScheme.primaryContainer
                      : theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text('$count',
                    style: theme.textTheme.labelSmall?.copyWith(
                        color: selected
                            ? theme.colorScheme.onPrimaryContainer
                            : theme.colorScheme.onSurfaceVariant)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _list(List<BorrowingDetails> details, ThemeData theme) {
    if (details.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96, height: 96,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.bookmark_border, size: 40, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 20),
              Text("You haven't borrowed any books here",
                  style: theme.textTheme.titleLarge, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('Borrowed books and history will appear here.',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              FilledButton.icon(
                icon: const Icon(Icons.explore_outlined),
                onPressed: () => context.go('/books'),
                label: const Text('Browse Books'),
              ),
            ],
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      itemCount: details.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: BorrowingCard(
          details: details[i],
          onReturn: () async {
            try {
              await ref
                  .read(myBorrowingsProvider.notifier)
                  .returnBorrowing(details[i].borrowing.id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Returned successfully')),
                );
              }
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to return: $e')),
                );
              }
            }
          },
        ),
      ),
    );
  }
}