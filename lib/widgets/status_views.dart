import 'package:flutter/material.dart';
import 'custom_button.dart';

/// Reusable status views for Empty, Error, and Offline states.
class StatusView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String? buttonText;
  final VoidCallback? onRetry;
  final Color? iconColor;

  const StatusView({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.buttonText,
    this.onRetry,
    this.iconColor,
  });

  factory StatusView.empty({
    required String title,
    required String description,
    String? buttonText,
    VoidCallback? onAction,
  }) {
    return StatusView(
      icon: Icons.inbox_outlined,
      title: title,
      description: description,
      buttonText: buttonText,
      onRetry: onAction,
    );
  }

  factory StatusView.error({
    String title = 'Something went wrong',
    required String description,
    VoidCallback? onRetry,
  }) {
    return StatusView(
      icon: Icons.error_outline_rounded,
      title: title,
      description: description,
      buttonText: 'Try Again',
      onRetry: onRetry,
      iconColor: Colors.redAccent,
    );
  }

  factory StatusView.offline({
    VoidCallback? onRetry,
  }) {
    return StatusView(
      icon: Icons.wifi_off_rounded,
      title: 'No Internet Connection',
      description: 'Please check your connection and try again.',
      buttonText: 'Retry Connection',
      onRetry: onRetry,
      iconColor: Colors.orangeAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: (iconColor ?? theme.colorScheme.primary).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 56,
                color: iconColor ?? theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            if (buttonText != null && onRetry != null) ...[
              const SizedBox(height: 24),
              SizedBox(
                width: 200,
                child: CustomButton(
                  text: buttonText!,
                  onPressed: onRetry,
                  height: 44,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
