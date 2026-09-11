import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BorrowSuccessScreen extends StatelessWidget {
  const BorrowSuccessScreen({super.key, required this.bookTitle, required this.dueDate});

  final String bookTitle;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72, height: 72,
                decoration:
                BoxDecoration(color: theme.colorScheme.primaryContainer, shape: BoxShape.circle),
                child: Icon(Icons.check, size: 40, color: theme.colorScheme.onPrimaryContainer),
              ),
              const SizedBox(height: 20),
              Text('Book borrowed successfully',
                  style: theme.textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(bookTitle, style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text('Due: ${DateFormat('MMM d, yyyy').format(dueDate)}',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  context.go('/my-borrowings');
                },
                child: const Text('View My Borrowings'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                child: const Text('Continue Browsing'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}