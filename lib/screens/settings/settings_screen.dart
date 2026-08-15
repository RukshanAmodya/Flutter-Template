import 'package:flutter/material.dart';
import '../../core/utils/app_toast.dart';
import '../support/support_screen.dart';
import '../support/legal_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _pushNotifications = true;
  bool _biometricAuth = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings & Preferences'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const _SettingsSectionHeader(title: 'App Theme & Display'),
          SwitchListTile(
            title: const Text('Dark Mode Theme'),
            subtitle: const Text('Switch between light and dark UI themes'),
            secondary: const Icon(Icons.dark_mode_outlined),
            value: _isDarkMode,
            onChanged: (val) {
              setState(() => _isDarkMode = val);
              AppToast.showInfo(
                context,
                val ? 'Dark Mode Enabled' : 'Light Mode Enabled',
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language_rounded),
            title: const Text('App Language'),
            subtitle: Text(_selectedLanguage),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              _showLanguageDialog();
            },
          ),
          const Divider(height: 32),
          const _SettingsSectionHeader(title: 'Notifications & Alerts'),
          SwitchListTile(
            title: const Text('Push Notifications'),
            subtitle: const Text('Receive instant alerts and activity updates'),
            secondary: const Icon(Icons.notifications_active_outlined),
            value: _pushNotifications,
            onChanged: (val) {
              setState(() => _pushNotifications = val);
              AppToast.showInfo(context, 'Notification settings updated');
            },
          ),
          const Divider(height: 32),
          const _SettingsSectionHeader(title: 'Security & Privacy'),
          SwitchListTile(
            title: const Text('Biometric Lock / FaceID'),
            subtitle: const Text('Require fingerprint or face recognition on open'),
            secondary: const Icon(Icons.fingerprint_rounded),
            value: _biometricAuth,
            onChanged: (val) {
              setState(() => _biometricAuth = val);
              AppToast.showInfo(context, 'Biometric preference updated');
            },
          ),
          const Divider(height: 32),
          const _SettingsSectionHeader(title: 'Help & Information'),
          ListTile(
            leading: const Icon(Icons.help_outline_rounded),
            title: const Text('Help Center & FAQs'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SupportScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel_outlined),
            title: const Text('Legal & Privacy Policy'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LegalScreen()),
              );
            },
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'App Template Version 1.0.0 (Build +1)',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select Language'),
          children: ['English', 'Sinhala (සිංහල)', 'Spanish (Español)', 'French (Français)']
              .map(
                (lang) => SimpleDialogOption(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(lang),
                  ),
                  onPressed: () {
                    setState(() => _selectedLanguage = lang);
                    Navigator.of(context).pop();
                    AppToast.showSuccess(context, 'Language set to $lang');
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _SettingsSectionHeader extends StatelessWidget {
  final String title;
  const _SettingsSectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
