import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/extensions.dart';
import '../core/utils/validators.dart';
import '../services/storage_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/app_loader.dart';
import '../widgets/status_views.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;
  bool _isDark = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _loadTheme() async {
    final storage = await StorageService.getInstance();
    setState(() {
      _isDark = storage.isDarkMode;
    });
  }

  void _toggleTheme(bool value) async {
    final storage = await StorageService.getInstance();
    await storage.setDarkMode(value);
    setState(() {
      _isDark = value;
    });
    // In a production application, you should trigger a State Management update
    // (e.g. Provider, Riverpod, Bloc) to rebuild the entire MaterialApp.
    // For this boilerplate, we notify the user.
    if (mounted) {
      context.showSnackBar('Theme updated! Restart app to apply changes.');
    }
  }

  final List<String> _titles = ['Home', 'Components Demo', 'Settings'];

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const _HomeTab();
      case 1:
        return const _ComponentsTab();
      case 2:
        return _SettingsTab(
          isDark: _isDark,
          onThemeChanged: _toggleTheme,
        );
      default:
        return const _HomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
          IconButton(
            icon: Icon(_isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            onPressed: () => _toggleTheme(!_isDark),
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.widgets_outlined),
              selectedIcon: Icon(Icons.widgets_rounded),
              label: 'Components',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------
// Home Tab
// ------------------------------------
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Developer!',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to your custom Flutter Boilerplate. Explore pre-built widgets and features using the navigation bar.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 32),
          Text(
            'Boilerplate Highlights',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildHighlightCard(
            context,
            icon: Icons.flash_on_rounded,
            title: 'Ready Interceptors & API Class',
            description: 'Dio service is completely configured to auto-append auth tokens.',
          ),
          const SizedBox(height: 12),
          _buildHighlightCard(
            context,
            icon: Icons.palette_outlined,
            title: 'Light & Dark Custom Themes',
            description: 'Clean styling system matching modern mobile app design parameters.',
          ),
          const SizedBox(height: 12),
          _buildHighlightCard(
            context,
            icon: Icons.code_rounded,
            title: 'Quality Helpers & Utils',
            description: 'Regex verification and context navigation extensions included.',
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description, style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------
// Components Demo Tab
// ------------------------------------
class _ComponentsTab extends StatefulWidget {
  const _ComponentsTab();

  @override
  State<_ComponentsTab> createState() => _ComponentsTabState();
}

class _ComponentsTabState extends State<_ComponentsTab> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoadingButton = false;

  void _simulateSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoadingButton = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoadingButton = false);
          context.showSnackBar('Form validated successfully!');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Custom Input Fields',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              labelText: 'Email Address',
              hintText: 'name@example.com',
              prefixIcon: Icons.email_outlined,
              validator: Validators.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Password',
              isPassword: true,
              prefixIcon: Icons.lock_outline_rounded,
              validator: Validators.validatePassword,
            ),
            const SizedBox(height: 24),
            const Text(
              'Animated Buttons',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Save Details',
              isLoading: _isLoadingButton,
              gradient: AppColors.primaryGradient,
              onTap: _simulateSubmit,
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Pulsing Loader',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const AppLoader(size: 45),
            const SizedBox(height: 32),
            const Text(
              'Status Screen Previews',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.push(NoInternetView(onRetry: () => context.pop()));
                    },
                    child: const Text('No Internet'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.push(
                        Scaffold(
                          appBar: AppBar(title: const Text('Empty View')),
                          body: const EmptyStateView(),
                        ),
                      );
                    },
                    child: const Text('Empty State'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------
// Settings Tab
// ------------------------------------
class _SettingsTab extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const _SettingsTab({
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        SwitchListTile.adaptive(
          title: const Text('Dark Mode Settings'),
          subtitle: const Text('Toggle between app light & dark theme'),
          secondary: Icon(isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded),
          value: isDark,
          onChanged: onThemeChanged,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info_outline_rounded),
          title: const Text('Template Version'),
          trailing: const Text('v1.0.0', style: TextStyle(fontWeight: FontWeight.w500)),
          onTap: () {},
        ),
      ],
    );
  }
}
