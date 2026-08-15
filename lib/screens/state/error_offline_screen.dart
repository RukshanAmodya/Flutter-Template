import 'package:flutter/material.dart';
import '../../widgets/status_views.dart';

class ErrorOfflineScreen extends StatelessWidget {
  final bool isOffline;
  final VoidCallback? onRetry;

  const ErrorOfflineScreen({
    super.key,
    this.isOffline = true,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isOffline ? 'No Internet' : 'Server Error'),
      ),
      body: isOffline
          ? StatusView.offline(onRetry: onRetry)
          : StatusView.error(
              description: 'We encountered an unexpected server error. Please try again later.',
              onRetry: onRetry,
            ),
    );
  }
}
