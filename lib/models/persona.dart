import 'package:counsel/config/constants.dart';

/// Category enum for personas
enum PersonaCategory {
  history,
  philosophy,
  religion,
  literature,
  anime,
}

extension PersonaCategoryExtension on PersonaCategory {
  String get id {
    switch (this) {
      case PersonaCategory.history:
        return AppConstants.categoryHistory;
      case PersonaCategory.philosophy:
        return AppConstants.categoryPhilosophy;
      case PersonaCategory.religion:
        return AppConstants.categoryReligion;
      case PersonaCategory.literature:
        return AppConstants.categoryLiterature;
      case PersonaCategory.anime:
        return AppConstants.categoryAnime;
    }
  }

  String get nameKey {
    switch (this) {
      case PersonaCategory.history:
        return 'category_history';
      case PersonaCategory.philosophy:
        return 'category_philosophy';
      case PersonaCategory.religion:
        return 'category_religion';
      case PersonaCategory.literature:
        return 'category_literature';
      case PersonaCategory.anime:
        return 'category_anime';
    }
  }
}

/// Persona model representing a historical/fictional figure
class Persona {
  final String id;
  final String nameKey;
  final String titleKey;
  final String quoteKey;
  final PersonaCategory category;
  final String imagePath;
  final int era; // Year (negative for BC)
  final String? sourceTag; // Source reference for expanded personas (e.g., "[New Testament]", "[Harry Potter]")

  const Persona({
    required this.id,
    required this.nameKey,
    required this.titleKey,
    required this.quoteKey,
    required this.category,
    required this.imagePath,
    this.era = 0,
    this.sourceTag,
  });

  /// Get era display string
  String get eraDisplay {
    if (era == 0) return '';
    if (era < 0) return '${-era} BC';
    return '$era AD';
  }
}

/// All available personas
class PersonaData {
  PersonaData._();

  static const List<Persona> all = [
    // Philosophy
    socrates,
    plato,
    aristotle,
    seneca,
    confucius,
    laozi,
    rumi,
    // Religion
    jesus,
    buddha,
    muhammad,
    krishna,
    brahma,
    vishnu,
    david,
    // History
    lincoln,
    napoleon,
    steveJobs,
    gandhi,
    martinLutherKing,
    albertEinstein,
    juliusCaesar,
    liuBei,
    zhugeLiang,
    caoCao,
    // Literature
    sherlockHolmes,
    dumbledore,
    tolstoy,
    aslan,
    jeanValjean,
    // Anime
    luffy,
    gonFreecss,
    natsuDragneel,
    izukuMidoriya,
    sonGoku,
    edwardElric,
    erenYeager,
    narutoUzumaki,
    tsunayoshiSawada,
    tanjiroKamado,
    ichigoKurosaki,
  ];

  static List<Persona> byCategory(PersonaCategory category) =>
      all.where((p) => p.category == category).toList();

  // Philosophy
  static const Persona socrates = Persona(
    id: 'socrates',
    nameKey: 'persona_socrates',
    titleKey: 'persona_socrates_title',
    quoteKey: 'persona_socrates_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.socrates,
    era: -399,
    sourceTag: '[Plato, Xenophon]',
  );

  static const Persona plato = Persona(
    id: 'plato',
    nameKey: 'persona_plato',
    titleKey: 'persona_plato_title',
    quoteKey: 'persona_plato_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.plato,
    era: -348,
  );

  static const Persona aristotle = Persona(
    id: 'aristotle',
    nameKey: 'persona_aristotle',
    titleKey: 'persona_aristotle_title',
    quoteKey: 'persona_aristotle_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.aristotle,
    era: -322,
  );

  static const Persona seneca = Persona(
    id: 'seneca',
    nameKey: 'persona_seneca',
    titleKey: 'persona_seneca_title',
    quoteKey: 'persona_seneca_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.seneca,
    era: 65,
  );

