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

/// TestScreen — Developer Catalog to preview every screen & component in the template.
class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.layers_rounded, color: Colors.white, size: 22),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Template Catalog',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Tap any card to preview a screen or component.',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              title: const Text(
                'Template Catalog',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
            ),
          ),

          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                // ── 1. App Flow ──────────────────────────────────
                _SectionHeader(title: 'App Flow', icon: Icons.alt_route_rounded, color: Colors.indigo),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Full App Flow',
                    subtitle: 'Splash → Onboard → Main',
                    icon: Icons.play_circle_rounded,
                    color: Colors.indigo,
                    onTap: () => _push(context, const SplashScreen()),
                  ),
                  _NavCard(
                    title: 'Main Shell',
                    subtitle: 'Bottom nav + all tabs',
                    icon: Icons.view_quilt_rounded,
                    color: Colors.deepPurple,
                    onTap: () => _push(context, const MainWrapper()),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 2. Auth & Onboarding ──────────────────────────────────
                _SectionHeader(title: 'Auth & Onboarding', icon: Icons.lock_rounded, color: Colors.blue),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Splash Screen',
                    subtitle: 'Branding + loading',
                    icon: Icons.rocket_launch_rounded,
                    color: Colors.blue,
                    onTap: () => _push(context, const SplashScreen()),
                  ),
                  _NavCard(
                    title: 'Onboarding',
                    subtitle: 'Intro slides swipe',
                    icon: Icons.swipe_rounded,
                    color: Colors.lightBlue,
                    onTap: () => _push(context, const OnboardingScreen()),
                  ),
                  _NavCard(
                    title: 'Login',
                    subtitle: 'Email / password',
                    icon: Icons.login_rounded,
                    color: Colors.teal,
                    onTap: () => _push(context, const LoginScreen()),
                  ),
                  _NavCard(
                    title: 'Register',
                    subtitle: 'Create account form',
                    icon: Icons.person_add_rounded,
                    color: Colors.green,
                    onTap: () => _push(context, const RegisterScreen()),
                  ),
                  _NavCard(
                    title: 'Forgot Password',
                    subtitle: 'OTP / reset flow',
                    icon: Icons.lock_reset_rounded,
                    color: Colors.orange,
                    onTap: () => _push(context, const ForgotPasswordScreen()),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 3. Core Views ──────────────────────────────────
                _SectionHeader(title: 'Core Views', icon: Icons.dashboard_rounded, color: Colors.purple),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Home',
                    subtitle: 'Dashboard overview',
                    icon: Icons.home_rounded,
                    color: Colors.purple,
                    onTap: () => _push(context, const HomeScreen()),
                  ),
                  _NavCard(
                    title: 'Feed',
                    subtitle: 'List / scroll view',
                    icon: Icons.dynamic_feed_rounded,
                    color: Colors.cyan,
                    onTap: () => _push(context, const FeedScreen()),
                  ),
                  _NavCard(
                    title: 'Detail View',
                    subtitle: 'Item detail page',
                    icon: Icons.article_rounded,
                    color: Colors.amber.shade800,
                    onTap: () => _push(context, const DetailScreen(
                      title: 'Sample Item',
                      category: 'Demo Category',
                    )),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 4. Profile & Settings ──────────────────────────────────
                _SectionHeader(title: 'Profile & Settings', icon: Icons.person_rounded, color: Colors.pink),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Profile',
                    subtitle: 'User profile view',
                    icon: Icons.account_circle_rounded,
                    color: Colors.pink,
                    onTap: () => _push(context, const ProfileScreen()),
                  ),
                  _NavCard(
                    title: 'Edit Profile',
                    subtitle: 'Edit user details',
                    icon: Icons.edit_note_rounded,
                    color: Colors.pinkAccent,
                    onTap: () => _push(context, const EditProfileScreen()),
                  ),
                  _NavCard(
                    title: 'Settings',
                    subtitle: 'App preferences',
                    icon: Icons.settings_rounded,
                    color: Colors.blueGrey,
                    onTap: () => _push(context, const SettingsScreen()),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 5. Utility & Support ──────────────────────────────────
                _SectionHeader(title: 'Utility & Support', icon: Icons.build_rounded, color: Colors.teal),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Search',
                    subtitle: 'Search + filters',
                    icon: Icons.search_rounded,
                    color: Colors.teal,
                    onTap: () => _push(context, const SearchScreen()),
                  ),
                  _NavCard(
                    title: 'Notifications',
                    subtitle: 'Alerts & activity',
                    icon: Icons.notifications_rounded,
                    color: Colors.redAccent,
                    onTap: () => _push(context, const NotificationsScreen()),
                  ),
                  _NavCard(
                    title: 'Support & FAQ',
                    subtitle: 'Help center',
                    icon: Icons.support_agent_rounded,
                    color: Colors.green.shade700,
                    onTap: () => _push(context, const SupportScreen()),
                  ),
                  _NavCard(
                    title: 'Legal & Privacy',
                    subtitle: 'Terms of service',
                    icon: Icons.gavel_rounded,
                    color: Colors.brown,
                    onTap: () => _push(context, const LegalScreen()),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 6. Fallbacks & Toasts ──────────────────────────────────
                _SectionHeader(title: 'Fallbacks & Toasts', icon: Icons.warning_rounded, color: Colors.orange),
                const SizedBox(height: 10),
                _CardGrid(children: [
                  _NavCard(
                    title: 'Empty State',
                    subtitle: 'No data view',
                    icon: Icons.inbox_rounded,
                    color: Colors.orange,
                    onTap: () => _push(context, const EmptyStateScreen()),
                  ),
                  _NavCard(
                    title: 'No Internet',
                    subtitle: 'Offline error view',
                    icon: Icons.wifi_off_rounded,
                    color: Colors.deepOrange,
                    onTap: () => _push(context, const ErrorOfflineScreen(isOffline: true)),
                  ),
                  _NavCard(
                    title: 'Server Error',
                    subtitle: '500 error view',
                    icon: Icons.error_outline_rounded,
                    color: Colors.red.shade900,
                    onTap: () => _push(context, const ErrorOfflineScreen(isOffline: false)),
                  ),
                  _NavCard(
                    title: 'Toast Preview',
                    subtitle: 'Success notification',
                    icon: Icons.check_circle_rounded,
                    color: Colors.lightGreen.shade700,
                    onTap: () => AppToast.showSuccess(context, 'AppToast is working! ✅'),
                  ),
                ]),
                const SizedBox(height: 20),

                // ── 7. Unity Ads ──────────────────────────────────
                _SectionHeader(title: 'Unity Ads', icon: Icons.ad_units_rounded, color: Colors.deepPurple),
                const SizedBox(height: 10),
                const UnityBannerAdWidget(isInline: true),
                const SizedBox(height: 10),
                UnityInterstitialAdButton(
                  text: 'Show Interstitial Ad 🎬',
                  onAction: () => AppToast.showInfo(context, 'Interstitial Ad completed!'),
                ),
                const SizedBox(height: 10),
                UnityRewardedAdButton(
                  onRewardEarned: () => AppToast.showSuccess(context, 'Reward earned! +10 Coins 🎁'),
                ),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }
}

// ─── Reusable Widgets ──────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _SectionHeader({required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _CardGrid extends StatelessWidget {
  final List<Widget> children;

  const _CardGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.4,
      children: children,
    );
  }
}

class _NavCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _NavCard({
    required this.title,
    required this.subtitle,
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
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: color.withValues(alpha: 0.7),
                      fontSize: 10,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
