import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../models/persona.dart';
import '../config/theme.dart';
import '../providers/providers.dart';

/// Grid card for displaying a persona with image, name, and title.
/// OnTap navigates to the chat screen with the selected persona.
class PersonaCard extends ConsumerWidget {
  final Persona persona;
  final VoidCallback? onTap;
  final bool showCategory;
  final bool isCompact;

  const PersonaCard({
    super.key,
    required this.persona,
    this.onTap,
    this.showCategory = false,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        ref.read(selectedPersonaProvider.notifier).state = persona;
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Persona Image
              Expanded(
                flex: isCompact ? 2 : 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image
                    Image.asset(
                      persona.imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.surfaceVariant,
                          child: Icon(
                            Icons.person,
                            size: isCompact ? 40 : 60,
                            color: AppColors.textTertiary,
                          ),
                        );
                      },
                    ),
                    // Gradient overlay
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.7),
                            ],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                    // Category badge
                    if (showCategory)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: _buildCategoryBadge(context),
                      ),
                  ],
                ),
              ),
              // Info section
              Container(
                padding: EdgeInsets.all(isCompact ? 8 : 12),
                color: AppColors.surface,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name
                    Text(
                      _getPersonaName(l10n),
                      style: isCompact
                          ? AppTextStyles.titleSmall
                          : AppTextStyles.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Title
                    Text(
                      _getPersonaTitle(l10n),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: isCompact ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (!isCompact && persona.era != 0) ...[
                      const SizedBox(height: 4),
                      // Era
                      Text(
                        persona.eraDisplay,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: _getCategoryColor(),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getCategoryColor().withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        _getCategoryLabel(context),
        style: AppTextStyles.labelSmall.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (persona.category) {
      case PersonaCategory.history:
        return AppColors.categoryHistory;
      case PersonaCategory.philosophy:
        return AppColors.categoryPhilosophy;
      case PersonaCategory.religion:
        return AppColors.categoryReligion;
      case PersonaCategory.literature:
        return AppColors.categoryLiterature;
      case PersonaCategory.anime:
        return AppColors.categoryAnime;
    }
  }

  String _getCategoryLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (persona.category) {
      case PersonaCategory.history:
        return l10n.categoryHistory;
      case PersonaCategory.philosophy:
        return l10n.categoryPhilosophy;
      case PersonaCategory.religion:
        return l10n.categoryReligion;
      case PersonaCategory.literature:
        return l10n.categoryLiterature;
      case PersonaCategory.anime:
        return l10n.category_anime;
    }
  }

  String _getPersonaName(AppLocalizations l10n) {
    // Map persona nameKey to localized string
    switch (persona.id) {
      case 'socrates':
        return l10n.personaSocrates;
      case 'plato':
        return l10n.personaPlato;
      case 'aristotle':
        return l10n.personaAristotle;
      case 'seneca':
        return l10n.personaSeneca;
      case 'confucius':
        return l10n.personaConfucius;
      case 'laozi':
        return l10n.personaLaozi;
      case 'jesus':
        return l10n.personaJesus;
      case 'buddha':
        return l10n.personaBuddha;
      case 'muhammad':
        return l10n.personaMuhammad;
      case 'lincoln':
        return l10n.personaLincoln;
      case 'napoleon':
        return l10n.personaNapoleon;
      case 'steve_jobs':
        return l10n.personaSteveJobs;
      case 'sherlock_holmes':
        return l10n.personaSherlockHolmes;
      case 'dumbledore':
        return l10n.personaDumbledore;
      case 'gandhi':
        return l10n.personaGandhi;
      case 'rumi':
        return l10n.personaRumi;
      case 'krishna':
        return l10n.personaKrishna;
      case 'brahma':
        return l10n.personaBrahma;
      case 'tolstoy':
        return l10n.personaTolstoy;
      case 'vishnu':
        return l10n.personaVishnu;
      default:
        return persona.nameKey;
    }
  }

  String _getPersonaTitle(AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates':
        return l10n.personaSocratesTitle;
      case 'plato':
        return l10n.personaPlatoTitle;
      case 'aristotle':
        return l10n.personaAristotleTitle;
      case 'seneca':
        return l10n.personaSenecaTitle;
      case 'confucius':
        return l10n.personaConfuciusTitle;
      case 'laozi':
        return l10n.personaLaoziTitle;
      case 'jesus':
        return l10n.personaJesusTitle;
      case 'buddha':
        return l10n.personaBuddhaTitle;
      case 'muhammad':
        return l10n.personaMuhammadTitle;
      case 'lincoln':
        return l10n.personaLincolnTitle;
      case 'napoleon':
        return l10n.personaNapoleonTitle;
      case 'steve_jobs':
        return l10n.personaSteveJobsTitle;
      case 'sherlock_holmes':
        return l10n.personaSherlockHolmesTitle;
      case 'dumbledore':
        return l10n.personaDumbledoreTitle;
      case 'gandhi':
        return l10n.personaGandhiTitle;
      case 'rumi':
        return l10n.personaRumiTitle;
      case 'krishna':
        return l10n.personaKrishnaTitle;
      case 'brahma':
        return l10n.personaBrahmaTitle;
      case 'tolstoy':
        return l10n.personaTolstoyTitle;
      case 'vishnu':
        return l10n.personaVishnuTitle;
      default:
        return persona.titleKey;
    }
  }
}

/// A horizontal scrollable list of persona cards
class PersonaCardList extends StatelessWidget {
  final List<Persona> personas;
  final Function(Persona)? onPersonaTap;
  final double cardWidth;
  final double cardHeight;

  const PersonaCardList({
    super.key,
    required this.personas,
    this.onPersonaTap,
    this.cardWidth = 140,
    this.cardHeight = 180,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: personas.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return SizedBox(
            width: cardWidth,
            child: PersonaCard(
              persona: personas[index],
              isCompact: true,
              onTap: () => onPersonaTap?.call(personas[index]),
            ),
          );
        },
      ),
    );
  }
}
