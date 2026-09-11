import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_list_filters.dart';
import '../providers/books_providers.dart';

class BookFilterSheet extends ConsumerStatefulWidget {
  const BookFilterSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const BookFilterSheet(),
    );
  }

  @override
  ConsumerState<BookFilterSheet> createState() => _BookFilterSheetState();
}

class _BookFilterSheetState extends ConsumerState<BookFilterSheet> {
  late final TextEditingController _authorController;
  late final TextEditingController _yearController;

  @override
  void initState() {
    super.initState();
    final filters = ref.read(bookFiltersProvider);
    _authorController = TextEditingController(text: filters.author ?? '');
    _yearController = TextEditingController(text: filters.publishedYear?.toString() ?? '');
  }

  @override
  void dispose() {
    _authorController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filters = ref.watch(bookFiltersProvider);
    final notifier = ref.read(bookFiltersProvider.notifier);

    return Padding(
      padding: EdgeInsets.only(
        left: 20, right: 20, top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Filters', style: theme.textTheme.titleLarge),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close_outlined),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(
              labelText: 'Author',
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (value) => notifier.setAuthor(value.isEmpty ? null : value),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Published Year',
              prefixIcon: Icon(Icons.calendar_today_outlined),
            ),
            onChanged: (value) => notifier.setPublishedYear(int.tryParse(value)),
          ),
          const SizedBox(height: 20),
          Text('Availability', style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          SegmentedButton<BookAvailabilityFilter>(
            segments: const [
              ButtonSegment(
                  value: BookAvailabilityFilter.all,
                  label: Text('All'),
                  icon: Icon(Icons.apps_outlined)),
              ButtonSegment(
                  value: BookAvailabilityFilter.availableOnly,
                  label: Text('Available'),
                  icon: Icon(Icons.check_circle_outline)),
              ButtonSegment(
                  value: BookAvailabilityFilter.unavailableOnly,
                  label: Text('Unavailable'),
                  icon: Icon(Icons.block_outlined)),
            ],
            selected: {filters.availability},
            onSelectionChanged: (selection) => notifier.setAvailability(selection.first),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  icon: const Icon(Icons.clear_all_outlined),
                  onPressed: () {
                    notifier.clearFilters();
                    _authorController.clear();
                    _yearController.clear();
                  },
                  label: const Text('Clear filters'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Done'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}