  static const Persona confucius = Persona(
    id: 'confucius',
    nameKey: 'persona_confucius',
    titleKey: 'persona_confucius_title',
    quoteKey: 'persona_confucius_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.confucius,
    era: -479,
    sourceTag: '[Analects]',
  );

  static const Persona laozi = Persona(
    id: 'laozi',
    nameKey: 'persona_laozi',
    titleKey: 'persona_laozi_title',
    quoteKey: 'persona_laozi_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.laozi,
    era: -500,
  );

  static const Persona rumi = Persona(
    id: 'rumi',
    nameKey: 'persona_rumi',
    titleKey: 'persona_rumi_title',
    quoteKey: 'persona_rumi_quote',
    category: PersonaCategory.philosophy,
    imagePath: AppAssets.rumi,
    era: 1273,
  );

  // Religion
  static const Persona jesus = Persona(
    id: 'jesus',
    nameKey: 'persona_jesus',
    titleKey: 'persona_jesus_title',
    quoteKey: 'persona_jesus_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.jesus,
    era: 33,
    sourceTag: '[New Testament]',
  );

  static const Persona buddha = Persona(
    id: 'buddha',
    nameKey: 'persona_buddha',
    titleKey: 'persona_buddha_title',
    quoteKey: 'persona_buddha_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.buddha,
    era: -483,
    sourceTag: '[Buddhist Sutras]',
  );

  static const Persona muhammad = Persona(
    id: 'muhammad',
    nameKey: 'persona_muhammad',
    titleKey: 'persona_muhammad_title',
    quoteKey: 'persona_muhammad_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.muhammad,
    era: 632,
    sourceTag: '[Quran, Hadith]',
  );

  static const Persona krishna = Persona(
    id: 'krishna',
    nameKey: 'persona_krishna',
    titleKey: 'persona_krishna_title',
    quoteKey: 'persona_krishna_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.krishna,
    era: -3000,
  );

  static const Persona brahma = Persona(
    id: 'brahma',
    nameKey: 'persona_brahma',
    titleKey: 'persona_brahma_title',
    quoteKey: 'persona_brahma_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.brahma,
    era: 0,
  );

  static const Persona vishnu = Persona(
    id: 'vishnu',
    nameKey: 'persona_vishnu',
    titleKey: 'persona_vishnu_title',
    quoteKey: 'persona_vishnu_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.vishnu,
    era: 0,
  );

  static const Persona david = Persona(
    id: 'david',
    nameKey: 'persona_david',
    titleKey: 'persona_david_title',
    quoteKey: 'persona_david_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.david,
    era: -970,
    sourceTag: '[Old Testament]',
  );

  // History
  static const Persona lincoln = Persona(
    id: 'lincoln',
    nameKey: 'persona_lincoln',
    titleKey: 'persona_lincoln_title',
    quoteKey: 'persona_lincoln_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.lincoln,
    era: 1865,
  );

  static const Persona napoleon = Persona(
    id: 'napoleon',
    nameKey: 'persona_napoleon',
    titleKey: 'persona_napoleon_title',
    quoteKey: 'persona_napoleon_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.napoleon,
    era: 1821,
  );

  static const Persona steveJobs = Persona(
    id: 'steve_jobs',
    nameKey: 'persona_steve_jobs',
    titleKey: 'persona_steve_jobs_title',
    quoteKey: 'persona_steve_jobs_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.steveJobs,
    era: 2011,
  );

  static const Persona gandhi = Persona(
    id: 'gandhi',
    nameKey: 'persona_gandhi',
    titleKey: 'persona_gandhi_title',
    quoteKey: 'persona_gandhi_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.gandhi,
    era: 1948,
  );

  static const Persona martinLutherKing = Persona(
    id: 'martin_luther_king',
    nameKey: 'persona_martin_luther_king',
    titleKey: 'persona_martin_luther_king_title',
    quoteKey: 'persona_martin_luther_king_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.martinLutherKing,
    era: 1968,
  );

