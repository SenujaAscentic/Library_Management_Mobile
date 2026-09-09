import 'package:flutter/material.dart';

enum BookStatus { available, unavailable, borrowed, returned, overdue }

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, required this.label});

  final BookStatus status;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (bg, fg) = switch (status) {
      BookStatus.available => (scheme.primaryContainer, scheme.onPrimaryContainer),
      BookStatus.unavailable => (scheme.surfaceContainerHighest, scheme.onSurfaceVariant),
      BookStatus.borrowed => (scheme.tertiaryContainer, scheme.onTertiaryContainer),
      BookStatus.returned => (scheme.secondaryContainer, scheme.onSecondaryContainer),
      BookStatus.overdue => (scheme.errorContainer, scheme.onErrorContainer),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: fg),
      ),
    );
  }
}