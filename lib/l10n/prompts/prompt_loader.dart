import 'dart:ui';

// Import barrel files for each persona
import 'socrates/prompts.dart';
import 'plato/prompts.dart';
import 'aristotle/prompts.dart';
import 'seneca/prompts.dart';
import 'confucius/prompts.dart';
import 'laozi/prompts.dart';
import 'jesus/prompts.dart';
import 'buddha/prompts.dart';
import 'muhammad/prompts.dart';
import 'lincoln/prompts.dart';
import 'napoleon/prompts.dart';
import 'steve_jobs/prompts.dart';
import 'sherlock_holmes/prompts.dart';
import 'dumbledore/prompts.dart';
import 'gandhi/prompts.dart';
import 'rumi/prompts.dart';
import 'krishna/prompts.dart';
import 'brahma/prompts.dart';
import 'vishnu/prompts.dart';
import 'tolstoy/prompts.dart';
import 'luffy/prompts.dart';

/// Loads persona prompts based on locale
///
/// Structure: prompts/{persona}/prompt_{language}.dart
/// Each persona has a barrel file (prompts.dart) that exports all language variants
class PromptLoader {
  /// Maps persona ID to their prompts map (language -> prompt)
  static final Map<String, Map<String, String>> _personaPrompts = {
    'socrates': socratesPrompts,
    'plato': platoPrompts,
    'aristotle': aristotlePrompts,
    'seneca': senecaPrompts,
    'confucius': confuciusPrompts,
    'laozi': laoziPrompts,
    'jesus': jesusPrompts,
    'buddha': buddhaPrompts,
    'muhammad': muhammadPrompts,
    'lincoln': lincolnPrompts,
    'napoleon': napoleonPrompts,
    'steve_jobs': steve_jobsPrompts,
    'sherlock_holmes': sherlock_holmesPrompts,
    'dumbledore': dumbledorePrompts,
    'gandhi': gandhiPrompts,
    'rumi': rumiPrompts,
    'krishna': krishnaPrompts,
    'brahma': brahmaPrompts,
    'vishnu': vishnuPrompts,
    'tolstoy': tolstoyPrompts,
    'luffy': luffyPrompts,
  };

  /// Supported language codes
  static const List<String> _supportedLanguages = [
    'en', 'ko', 'ja', 'zh', 'zh_TW', 'ar', 'th', 'ms',
    'es', 'de', 'fr', 'hi', 'id', 'pt', 'tr', 'vi',
    'ru', 'it', 'pl', 'nl', 'uk'
  ];

  /// Get the language key for a given locale
  static String _getLanguageKey(Locale locale) {
    final languageCode = locale.languageCode;
    final countryCode = locale.countryCode;
    final scriptCode = locale.scriptCode;

    // Handle Traditional Chinese (Taiwan, Hong Kong, Hant script)
    if (languageCode == 'zh' &&
        (countryCode == 'TW' ||
            countryCode == 'HK' ||
            scriptCode == 'Hant')) {
      return 'zh_TW';
    }

    return languageCode;
  }

  /// Get prompt for a specific persona in the given locale
  /// Falls back to English if locale not found
  static String getPrompt(String personaId, Locale locale) {
    final personaPrompts = _personaPrompts[personaId];
    if (personaPrompts == null) return '';

    final langKey = _getLanguageKey(locale);

    // Try exact locale match
    final prompt = personaPrompts[langKey];
    if (prompt != null) return prompt;

    // Fallback to English
    return personaPrompts['en'] ?? '';
  }

  /// Get all prompts for a locale (persona -> prompt)
  static Map<String, String> getPromptsForLocale(Locale locale) {
    final langKey = _getLanguageKey(locale);
    final result = <String, String>{};

    for (final entry in _personaPrompts.entries) {
      final prompt = entry.value[langKey] ?? entry.value['en'];
      if (prompt != null) {
        result[entry.key] = prompt;
      }
    }

    return result;
  }

  /// Check if a locale is supported
  static bool isLocaleSupported(Locale locale) {
    return _supportedLanguages.contains(locale.languageCode);
  }

  /// Get list of supported language codes
  static List<String> get supportedLanguageCodes => _supportedLanguages;

  /// Get list of supported persona IDs
  static List<String> get supportedPersonaIds => _personaPrompts.keys.toList();
}
