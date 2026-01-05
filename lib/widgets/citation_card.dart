import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/advice.dart';
import '../config/theme.dart';
import 'source_type_chip.dart';

/// Beautiful card showing a citation with full source details.
/// Includes type icon, source name, location, year, and context.
class CitationCard extends StatelessWidget {
  final Citation citation;
  final bool showRelevance;
  final bool isExpanded;
  final VoidCallback? onTap;
  final VoidCallback? onCopy;

  const CitationCard({
    super.key,
    required this.citation,
    this.showRelevance = true,
    this.isExpanded = false,
    this.onTap,
    this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.surfaceVariant,
              AppColors.surface,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Quote section with decorative elements
              _buildQuoteSection(context),
              // Source details section
              _buildSourceSection(context),
              // Relevance section (optional)
              if (showRelevance && citation.relevance.isNotEmpty)
                _buildRelevanceSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuoteSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated.withValues(alpha: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Opening quote mark
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"',
                style: TextStyle(
                  fontSize: 48,
                  height: 0.5,
                  fontFamily: 'Georgia',
                  color: AppColors.primary.withValues(alpha: 0.5),
                ),
              ),
              // Copy button
              if (onCopy != null)
                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: citation.text));
                    onCopy?.call();
                  },
                  icon: const Icon(
                    Icons.copy_outlined,
                    size: 20,
                    color: AppColors.textTertiary,
                  ),
                  tooltip: 'Copy quote',
                  visualDensity: VisualDensity.compact,
                ),
            ],
          ),
          // Quote text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              citation.text,
              style: AppTextStyles.quote.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // Closing quote mark
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '"',
              style: TextStyle(
                fontSize: 48,
                height: 0.5,
                fontFamily: 'Georgia',
                color: AppColors.primary.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Source type chip
          SourceTypeChip(
            type: citation.source.type,
            isSelected: true,
          ),
          const SizedBox(height: 12),
          // Source name with icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getSourceIcon(citation.source.type),
                  size: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      citation.source.name,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (citation.source.location.isNotEmpty)
                      Text(
                        citation.source.location,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          // Year and context
          if (citation.source.year != null || citation.source.context.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.border.withValues(alpha: 0.5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Year
                    if (citation.source.year != null) ...[
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            citation.source.year!,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      if (citation.source.context.isNotEmpty)
                        const SizedBox(height: 8),
                    ],
                    // Context
                    if (citation.source.context.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.history_edu,
                              size: 14,
                              color: AppColors.textTertiary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              citation.source.context,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRelevanceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withValues(alpha: 0.1),
              AppColors.primaryLight.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why This Matters',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    citation.relevance,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
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

/// A compact version of the citation card for inline display
class CitationCardCompact extends StatelessWidget {
  final Citation citation;
  final VoidCallback? onTap;

  const CitationCardCompact({
    super.key,
    required this.citation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getSourceIcon(citation.source.type),
                size: 18,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"${citation.text}"',
                    style: AppTextStyles.bodySmall.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    citation.source.name,
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.textTertiary,
            ),
          ],
        ),
      ),
    );
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
