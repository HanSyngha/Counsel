import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/theme.dart';
import '../config/constants.dart';
import '../providers/providers.dart';
import 'language_selector_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Language Section
          _buildSectionHeader(l10n.settingsLanguage, Icons.language),
          _buildSettingsTile(
            context: context,
            icon: Icons.translate,
            title: l10n.settingsLanguage,
            subtitle: AppLocales.localeNames[currentLocale.languageCode] ?? 'English',
            onTap: () => _navigateToLanguageSelector(context),
          ),
          const SizedBox(height: 24),

          // Data Section
          _buildSectionHeader(l10n.settingsData, Icons.storage),
          _buildSettingsTile(
            context: context,
            icon: Icons.delete_outline,
            title: l10n.settingsClearHistory,
            subtitle: l10n.settingsClearHistorySubtitle,
            onTap: () => _showClearHistoryDialog(context, ref, l10n),
            isDestructive: true,
          ),
          const SizedBox(height: 24),

          // About Section
          _buildSectionHeader(l10n.settingsAbout, Icons.info_outline),
          _buildSettingsTile(
            context: context,
            icon: Icons.article_outlined,
            title: l10n.settingsAboutApp,
            subtitle: l10n.settingsAboutAppSubtitle,
            onTap: () => _showAboutDialog(context, l10n),
          ),
          _buildSettingsTile(
            context: context,
            icon: Icons.privacy_tip_outlined,
            title: l10n.settingsPrivacyPolicy,
            subtitle: l10n.settingsPrivacyPolicySubtitle,
            onTap: () => _openPrivacyPolicy(context),
          ),
          _buildSettingsTile(
            context: context,
            icon: Icons.description_outlined,
            title: l10n.settingsTerms,
            subtitle: l10n.settingsTermsSubtitle,
            onTap: () => _openTermsOfService(context),
          ),
          const SizedBox(height: 24),

          // App Info
          _buildAppInfo(l10n),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive
                ? AppColors.error.withOpacity(0.1)
                : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isDestructive ? AppColors.error : AppColors.textSecondary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.titleSmall.copyWith(
            color: isDestructive ? AppColors.error : AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.bodySmall,
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: AppColors.textTertiary,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildAppInfo(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // App Logo
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/personas/counsel_logo.png',
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppConstants.appName,
            style: AppTextStyles.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Version ${AppConstants.appVersion}',
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: 12),
          Text(
            l10n.settingsAppDescription,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _navigateToLanguageSelector(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LanguageSelectorScreen(),
      ),
    );
  }

  void _showClearHistoryDialog(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(l10n.settingsClearHistoryDialogTitle),
        content: Text(l10n.settingsClearHistoryDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ref.read(adviceHistoryProvider.notifier).clearAll();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsHistoryCleared)),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.clear),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/personas/counsel_logo.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Text(AppConstants.appName),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.settingsAboutContent,
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Version ${AppConstants.appVersion}',
              style: AppTextStyles.labelSmall,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }

  Future<void> _openPrivacyPolicy(BuildContext context) async {
    final uri = Uri.parse('https://github.com/HanSyngha/Counsel/blob/main/PRIVACY_POLICY.md');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open Privacy Policy')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open Privacy Policy')),
        );
      }
    }
  }

  Future<void> _openTermsOfService(BuildContext context) async {
    final uri = Uri.parse('https://github.com/HanSyngha/Counsel/blob/main/TERMS_OF_SERVICE.md');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open Terms of Service')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open Terms of Service')),
        );
      }
    }
  }
}
