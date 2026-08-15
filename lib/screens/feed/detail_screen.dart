import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../core/utils/app_toast.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String category;

  const DetailScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              AppToast.showInfo(context, 'Share link copied to clipboard!');
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border_rounded),
            onPressed: () {
              AppToast.showSuccess(context, 'Item saved to bookmarks');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Banner
            Container(
              height: 200,
              width: double.infinity,
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Center(
                child: Icon(
                  Icons.image_rounded,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(category),
                    backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
                    labelStyle: TextStyle(color: theme.colorScheme.primary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Full Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This detail screen is designed as a reusable template view. It presents complete information, tags, full description body, metadata properties, and bottom call-to-action triggers such as Edit, Delete, or Buy.',
                    style: TextStyle(
                      height: 1.5,
                      color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DetailMetaItem(title: 'Created Date', value: 'Aug 15, 2026'),
                      _DetailMetaItem(title: 'Status', value: 'Active'),
                      _DetailMetaItem(title: 'Author', value: 'Admin'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Edit Item',
                  isOutlined: true,
                  icon: Icons.edit_outlined,
                  onPressed: () {
                    AppToast.showInfo(context, 'Edit action triggered');
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  text: 'Buy / Action',
                  icon: Icons.shopping_bag_outlined,
                  onPressed: () {
                    AppToast.showSuccess(context, 'Action completed!');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailMetaItem extends StatelessWidget {
  final String title;
  final String value;

  const _DetailMetaItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
