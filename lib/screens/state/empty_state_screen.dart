import 'package:flutter/material.dart';
import '../../widgets/status_views.dart';

class EmptyStateScreen extends StatelessWidget {
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onAction;

  const EmptyStateScreen({
    super.key,
    this.title = 'No Items Found',
    this.description = 'There is currently no data to display here.',
    this.buttonText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empty State'),
      ),
      body: StatusView.empty(
        title: title,
        description: description,
        buttonText: buttonText,
        onAction: onAction,
      ),
    );
  }
}
