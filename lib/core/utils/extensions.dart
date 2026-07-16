import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  // Screen sizes
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  // Padding helper
  EdgeInsets get padding => MediaQuery.paddingOf(this);

  // Theme getters
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // SnackBar Extension
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: isError ? Colors.redAccent : theme.colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Navigation shortcuts
  void push(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => screen));
  }

  void pushReplacement(Widget screen) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(builder: (_) => screen));
  }

  void pushAndRemoveUntil(Widget screen) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