  static const Persona albertEinstein = Persona(
    id: 'albert_einstein',
    nameKey: 'persona_albert_einstein',
    titleKey: 'persona_albert_einstein_title',
    quoteKey: 'persona_albert_einstein_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.albertEinstein,
    era: 1955,
    sourceTag: '[Scientific Papers, Letters]',
  );

  static const Persona juliusCaesar = Persona(
    id: 'julius_caesar',
    nameKey: 'persona_julius_caesar',
    titleKey: 'persona_julius_caesar_title',
    quoteKey: 'persona_julius_caesar_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.juliusCaesar,
    era: -44,
    sourceTag: '[De Bello Gallico, De Bello Civili, Suetonius, Plutarch, Cicero]',
  );

  static const Persona liuBei = Persona(
    id: 'liu_bei',
    nameKey: 'persona_liu_bei',
    titleKey: 'persona_liu_bei_title',
    quoteKey: 'persona_liu_bei_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.liuBei,
    era: 223,
    sourceTag: '[Romance of the Three Kingdoms]',
  );

  static const Persona zhugeLiang = Persona(
    id: 'zhuge_liang',
    nameKey: 'persona_zhuge_liang',
    titleKey: 'persona_zhuge_liang_title',
    quoteKey: 'persona_zhuge_liang_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.zhugeLiang,
    era: 234,
    sourceTag: '[Romance of the Three Kingdoms]',
  );

  static const Persona caoCao = Persona(
    id: 'cao_cao',
    nameKey: 'persona_cao_cao',
    titleKey: 'persona_cao_cao_title',
    quoteKey: 'persona_cao_cao_quote',
    category: PersonaCategory.history,
    imagePath: AppAssets.caoCao,
    era: 220,
    sourceTag: '[Romance of the Three Kingdoms]',
  );

  // Literature
  static const Persona sherlockHolmes = Persona(
    id: 'sherlock_holmes',
    nameKey: 'persona_sherlock_holmes',
    titleKey: 'persona_sherlock_holmes_title',
    quoteKey: 'persona_sherlock_holmes_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.sherlockHolmes,
    era: 1890,
    sourceTag: '[Conan Doyle]',
  );

  static const Persona dumbledore = Persona(
    id: 'dumbledore',
    nameKey: 'persona_dumbledore',
    titleKey: 'persona_dumbledore_title',
    quoteKey: 'persona_dumbledore_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.dumbledore,
    era: 1997,
    sourceTag: '[Harry Potter]',
  );

  static const Persona tolstoy = Persona(
    id: 'tolstoy',
    nameKey: 'persona_tolstoy',
    titleKey: 'persona_tolstoy_title',
    quoteKey: 'persona_tolstoy_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.tolstoy,
    era: 1910,
  );

  static const Persona aslan = Persona(
    id: 'aslan',
    nameKey: 'persona_aslan',
    titleKey: 'persona_aslan_title',
    quoteKey: 'persona_aslan_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.aslan,
    era: 1950, // The Chronicles of Narnia first published
    sourceTag: '[The Chronicles of Narnia]',
  );

  static const Persona jeanValjean = Persona(
    id: 'jean_valjean',
    nameKey: 'persona_jean_valjean',
    titleKey: 'persona_jean_valjean_title',
    quoteKey: 'persona_jean_valjean_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.jeanValjean,
    era: 1862, // Les Misérables published
    sourceTag: '[Les Misérables]',
  );

  // Anime
  static const Persona luffy = Persona(
    id: 'luffy',
    nameKey: 'persona_luffy',
    titleKey: 'persona_luffy_title',
    quoteKey: 'persona_luffy_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.luffy,
    era: 1997, // One Piece manga started
    sourceTag: '[One Piece]',
  );

