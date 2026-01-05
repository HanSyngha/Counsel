import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';

/// AdMob service for banner and interstitial ads
class AdService {
  // Test Ad Unit IDs (replace with real IDs before production)
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111'; // Test ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // Test ID
    }
    throw UnsupportedError('Unsupported platform');
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712'; // Test ID
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // Test ID
    }
    throw UnsupportedError('Unsupported platform');
  }

  static const String _adviceCountKey = 'advice_count';

  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;
  int _adviceCount = 0;
  static const int _showAdEveryNAdvice = 5; // Show ad every 5 advice requests
  late Box _settingsBox;

  bool _isAdFree = false;

  /// Initialize AdMob
  Future<void> init() async {
    await MobileAds.instance.initialize();
    _settingsBox = await Hive.openBox('settings');
    _adviceCount = _settingsBox.get(_adviceCountKey, defaultValue: 0);
    await _loadInterstitialAd();
  }

  /// Set ad-free status
  void setAdFree(bool value) {
    _isAdFree = value;
  }

  /// Create a banner ad
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          // Ad loaded successfully
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
  }

  /// Load interstitial ad
  Future<void> _loadInterstitialAd() async {
    if (_isAdFree) return;

    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdReady = true;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _isInterstitialAdReady = false;
              _loadInterstitialAd(); // Preload next ad
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _isInterstitialAdReady = false;
              _loadInterstitialAd();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  /// Called when user receives advice
  /// Returns true if an interstitial ad was shown
  Future<bool> onAdviceReceived() async {
    if (_isAdFree) return false;

    _adviceCount++;
    await _settingsBox.put(_adviceCountKey, _adviceCount);

    if (_adviceCount >= _showAdEveryNAdvice && _isInterstitialAdReady) {
      _adviceCount = 0;
      await _settingsBox.put(_adviceCountKey, 0);
      await _interstitialAd?.show();
      return true;
    }

    return false;
  }

  /// Dispose resources
  void dispose() {
    _interstitialAd?.dispose();
  }
}
