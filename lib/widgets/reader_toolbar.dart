import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReaderToolbar extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onToggleSidebar;
  final VoidCallback? onPreviousPage;
  final VoidCallback? onNextPage;
  final String title;
  final int currentPage;
  final int totalPages;

  const ReaderToolbar({
    super.key,
    required this.onMenuPressed,
    required this.onToggleSidebar,
    this.onPreviousPage,
    this.onNextPage,
    this.title = 'PDF Reader',
    this.currentPage = 1,
    this.totalPages = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top row: Menu and Title
          Row(
            children: [
              IconButton(
                onPressed: onToggleSidebar,
                icon: const Icon(Icons.menu),
                tooltip: 'Toggle Sidebar',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: onMenuPressed,
                icon: const Icon(Icons.more_vert),
                tooltip: 'More options',
              ),
            ],
          ),
          const Divider(height: 8, thickness: 1),
          // Bottom row: Navigation controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: currentPage > 1 ? onPreviousPage : null,
                icon: const Icon(Icons.chevron_left),
                tooltip: 'Previous page',
              ),
              Text(
                'Page $currentPage of $totalPages',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  color: AppTheme.darkText,
                ),
              ),
              IconButton(
                onPressed: currentPage < totalPages ? onNextPage : null,
                icon: const Icon(Icons.chevron_right),
                tooltip: 'Next page',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
