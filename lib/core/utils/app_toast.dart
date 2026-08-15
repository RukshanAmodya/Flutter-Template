import 'package:flutter/material.dart';

enum ToastType { success, error, info, warning }

/// Helper class to display customizable Toast / SnackBar notifications across the app.
class AppToast {
  static void show(
    BuildContext context, {
    required String message,
    ToastType type = ToastType.info,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = Theme.of(context);
    final colorScheme = _getToastColors(type, theme);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.all(16),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: colorScheme.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: colorScheme.borderColor, width: 1),
          ),
          child: Row(
            children: [
              Icon(colorScheme.icon, color: colorScheme.iconColor, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null) ...[
                      Text(
                        title,
                        style: TextStyle(
                          color: colorScheme.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                    Text(
                      message,
                      style: TextStyle(
                        color: colorScheme.textColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.success, title: title ?? 'Success');
  }

  static void showError(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.error, title: title ?? 'Error');
  }

  static void showInfo(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.info, title: title ?? 'Info');
  }

  static void showWarning(BuildContext context, String message, {String? title}) {
    show(context, message: message, type: ToastType.warning, title: title ?? 'Warning');
  }

  static _ToastColorScheme _getToastColors(ToastType type, ThemeData theme) {
    switch (type) {
      case ToastType.success:
        return _ToastColorScheme(
          backgroundColor: const Color(0xFFE8F5E9),
          borderColor: const Color(0xFFA5D6A7),
          iconColor: const Color(0xFF2E7D32),
          textColor: const Color(0xFF1B5E20),
          icon: Icons.check_circle_rounded,
        );
      case ToastType.error:
        return _ToastColorScheme(
          backgroundColor: const Color(0xFFFFEBEE),
          borderColor: const Color(0xFFEF9A9A),
          iconColor: const Color(0xFFC62828),
          textColor: const Color(0xFFB71C1C),
          icon: Icons.error_rounded,
        );
      case ToastType.warning:
        return _ToastColorScheme(
          backgroundColor: const Color(0xFFFFF8E1),
          borderColor: const Color(0xFFFFE082),
          iconColor: const Color(0xFFF57F17),
          textColor: const Color(0xFFE65100),
          icon: Icons.warning_rounded,
        );
      case ToastType.info:
        return _ToastColorScheme(
          backgroundColor: const Color(0xFFE3F2FD),
          borderColor: const Color(0xFF90CAF9),
          iconColor: const Color(0xFF1565C0),
          textColor: const Color(0xFF0D47A1),
          icon: Icons.info_rounded,
        );
    }
  }
}

class _ToastColorScheme {
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;

  _ToastColorScheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
  });
}
