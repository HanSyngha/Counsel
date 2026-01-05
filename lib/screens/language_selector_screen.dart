import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../config/constants.dart';
import '../providers/providers.dart';

class LanguageSelectorScreen extends ConsumerWidget {
  const LanguageSelectorScreen({super.key});

  /// Get ordered locale list with device language first
  List<String> _getOrderedLocales() {
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final deviceLanguageCode = deviceLocale.languageCode;

    // Start with population-ordered list from constants
    final locales = List<String>.from(AppLocales.supportedLocales);

    // If device language is supported, move it to front
    if (locales.contains(deviceLanguageCode)) {
      locales.remove(deviceLanguageCode);
      locales.insert(0, deviceLanguageCode);
    }

    return locales;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);
    final orderedLocales = _getOrderedLocales();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.languageTitle),
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  Icons.translate,
                  size: 48,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.languageSelectPrompt,
                  style: AppTextStyles.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.languageSelectSubtitle,
                  style: AppTextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Divider(),
          // Language Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.0,
              ),
              itemCount: orderedLocales.length,
              itemBuilder: (context, index) {
                final localeCode = orderedLocales[index];
                final isSelected = currentLocale.languageCode == localeCode;

                return _buildLanguageCard(
                  context,
                  ref,
                  localeCode,
                  isSelected,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageCard(
    BuildContext context,
    WidgetRef ref,
    String localeCode,
    bool isSelected,
  ) {
    final localeName = AppLocales.localeNames[localeCode] ?? localeCode;
    final appName = AppLocales.appNames[localeCode] ?? 'Counsel';
    final flagEmoji = _getLanguageFlag(localeCode);

    return GestureDetector(
      onTap: () => _selectLanguage(context, ref, localeCode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Flag emoji
                  Text(
                    flagEmoji,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 12),
                  // Language info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localeName,
                          style: AppTextStyles.titleSmall.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          appName,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isSelected
                                ? AppColors.primary.withOpacity(0.7)
                                : AppColors.textTertiary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Selected indicator
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getLanguageFlag(String localeCode) {
    final flags = {
      'en': '\u{1F1FA}\u{1F1F8}', // US flag
      'ko': '\u{1F1F0}\u{1F1F7}', // Korea flag
      'ja': '\u{1F1EF}\u{1F1F5}', // Japan flag
      'zh': '\u{1F1E8}\u{1F1F3}', // China flag
      'ar': '\u{1F1F8}\u{1F1E6}', // Saudi Arabia flag
      'th': '\u{1F1F9}\u{1F1ED}', // Thailand flag
      'ms': '\u{1F1F2}\u{1F1FE}', // Malaysia flag
      'es': '\u{1F1EA}\u{1F1F8}', // Spain flag
      'de': '\u{1F1E9}\u{1F1EA}', // Germany flag
      'fr': '\u{1F1EB}\u{1F1F7}', // France flag
      'hi': '\u{1F1EE}\u{1F1F3}', // India flag
      'id': '\u{1F1EE}\u{1F1E9}', // Indonesia flag
      'pt': '\u{1F1E7}\u{1F1F7}', // Brazil flag
      'tr': '\u{1F1F9}\u{1F1F7}', // Turkey flag
      'vi': '\u{1F1FB}\u{1F1F3}', // Vietnam flag
      'ru': '\u{1F1F7}\u{1F1FA}', // Russia flag
    };

    return flags[localeCode] ?? '\u{1F310}'; // Globe emoji as default
  }

  void _selectLanguage(BuildContext context, WidgetRef ref, String localeCode) {
    final newLocale = Locale(localeCode);
    ref.read(localeProvider.notifier).state = newLocale;

    // Save to storage
    final storage = ref.read(storageServiceProvider);
    storage.setLanguageCode(localeCode);

    // Show confirmation
    final localeName = AppLocales.localeNames[localeCode] ?? localeCode;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Text(_getLanguageFlag(localeCode)),
            const SizedBox(width: 8),
            Text('Language changed to $localeName'),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );

    // Navigate back
    Navigator.pop(context);
  }
}
