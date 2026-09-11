import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/borrowing_card.dart';
import '../../domain/entities/borrowing_details.dart';
import '../../domain/entities/borrowing_status.dart';
import '../providers/borrowings_providers.dart';

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
        title: const Text('My Borrowings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'All'), Tab(text: 'Active'), Tab(text: 'Returned')],
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
                Text("Couldn't load your borrowings", style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => ref.invalidate(myBorrowingsProvider),
                  child: const Text('Retry'),
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

          return TabBarView(
            controller: _tabController,
            children: [_list(all, theme), _list(active, theme), _list(returned, theme)],
          );
        },
      ),
    );
  }

  Widget _list(List<BorrowingDetails> details, ThemeData theme) {
    if (details.isEmpty) {
      return Center(child: Text('No borrowings here yet', style: theme.textTheme.bodyLarge));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: details.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: BorrowingCard(
          details: details[i],
          onReturn: () async {
            try {
              await ref.read(myBorrowingsProvider.notifier).returnBorrowing(details[i].borrowing.id);
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