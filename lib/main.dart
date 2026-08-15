import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'services/ad_service.dart';
import 'screens/auth/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdService().initialize();
  runApp(const UniversalTemplateApp());
}

class UniversalTemplateApp extends StatelessWidget {
  const UniversalTemplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Flutter Template',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
