import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../models/advice.dart';
import '../models/persona.dart';
import '../config/theme.dart';
import '../providers/providers.dart';

/// Card showing advice summary for history and favorites lists.
/// Displays persona info, truncated question/advice, and timestamp.
class AdviceCard extends ConsumerWidget {
  final AdviceRecord record;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onDelete;
  final bool showActions;

  const AdviceCard({
    super.key,
    required this.record,
    this.onTap,
    this.onFavoriteToggle,
    this.onDelete,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final persona = PersonaData.getById(record.personaId);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: record.isFavorite
                ? AppColors.warning.withValues(alpha: 0.5)
                : AppColors.border,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with persona info
            _buildHeader(context, persona, l10n),
            // Divider
            Container(
              height: 1,
              color: AppColors.border.withValues(alpha: 0.5),
            ),
            // Content
            _buildContent(context),
            // Footer with actions
            if (showActions) _buildFooter(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    Persona? persona,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Persona avatar
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _getCategoryColor(persona?.category),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: persona != null
                  ? Image.asset(
                      persona.imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.surfaceVariant,
                          child: const Icon(
                            Icons.person,
                            size: 24,
                            color: AppColors.textTertiary,
                          ),
                        );
                      },
                    )
                  : Container(
                      color: AppColors.surfaceVariant,
                      child: const Icon(
                        Icons.person,
                        size: 24,
                        color: AppColors.textTertiary,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          // Persona name and timestamp
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getPersonaName(persona, l10n),
                  style: AppTextStyles.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  _formatTimestamp(record.createdAt),
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          // Favorite indicator
          if (record.isFavorite)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.warning.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.bookmark,
                size: 18,
                color: AppColors.warning,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User question
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.help_outline,
                  size: 16,
                  color: AppColors.textTertiary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    record.userQuery,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Advice preview
          Text(
            record.response.advice,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              height: 1.4,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          // Citation source preview
          if (record.response.citation.source.name.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  _getSourceIcon(record.response.citation.source.type),
                  size: 14,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    record.response.citation.source.name,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Favorite button
          IconButton(
            onPressed: () {
              ref
                  .read(adviceHistoryProvider.notifier)
                  .toggleFavorite(record.id);
              onFavoriteToggle?.call();
            },
            icon: Icon(
              record.isFavorite ? Icons.bookmark : Icons.bookmark_border,
              size: 20,
              color: record.isFavorite
                  ? AppColors.warning
                  : AppColors.textTertiary,
            ),
            tooltip: record.isFavorite ? 'Remove from saved' : 'Save',
            visualDensity: VisualDensity.compact,
          ),
          // Delete button
          if (onDelete != null)
            IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline,
                size: 20,
                color: AppColors.textTertiary,
              ),
              tooltip: 'Delete',
              visualDensity: VisualDensity.compact,
            ),
          // Arrow indicator
          const Icon(
            Icons.chevron_right,
            size: 20,
            color: AppColors.textTertiary,
          ),
        ],
      ),
    );
  }

  Color _getCategoryColor(PersonaCategory? category) {
    if (category == null) return AppColors.border;
    switch (category) {
      case PersonaCategory.history:
        return AppColors.categoryHistory;
      case PersonaCategory.philosophy:
        return AppColors.categoryPhilosophy;
      case PersonaCategory.religion:
        return AppColors.categoryReligion;
      case PersonaCategory.literature:
        return AppColors.categoryLiterature;
    }
  }

  String _getPersonaName(Persona? persona, AppLocalizations l10n) {
    if (persona == null) return record.personaId;

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

  String _formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.month}/${dateTime.day}/${dateTime.year}';
    }
  }

  IconData _getSourceIcon(SourceType type) {
    switch (type) {
      case SourceType.scripture:
        return Icons.auto_stories;
      case SourceType.book:
        return Icons.menu_book;
      case SourceType.speech:
        return Icons.record_voice_over;
      case SourceType.battle:
        return Icons.shield;
      case SourceType.letter:
        return Icons.mail_outline;
      case SourceType.dialogue:
        return Icons.forum;
      case SourceType.moment:
        return Icons.access_time;
      case SourceType.teaching:
        return Icons.school;
      case SourceType.novel:
        return Icons.auto_stories_outlined;
    }
  }
}

/// A list of advice cards with empty state handling
class AdviceCardList extends StatelessWidget {
  final List<AdviceRecord> records;
  final Function(AdviceRecord)? onCardTap;
  final Function(AdviceRecord)? onDelete;
  final String emptyTitle;
  final String emptySubtitle;
  final IconData emptyIcon;

  const AdviceCardList({
    super.key,
    required this.records,
    this.onCardTap,
    this.onDelete,
    this.emptyTitle = 'No advice yet',
    this.emptySubtitle = 'Start a conversation with a mentor',
    this.emptyIcon = Icons.history,
  });

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        return AdviceCard(
          record: records[index],
          onTap: () => onCardTap?.call(records[index]),
          onDelete: onDelete != null ? () => onDelete?.call(records[index]) : null,
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                emptyIcon,
                size: 48,
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              emptyTitle,
              style: AppTextStyles.titleLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              emptySubtitle,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
