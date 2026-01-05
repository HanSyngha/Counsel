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

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
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
  @override
  void initState() {
    super.initState();
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    final storage = ref.read(storageServiceProvider);
    final savedLanguageCode = storage.getLanguageCode();
    if (savedLanguageCode != null) {
      ref.read(localeProvider.notifier).state = Locale(savedLanguageCode);
    }
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
