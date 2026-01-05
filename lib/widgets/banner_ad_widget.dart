import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../services/ad_service.dart';
import '../providers/providers.dart';
import '../config/theme.dart';

/// Wrapper widget for AdMob banner ads.
/// Handles ad loading, error states, and respects ad-free status.
class BannerAdWidget extends ConsumerStatefulWidget {
  final AdSize adSize;
  final EdgeInsets padding;
  final bool showPlaceholder;

  const BannerAdWidget({
    super.key,
    this.adSize = AdSize.banner,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.showPlaceholder = false,
  });

  @override
  ConsumerState<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends ConsumerState<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    final isAdFree = ref.read(isAdFreeProvider);
    if (isAdFree) return;

    _bannerAd = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      size: widget.adSize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _isLoaded = true;
              _hasError = false;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (mounted) {
            setState(() {
              _isLoaded = false;
              _hasError = true;
            });
          }
        },
        onAdOpened: (ad) {
          // Ad opened callback
        },
        onAdClosed: (ad) {
          // Ad closed callback
        },
      ),
    );

    _bannerAd?.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAdFree = ref.watch(isAdFreeProvider);

    // Don't show ads for ad-free users
    if (isAdFree) {
      return const SizedBox.shrink();
    }

    // Show placeholder or nothing while loading
    if (!_isLoaded) {
      if (widget.showPlaceholder) {
        return _buildPlaceholder();
      }
      return const SizedBox.shrink();
    }

    // Show error state placeholder
    if (_hasError) {
      return const SizedBox.shrink();
    }

    // Show the actual ad
    return Padding(
      padding: widget.padding,
      child: Container(
        alignment: Alignment.center,
        width: widget.adSize.width.toDouble(),
        height: widget.adSize.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.adSize.width.toDouble(),
        height: widget.adSize.height.toDouble(),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.border.withValues(alpha: 0.3),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textTertiary.withValues(alpha: 0.5),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Loading ad...',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textTertiary.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A sticky banner ad that stays at the bottom of the screen
class StickyBannerAd extends ConsumerWidget {
  const StickyBannerAd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdFree = ref.watch(isAdFreeProvider);

    if (isAdFree) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(
            color: AppColors.border.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: BannerAdWidget(
          adSize: AdSize.banner,
          padding: const EdgeInsets.symmetric(vertical: 4),
        ),
      ),
    );
  }
}

/// Adaptive banner that adjusts to screen width
class AdaptiveBannerAd extends ConsumerStatefulWidget {
  final EdgeInsets padding;

  const AdaptiveBannerAd({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });

  @override
  ConsumerState<AdaptiveBannerAd> createState() => _AdaptiveBannerAdState();
}

class _AdaptiveBannerAdState extends ConsumerState<AdaptiveBannerAd> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  AdSize? _adSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAdaptiveAd();
  }

  Future<void> _loadAdaptiveAd() async {
    final isAdFree = ref.read(isAdFreeProvider);
    if (isAdFree) return;

    // Get the adaptive banner size
    final screenWidth = MediaQuery.of(context).size.width.toInt();
    _adSize = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      screenWidth,
    );

    if (_adSize == null) {
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: AdService.bannerAdUnitId,
      size: _adSize!,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() => _isLoaded = true);
          }
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    await _bannerAd?.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isAdFree = ref.watch(isAdFreeProvider);

    if (isAdFree || !_isLoaded || _bannerAd == null || _adSize == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: widget.padding,
      child: Container(
        alignment: Alignment.center,
        width: _adSize!.width.toDouble(),
        height: _adSize!.height.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
    );
  }
}

/// Native ad banner with custom styling (requires native ad setup)
class NativeAdBanner extends ConsumerWidget {
  final double height;

  const NativeAdBanner({
    super.key,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdFree = ref.watch(isAdFreeProvider);

    if (isAdFree) {
      return const SizedBox.shrink();
    }

    // Placeholder for native ad
    // In production, you would use NativeAd from google_mobile_ads
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.ad_units,
              size: 24,
              color: AppColors.textTertiary,
            ),
            const SizedBox(height: 4),
            Text(
              'Sponsored',
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
