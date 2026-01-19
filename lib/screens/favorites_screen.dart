import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../providers/providers.dart';
import 'advice_detail_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.favoritesTitle),
      ),
      body: favorites.isEmpty
          ? _buildEmptyState(l10n)
          : _buildFavoritesList(context, ref, favorites, l10n),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.favoritesEmpty,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.favoritesEmptySubtitle,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(
    BuildContext context,
    WidgetRef ref,
    List<AdviceRecord> favorites,
    AppLocalizations l10n,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final record = favorites[index];
        return _buildFavoriteCard(context, ref, record, l10n);
      },
    );
  }

  Widget _buildFavoriteCard(
    BuildContext context,
    WidgetRef ref,
    AdviceRecord record,
    AppLocalizations l10n,
  ) {
    final persona = PersonaData.getById(record.personaId);
    final dateFormat = DateFormat.yMMMd();

    return GestureDetector(
      onTap: () => _navigateToDetail(context, record, persona),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with persona
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.2),
                    AppColors.surfaceVariant,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: persona != null
                        ? AssetImage(persona.imagePath)
                        : null,
                    backgroundColor: AppColors.surfaceVariant,
                    child: persona == null
                        ? const Icon(Icons.person, color: AppColors.textTertiary)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (persona != null)
                          Text(
                            _getPersonaName(persona, l10n),
                            style: AppTextStyles.titleMedium,
                          ),
                        Text(
                          dateFormat.format(record.createdAt),
                          style: AppTextStyles.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: AppColors.error,
                    ),
                    onPressed: () => _toggleFavorite(context, ref, record, l10n),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User question
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: AppColors.textTertiary,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            record.userQuery,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textPrimary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Citation
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border(
                        left: BorderSide(color: AppColors.primary, width: 3),
                      ),
                    ),
                    child: Text(
                      '"${record.response.citation.text}"',
                      style: AppTextStyles.quote.copyWith(fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Source info
                  Row(
                    children: [
                      Icon(
                        Icons.book_outlined,
                        color: AppColors.textTertiary,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${record.response.citation.source.name} - ${record.response.citation.source.location}',
                          style: AppTextStyles.labelSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // View more
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () => _navigateToDetail(context, record, persona),
                      icon: const Icon(Icons.arrow_forward, size: 16),
                      label: Text(l10n.favoritesViewFull),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(
    BuildContext context,
    AdviceRecord record,
    Persona? persona,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdviceDetailScreen(
          record: record,
          persona: persona,
        ),
      ),
    );
  }

  void _toggleFavorite(
    BuildContext context,
    WidgetRef ref,
    AdviceRecord record,
    AppLocalizations l10n,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(l10n.favoritesRemoveTitle),
        content: Text(l10n.favoritesRemoveMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ref.read(adviceHistoryProvider.notifier).toggleFavorite(record.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.favoritesRemoved)),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.remove),
          ),
        ],
      ),
    );
  }

  String _getPersonaName(Persona persona, AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates': return l10n.personaSocrates;
      case 'plato': return l10n.personaPlato;
      case 'aristotle': return l10n.personaAristotle;
      case 'seneca': return l10n.personaSeneca;
      case 'confucius': return l10n.personaConfucius;
      case 'laozi': return l10n.personaLaozi;
      case 'jesus': return l10n.personaJesus;
      case 'buddha': return l10n.personaBuddha;
      case 'muhammad': return l10n.personaMuhammad;
      case 'lincoln': return l10n.personaLincoln;
      case 'napoleon': return l10n.personaNapoleon;
      case 'steve_jobs': return l10n.personaSteveJobs;
      case 'sherlock_holmes': return l10n.personaSherlockHolmes;
      case 'dumbledore': return l10n.personaDumbledore;
      case 'gandhi': return l10n.personaGandhi;
      case 'rumi': return l10n.personaRumi;
      case 'krishna': return l10n.personaKrishna;
      case 'brahma': return l10n.personaBrahma;
      case 'tolstoy': return l10n.personaTolstoy;
      case 'vishnu': return l10n.personaVishnu;
      case 'luffy': return l10n.persona_luffy;
      case 'gon_freecss': return l10n.persona_gon_freecss;
      case 'natsu_dragneel': return l10n.persona_natsu_dragneel;
      case 'izuku_midoriya': return l10n.persona_izuku_midoriya;
      case 'son_goku': return l10n.persona_son_goku;
      case 'edward_elric': return l10n.persona_edward_elric;
      case 'eren_yeager': return l10n.persona_eren_yeager;
      case 'naruto_uzumaki': return l10n.persona_naruto_uzumaki;
      case 'tsunayoshi_sawada': return l10n.persona_tsunayoshi_sawada;
      case 'tanjiro_kamado': return l10n.persona_tanjiro_kamado;
      case 'ichigo_kurosaki': return l10n.persona_ichigo_kurosaki;
      case 'martin_luther_king': return l10n.persona_martin_luther_king;
      case 'albert_einstein': return l10n.persona_albert_einstein;
      case 'julius_caesar': return l10n.persona_julius_caesar;
      case 'david': return l10n.persona_david;
      case 'aslan': return l10n.persona_aslan;
      case 'jean_valjean': return l10n.persona_jean_valjean;
      case 'liu_bei': return l10n.persona_liu_bei;
      case 'zhuge_liang': return l10n.persona_zhuge_liang;
      case 'cao_cao': return l10n.persona_cao_cao;
      default: return persona.id;
    }
  }
}
