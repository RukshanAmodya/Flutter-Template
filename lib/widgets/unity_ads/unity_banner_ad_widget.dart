import 'package:flutter/material.dart';
import '../../services/ad_service.dart';

/// Reusable Unity Banner Ad Widget that can be placed on any screen layout.
class UnityBannerAdWidget extends StatelessWidget {
  final double height;
  final bool isInline;

  const UnityBannerAdWidget({
    super.key,
    this.height = 50.0,
    this.isInline = false,
  });

  @override
  Widget build(BuildContext context) {
    final adService = AdService();

    if (adService.isPremiumUser) {
      return const SizedBox.shrink();
    }

    if (isInline) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              adService.getBannerWidget(height: height),
              const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Sponsored',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return adService.getBannerWidget(height: height);
  }
}
