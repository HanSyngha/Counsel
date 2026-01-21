import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import 'config/theme.dart';
import 'config/router.dart';
import 'providers/providers.dart';
import 'services/storage_service.dart';
import 'services/ad_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: '.env');

  // Initialize services
  final storageService = StorageService();
  await storageService.init();

  final adService = AdService();
  await adService.init();

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Enable edge-to-edge mode for Android 15+ compatibility
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // Set system UI overlay style with transparent bars
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  runApp(
    ProviderScope(
      overrides: [
        storageServiceProvider.overrideWithValue(storageService),
        adServiceProvider.overrideWithValue(adService),
      ],
      child: const CounselApp(),
    ),
  );
}

class CounselApp extends ConsumerStatefulWidget {
  const CounselApp({super.key});

  @override
  ConsumerState<CounselApp> createState() => _CounselAppState();
}

class _CounselAppState extends ConsumerState<CounselApp> {
  bool _localeLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_localeLoaded) {
      _localeLoaded = true;
      _loadSavedLocale();
    }
  }

  void _loadSavedLocale() {
    final storage = ref.read(storageServiceProvider);
    final savedLanguageCode = storage.getLanguageCode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (savedLanguageCode != null) {
        // Use saved locale
        ref.read(localeProvider.notifier).state = Locale(savedLanguageCode);
      } else {
        // Use device locale as default (if supported)
        final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
        final supportedCodes = ['en', 'ko', 'ja', 'zh', 'ar', 'th', 'ms', 'es', 'de', 'fr', 'hi', 'id', 'pt', 'tr', 'vi', 'ru'];

        if (supportedCodes.contains(deviceLocale.languageCode)) {
          ref.read(localeProvider.notifier).state = Locale(deviceLocale.languageCode);
        }
        // If device locale not supported, stay with default 'en'
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Counsel - 위인의 목소리',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,

      // Localization
      locale: locale,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ko'), // Korean
        Locale('ja'), // Japanese
        Locale('zh'), // Chinese
        Locale('ar'), // Arabic
        Locale('th'), // Thai
        Locale('ms'), // Malay
        Locale('es'), // Spanish
        Locale('de'), // German
        Locale('fr'), // French
        Locale('hi'), // Hindi
        Locale('id'), // Indonesian
        Locale('pt'), // Portuguese
        Locale('tr'), // Turkish
        Locale('vi'), // Vietnamese
        Locale('ru'), // Russian
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Router
      routerConfig: AppRouter.router,
    );
  }
}
