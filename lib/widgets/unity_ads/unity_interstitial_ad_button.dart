import 'package:flutter/material.dart';
import '../../services/ad_service.dart';
import '../custom_button.dart';

/// Reusable button widget that triggers a Unity Interstitial Ad before executing an action.
class UnityInterstitialAdButton extends StatelessWidget {
  final String text;
  final VoidCallback onAction;
  final IconData? icon;
  final bool isOutlined;

  const UnityInterstitialAdButton({
    super.key,
    required this.text,
    required this.onAction,
    this.icon = Icons.play_circle_outline_rounded,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      icon: icon,
      isOutlined: isOutlined,
      onPressed: () {
        AdService().showInterstitial(
          onComplete: () {
            onAction();
          },
        );
      },
    );
  }
}
