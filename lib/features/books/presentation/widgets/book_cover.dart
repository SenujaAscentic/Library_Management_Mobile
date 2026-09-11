import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 4,
  });

  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(Icons.menu_book_outlined,
          color: Theme.of(context).colorScheme.onSurfaceVariant, size: width * 0.4),
    );

    if (imageUrl == null) return placeholder;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl!,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) => progress == null ? child : placeholder,
        errorBuilder: (context, error, stackTrace) => placeholder,
      ),
    );
  }
}