import 'package:counsel/config/constants.dart';

/// Category enum for personas
enum PersonaCategory {
  history,
  philosophy,
  religion,
  literature,
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

  const Persona({
    required this.id,
    required this.nameKey,
    required this.titleKey,
    required this.quoteKey,
    required this.category,
    required this.imagePath,
    this.era = 0,
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
    // History
    lincoln,
    napoleon,
    steveJobs,
    gandhi,
    // Literature
    sherlockHolmes,
    dumbledore,
    tolstoy,
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
  );

  static const Persona buddha = Persona(
    id: 'buddha',
    nameKey: 'persona_buddha',
    titleKey: 'persona_buddha_title',
    quoteKey: 'persona_buddha_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.buddha,
    era: -483,
  );

  static const Persona muhammad = Persona(
    id: 'muhammad',
    nameKey: 'persona_muhammad',
    titleKey: 'persona_muhammad_title',
    quoteKey: 'persona_muhammad_quote',
    category: PersonaCategory.religion,
    imagePath: AppAssets.muhammad,
    era: 632,
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

  // Literature
  static const Persona sherlockHolmes = Persona(
    id: 'sherlock_holmes',
    nameKey: 'persona_sherlock_holmes',
    titleKey: 'persona_sherlock_holmes_title',
    quoteKey: 'persona_sherlock_holmes_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.sherlockHolmes,
    era: 1890,
  );

  static const Persona dumbledore = Persona(
    id: 'dumbledore',
    nameKey: 'persona_dumbledore',
    titleKey: 'persona_dumbledore_title',
    quoteKey: 'persona_dumbledore_quote',
    category: PersonaCategory.literature,
    imagePath: AppAssets.dumbledore,
    era: 1997,
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

  /// Get persona by ID
  static Persona? getById(String id) {
    try {
      return all.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}