  static const Persona gonFreecss = Persona(
    id: 'gon_freecss',
    nameKey: 'persona_gon_freecss',
    titleKey: 'persona_gon_freecss_title',
    quoteKey: 'persona_gon_freecss_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.gonFreecss,
    era: 1998, // Hunter x Hunter manga started
    sourceTag: '[Hunter x Hunter]',
  );

  static const Persona natsuDragneel = Persona(
    id: 'natsu_dragneel',
    nameKey: 'persona_natsu_dragneel',
    titleKey: 'persona_natsu_dragneel_title',
    quoteKey: 'persona_natsu_dragneel_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.natsuDragneel,
    era: 2006, // Fairy Tail manga started
    sourceTag: '[Fairy Tail]',
  );

  static const Persona izukuMidoriya = Persona(
    id: 'izuku_midoriya',
    nameKey: 'persona_izuku_midoriya',
    titleKey: 'persona_izuku_midoriya_title',
    quoteKey: 'persona_izuku_midoriya_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.izukuMidoriya,
    era: 2014, // My Hero Academia manga started
    sourceTag: '[My Hero Academia]',
  );

  static const Persona sonGoku = Persona(
    id: 'son_goku',
    nameKey: 'persona_son_goku',
    titleKey: 'persona_son_goku_title',
    quoteKey: 'persona_son_goku_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.sonGoku,
    era: 1984, // Dragon Ball manga started
    sourceTag: '[Dragon Ball]',
  );

  static const Persona edwardElric = Persona(
    id: 'edward_elric',
    nameKey: 'persona_edward_elric',
    titleKey: 'persona_edward_elric_title',
    quoteKey: 'persona_edward_elric_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.edwardElric,
    era: 2001, // Fullmetal Alchemist manga started
    sourceTag: '[Fullmetal Alchemist]',
  );

  static const Persona erenYeager = Persona(
    id: 'eren_yeager',
    nameKey: 'persona_eren_yeager',
    titleKey: 'persona_eren_yeager_title',
    quoteKey: 'persona_eren_yeager_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.erenYeager,
    era: 2009, // Attack on Titan manga started
    sourceTag: '[Attack on Titan]',
  );

  static const Persona narutoUzumaki = Persona(
    id: 'naruto_uzumaki',
    nameKey: 'persona_naruto_uzumaki',
    titleKey: 'persona_naruto_uzumaki_title',
    quoteKey: 'persona_naruto_uzumaki_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.narutoUzumaki,
    era: 1999, // Naruto manga started
    sourceTag: '[Naruto]',
  );

  static const Persona tsunayoshiSawada = Persona(
    id: 'tsunayoshi_sawada',
    nameKey: 'persona_tsunayoshi_sawada',
    titleKey: 'persona_tsunayoshi_sawada_title',
    quoteKey: 'persona_tsunayoshi_sawada_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.tsunayoshiSawada,
    era: 2004, // Katekyo Hitman Reborn manga started
    sourceTag: '[Katekyo Hitman Reborn]',
  );

  static const Persona tanjiroKamado = Persona(
    id: 'tanjiro_kamado',
    nameKey: 'persona_tanjiro_kamado',
    titleKey: 'persona_tanjiro_kamado_title',
    quoteKey: 'persona_tanjiro_kamado_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.tanjiroKamado,
    era: 2016, // Demon Slayer manga started
    sourceTag: '[Demon Slayer]',
  );

  static const Persona ichigoKurosaki = Persona(
    id: 'ichigo_kurosaki',
    nameKey: 'persona_ichigo_kurosaki',
    titleKey: 'persona_ichigo_kurosaki_title',
    quoteKey: 'persona_ichigo_kurosaki_quote',
    category: PersonaCategory.anime,
    imagePath: AppAssets.ichigoKurosaki,
    era: 2001, // Bleach manga started
    sourceTag: '[Bleach]',
  );

  /// Get persona by ID
  static Persona? getById(String id) {
    try {
      return all.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
