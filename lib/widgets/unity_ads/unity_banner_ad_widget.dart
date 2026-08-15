import 'dart:async';
import 'package:flutter/material.dart';
import '../../services/ad_service.dart';

/// Reusable Unity Banner Ad Widget that can be placed on any screen layout.
/// Automatically waits for AdService initialization before rendering the ad.
class UnityBannerAdWidget extends StatefulWidget {
  final double height;
  final bool isInline;

  const UnityBannerAdWidget({
    super.key,
    this.height = 50.0,
    this.isInline = false,
  });

  @override
  State<UnityBannerAdWidget> createState() => _UnityBannerAdWidgetState();
}

class _UnityBannerAdWidgetState extends State<UnityBannerAdWidget> {
  Timer? _initTimer;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _checkInitialization();
  }

  void _checkInitialization() {
    if (AdService().isInitialized) {
      _isReady = true;
      return;
    }

    // Poll every 500ms until AdService is initialized
    _initTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (AdService().isInitialized) {
        timer.cancel();
        setState(() {
          _isReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _initTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adService = AdService();

    // Premium user — show nothing
    if (adService.isPremiumUser) return const SizedBox.shrink();

    // Not ready yet — show nothing (no container, no text)
    if (!_isReady) return const SizedBox.shrink();

    // Ready — show the actual ad
    if (widget.isInline) {
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
              adService.getBannerWidget(height: widget.height),
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

    return adService.getBannerWidget(height: widget.height);
  }
}
