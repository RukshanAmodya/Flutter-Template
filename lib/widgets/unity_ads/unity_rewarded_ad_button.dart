import 'package:flutter/material.dart';
import '../../services/ad_service.dart';
import '../../core/utils/app_toast.dart';
import '../custom_button.dart';

/// Reusable button widget that triggers a Unity Rewarded Video Ad.
class UnityRewardedAdButton extends StatelessWidget {
  final String text;
  final VoidCallback onRewardEarned;
  final IconData? icon;

  const UnityRewardedAdButton({
    super.key,
    this.text = 'Watch Ad for Reward 🎁',
    required this.onRewardEarned,
    this.icon = Icons.card_giftcard_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      icon: icon,
      backgroundColor: Colors.amber.shade800,
      onPressed: () {
        final adService = AdService();
        if (!adService.isRewardedReady()) {
          AppToast.showWarning(
            context,
            'Rewarded Ad is preparing or on cooldown. Please try again shortly.',
          );
          adService.loadRewarded();
          return;
        }

        adService.showRewarded(
          onRewardEarned: () {
            AppToast.showSuccess(context, 'Reward earned successfully! 🎁');
            onRewardEarned();
          },
          onSkipped: () {
            AppToast.showWarning(context, 'Ad skipped — No reward was earned.');
          },
          onFailed: () {
            AppToast.showError(context, 'Unable to play rewarded ad.');
          },
        );
      },
    );
  }
}
