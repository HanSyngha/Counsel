/// App constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Counsel';
  static const String appVersion = '1.0.0';

  // API
  static const String grokApiBaseUrl = 'https://api.x.ai/v1';
  static const String grokChatEndpoint = '/chat/completions';

  // Storage Keys
  static const String storageKeyOnboardingComplete = 'onboarding_complete';
  static const String storageKeyAdviceHistory = 'advice_history';
  static const String storageKeyAdviceCount = 'advice_count';
  static const String storageKeyLocale = 'locale';
  static const String storageKeyFavorites = 'favorites';

  // Ads
  static const int interstitialAdFrequency = 5; // Show ad every 5 advice requests

  // Limits
  static const int maxInputLength = 1000;
  static const int maxHistoryItems = 100;

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Persona Categories
  static const String categoryHistory = 'history';
  static const String categoryPhilosophy = 'philosophy';
  static const String categoryReligion = 'religion';
  static const String categoryLiterature = 'literature';
  static const String categoryAnime = 'anime';
}

/// Supported locales
class AppLocales {
  AppLocales._();

  static const String english = 'en';
  static const String korean = 'ko';
  static const String japanese = 'ja';
  static const String chinese = 'zh';
  static const String arabic = 'ar';
  static const String thai = 'th';
  static const String malay = 'ms';
  static const String spanish = 'es';
  static const String german = 'de';
  static const String french = 'fr';
  static const String hindi = 'hi';
  static const String indonesian = 'id';
  static const String portuguese = 'pt';
  static const String turkish = 'tr';
  static const String vietnamese = 'vi';
  static const String russian = 'ru';

  // Ordered by number of speakers (native + L2)
  static const List<String> supportedLocales = [
    english,      // ~1.5B speakers
    chinese,      // ~1.4B speakers
    hindi,        // ~600M speakers
    spanish,      // ~550M speakers
    arabic,       // ~400M speakers
    french,       // ~300M speakers
    indonesian,   // ~270M speakers
    portuguese,   // ~250M speakers
    russian,      // ~250M speakers
    japanese,     // ~130M speakers
    german,       // ~100M speakers
    korean,       // ~80M speakers
    turkish,      // ~80M speakers
    vietnamese,   // ~80M speakers
    thai,         // ~60M speakers
    malay,        // ~30M speakers
  ];

  static const Map<String, String> localeNames = {
    english: 'English',
    korean: '한국어',
    japanese: '日本語',
    chinese: '中文',
    arabic: 'العربية',
    thai: 'ไทย',
    malay: 'Bahasa Melayu',
    spanish: 'Español',
    german: 'Deutsch',
    french: 'Français',
    hindi: 'हिंदी',
    indonesian: 'Bahasa Indonesia',
    portuguese: 'Português',
    turkish: 'Türkçe',
    vietnamese: 'Tiếng Việt',
    russian: 'Русский',
  };

  static const Map<String, String> appNames = {
    english: 'Counsel',
    korean: '별들의 목소리',
    japanese: '星々の声',
    chinese: '星辰之声',
    arabic: 'صوت النجوم',
    thai: 'เสียงดวงดาว',
    malay: 'Suara Bintang',
    spanish: 'Voz de las Estrellas',
    german: 'Stimme der Sterne',
    french: 'Voix des Étoiles',
    hindi: 'सितारों की आवाज़',
    indonesian: 'Suara Bintang',
    portuguese: 'Voz das Estrelas',
    turkish: 'Yıldızların Sesi',
    vietnamese: 'Tiếng Sao',
    russian: 'Голос Звёзд',
  };
}

/// Asset paths
class AppAssets {
  AppAssets._();

  static const String personaImagesPath = 'assets/images/personas/';

  // Persona images
  static const String aristotle = '${personaImagesPath}aristotle.jpg';
  static const String buddha = '${personaImagesPath}buddha.jpg';
  static const String confucius = '${personaImagesPath}confucius.jpg';
  static const String dumbledore = '${personaImagesPath}dumbledore.jpg';
  static const String jesus = '${personaImagesPath}jesus.jpeg';
  static const String laozi = '${personaImagesPath}laozi.png';
  static const String lincoln = '${personaImagesPath}lincoln.jpg';
  static const String muhammad = '${personaImagesPath}muhammad.jpeg';
  static const String napoleon = '${personaImagesPath}napoleon.jpg';
  static const String plato = '${personaImagesPath}plato.jpg';
  static const String seneca = '${personaImagesPath}seneca.jpg';
  static const String sherlockHolmes = '${personaImagesPath}sherlock_holmes.jpg';
  static const String socrates = '${personaImagesPath}socrates.jpeg';
  static const String steveJobs = '${personaImagesPath}steve_jobs.jpg';

  // New personas
  static const String gandhi = '${personaImagesPath}gandhi.jpeg';
  static const String rumi = '${personaImagesPath}rumi.jpeg';
  static const String brahma = '${personaImagesPath}brahma.jpeg';
  static const String krishna = '${personaImagesPath}krishna.jpeg';
  static const String tolstoy = '${personaImagesPath}tolstoy.jpeg';
  static const String vishnu = '${personaImagesPath}vishnu.jpeg';

  // Anime characters
  static const String luffy = '${personaImagesPath}luffy.jpeg';
  static const String gonFreecss = '${personaImagesPath}gon_freecss.jpeg';
  static const String natsuDragneel = '${personaImagesPath}natsu_dragneel.jpeg';
  static const String izukuMidoriya = '${personaImagesPath}izuku_midoriya.jpeg';
  static const String sonGoku = '${personaImagesPath}son_goku.jpeg';
  static const String edwardElric = '${personaImagesPath}edward_elric.jpeg';
  static const String erenYeager = '${personaImagesPath}eren_yeager.jpeg';
  static const String narutoUzumaki = '${personaImagesPath}naruto_uzumaki.jpeg';
  static const String tsunayoshiSawada = '${personaImagesPath}tsunayoshi_sawada.jpeg';
  static const String tanjiroKamado = '${personaImagesPath}tanjiro_kamado.jpeg';
  static const String ichigoKurosaki = '${personaImagesPath}ichigo_kurosaki.png';

  // Historical figures
  static const String martinLutherKing = '${personaImagesPath}martin_luther_king.jpeg';
  static const String albertEinstein = '${personaImagesPath}albert_einstein.jpg';
  static const String juliusCaesar = '${personaImagesPath}julius_caesar.jpg';
  static const String liuBei = '${personaImagesPath}liu_bei.jpeg';
  static const String zhugeLiang = '${personaImagesPath}zhuge_liang.jpeg';
  static const String caoCao = '${personaImagesPath}cao_cao.jpeg';

  // Religious figures
  static const String david = '${personaImagesPath}david.jpeg';

  // Literature characters
  static const String aslan = '${personaImagesPath}aslan.jpg';
  static const String jeanValjean = '${personaImagesPath}jean_valjean.jpeg';
}
