import 'package:flutter/material.dart';
import '../core/utils/app_toast.dart';
import 'main_wrapper.dart';
import 'auth/splash_screen.dart';
import 'auth/onboarding_screen.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';
import 'auth/forgot_password_screen.dart';
import 'home/home_screen.dart';
import 'feed/feed_screen.dart';
import 'feed/detail_screen.dart';
import 'profile/profile_screen.dart';
import 'profile/edit_profile_screen.dart';
import 'settings/settings_screen.dart';
import 'utility/search_screen.dart';
import 'utility/notifications_screen.dart';
import 'support/support_screen.dart';
import 'support/legal_screen.dart';
import 'state/empty_state_screen.dart';
import 'state/error_offline_screen.dart';
import '../widgets/unity_ads/unity_banner_ad_widget.dart';
import '../widgets/unity_ads/unity_interstitial_ad_button.dart';
import '../widgets/unity_ads/unity_rewarded_ad_button.dart';

/// TestScreen — Catalog Hub to test and navigate to EVERY screen and component in the template.
class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Test Hub 🧪'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Banner Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.tertiaryContainer,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🚀 Flutter Template Master Hub',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap any card below to test and inspect the screen or component.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // --- 1. AUTHENTICATION & ONBOARDING ---
          const _CategoryHeader(title: '1. Auth & Onboarding Flow 🔑'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: [
              _TestCard(
                title: 'Splash Screen',
                icon: Icons.rocket_launch_rounded,
                color: Colors.indigo,
                onTap: () => _push(context, const SplashScreen()),
              ),
              _TestCard(
                title: 'Onboarding Slides',
                icon: Icons.swipe_rounded,
                color: Colors.blue,
                onTap: () => _push(context, const OnboardingScreen()),
              ),
              _TestCard(
                title: 'Login Screen',
                icon: Icons.login_rounded,
                color: Colors.teal,
                onTap: () => _push(context, const LoginScreen()),
              ),
              _TestCard(
                title: 'Register Screen',
                icon: Icons.person_add_rounded,
                color: Colors.green,
                onTap: () => _push(context, const RegisterScreen()),
              ),
              _TestCard(
                title: 'Forgot Password',
                icon: Icons.lock_reset_rounded,
                color: Colors.orange,
                onTap: () => _push(context, const ForgotPasswordScreen()),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- 2. CORE VIEWS & NAVIGATION ---
          const _CategoryHeader(title: '2. Core Navigation & Views 🧭'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: [
              _TestCard(
                title: 'Main Shell (Nav)',
                icon: Icons.view_headline_rounded,
                color: Colors.deepPurple,
                onTap: () => _push(context, const MainWrapper()),
              ),
              _TestCard(
                title: 'Home Dashboard',
                icon: Icons.dashboard_rounded,
                color: Colors.blueAccent,
                onTap: () => _push(context, const HomeScreen()),
              ),
              _TestCard(
                title: 'Feed List View',
                icon: Icons.dynamic_feed_rounded,
                color: Colors.cyan,
                onTap: () => _push(context, const FeedScreen()),
              ),
              _TestCard(
                title: 'Item Detail View',
                icon: Icons.article_rounded,
                color: Colors.amber.shade900,
                onTap: () => _push(
                  context,
                  const DetailScreen(
                    title: 'Test Template Item',
                    category: 'Demo Category',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- 3. PROFILE & SETTINGS ---
          const _CategoryHeader(title: '3. Profile & Settings 👤'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: [
              _TestCard(
                title: 'Profile Screen',
                icon: Icons.account_circle_rounded,
                color: Colors.purple,
                onTap: () => _push(context, const ProfileScreen()),
              ),
              _TestCard(
                title: 'Edit Profile',
                icon: Icons.edit_note_rounded,
                color: Colors.pink,
                onTap: () => _push(context, const EditProfileScreen()),
              ),
              _TestCard(
                title: 'Settings Screen',
                icon: Icons.settings_applications_rounded,
                color: Colors.grey.shade800,
                onTap: () => _push(context, const SettingsScreen()),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- 4. UTILITY & SUPPORT ---
          const _CategoryHeader(title: '4. Utility & Support 🛠️'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: [
              _TestCard(
                title: 'Search & Filters',
                icon: Icons.search_rounded,
                color: Colors.indigoAccent,
                onTap: () => _push(context, const SearchScreen()),
              ),
              _TestCard(
                title: 'Notifications',
                icon: Icons.notifications_active_rounded,
                color: Colors.redAccent,
                onTap: () => _push(context, const NotificationsScreen()),
              ),
              _TestCard(
                title: 'Support & FAQ',
                icon: Icons.support_agent_rounded,
                color: Colors.teal.shade700,
                onTap: () => _push(context, const SupportScreen()),
              ),
              _TestCard(
                title: 'Legal & Privacy',
                icon: Icons.gavel_rounded,
                color: Colors.brown,
                onTap: () => _push(context, const LegalScreen()),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- 5. SYSTEM FALLBACKS & TOASTS ---
          const _CategoryHeader(title: '5. Fallbacks & Toast Banners ⚠️'),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: [
              _TestCard(
                title: 'Empty State View',
                icon: Icons.inbox_rounded,
                color: Colors.orange.shade800,
                onTap: () => _push(context, const EmptyStateScreen()),
              ),
              _TestCard(
                title: 'No Internet View',
                icon: Icons.wifi_off_rounded,
                color: Colors.deepOrange,
                onTap: () => _push(
                  context,
                  const ErrorOfflineScreen(isOffline: true),
                ),
              ),
              _TestCard(
                title: 'Server Error View',
                icon: Icons.error_outline_rounded,
                color: Colors.red.shade900,
                onTap: () => _push(
                  context,
                  const ErrorOfflineScreen(isOffline: false),
                ),
              ),
              _TestCard(
                title: 'Test Toast Alert',
                icon: Icons.chat_rounded,
                color: Colors.lightBlue.shade800,
                onTap: () => AppToast.showSuccess(
                  context,
                  'AppToast utility is working perfectly!',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // --- 6. UNITY ADS TESTING ---
          const _CategoryHeader(title: '6. Unity Ads Components 🎮'),
          const UnityBannerAdWidget(isInline: true),
          const SizedBox(height: 10),
          UnityInterstitialAdButton(
            text: 'Test Interstitial Ad 🎬',
            onAction: () {
              AppToast.showInfo(context, 'Interstitial Ad completed!');
            },
          ),
          const SizedBox(height: 10),
          UnityRewardedAdButton(
            onRewardEarned: () {
              AppToast.showSuccess(context, 'Rewarded Ad completed! +10 Coins');
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget targetScreen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => targetScreen),
    );
  }
}

class _CategoryHeader extends StatelessWidget {
  final String title;
  const _CategoryHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _TestCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
