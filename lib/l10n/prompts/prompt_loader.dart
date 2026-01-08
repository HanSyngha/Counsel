import 'dart:ui';

import 'prompts_en.dart';
import 'prompts_ko.dart';
import 'prompts_ja.dart';
import 'prompts_zh.dart';
import 'prompts_ar.dart';
import 'prompts_th.dart';
import 'prompts_ms.dart';
import 'prompts_es.dart';
import 'prompts_de.dart';
import 'prompts_fr.dart';
import 'prompts_hi.dart';
import 'prompts_id.dart';
import 'prompts_pt.dart';
import 'prompts_tr.dart';
import 'prompts_vi.dart';
import 'prompts_ru.dart';
import 'prompts_it.dart';
import 'prompts_pl.dart';
import 'prompts_nl.dart';
import 'prompts_uk.dart';
import 'prompts_zh_tw.dart';

/// Loads persona prompts based on locale
class PromptLoader {
  static final Map<String, Map<String, String>> _prompts = {
    'en': promptsEn,
    'ko': promptsKo,
    'ja': promptsJa,
    'zh': promptsZh,
    'zh_TW': promptsZhTw,
    'ar': promptsAr,
    'th': promptsTh,
    'ms': promptsMs,
    'es': promptsEs,
    'de': promptsDe,
    'fr': promptsFr,
    'hi': promptsHi,
    'id': promptsId,
    'pt': promptsPt,
    'tr': promptsTr,
    'vi': promptsVi,
    'ru': promptsRu,
    'it': promptsIt,
    'pl': promptsPl,
    'nl': promptsNl,
    'uk': promptsUk,
  };

  /// Get prompt for a specific persona in the given locale
  /// Falls back to English if locale not found
  static String getPrompt(String personaId, Locale locale) {
    final languageCode = locale.languageCode;
    final countryCode = locale.countryCode;
    final scriptCode = locale.scriptCode;

    // Handle Traditional Chinese (Taiwan, Hong Kong, Hant script)
    if (languageCode == 'zh' &&
        (countryCode == 'TW' ||
            countryCode == 'HK' ||
            scriptCode == 'Hant')) {
      final prompt = _prompts['zh_TW']![personaId];
      if (prompt != null) return prompt;
    }

    // Try exact locale match
    if (_prompts.containsKey(languageCode)) {
      final prompt = _prompts[languageCode]![personaId];
      if (prompt != null) return prompt;
    }

    // Fallback to English
    return _prompts['en']![personaId] ?? '';
  }

  /// Get all prompts for a locale
  static Map<String, String> getPromptsForLocale(Locale locale) {
    final languageCode = locale.languageCode;
    final countryCode = locale.countryCode;
    final scriptCode = locale.scriptCode;

    // Handle Traditional Chinese (Taiwan, Hong Kong, Hant script)
    if (languageCode == 'zh' &&
        (countryCode == 'TW' ||
            countryCode == 'HK' ||
            scriptCode == 'Hant')) {
      return _prompts['zh_TW'] ?? _prompts['en']!;
    }

    return _prompts[languageCode] ?? _prompts['en']!;
  }

  /// Check if a locale is supported
  static bool isLocaleSupported(Locale locale) {
    return _prompts.containsKey(locale.languageCode);
  }

  /// Get list of supported language codes
  static List<String> get supportedLanguageCodes => _prompts.keys.toList();
}
