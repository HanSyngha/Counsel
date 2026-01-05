import 'package:flutter/material.dart';

import '../models/advice.dart';
import '../config/theme.dart';

/// Chip widget showing source type with appropriate icon.
/// Types include: scripture, book, speech, battle, letter, dialogue, moment, teaching, novel
class SourceTypeChip extends StatelessWidget {
  final SourceType type;
  final bool isSelected;
  final bool showLabel;
  final VoidCallback? onTap;
  final double iconSize;
  final EdgeInsets padding;

  const SourceTypeChip({
    super.key,
    required this.type,
    this.isSelected = false,
    this.showLabel = true,
    this.onTap,
    this.iconSize = 14,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  });

  @override
  Widget build(BuildContext context) {
    final color = _getTypeColor();
    final label = _getTypeLabel();
    final icon = _getTypeIcon();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.2)
              : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : color.withValues(alpha: 0.3),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: color,
            ),
            if (showLabel) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: color,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getTypeColor() {
    switch (type) {
      case SourceType.scripture:
        return const Color(0xFFFFD700); // Gold
      case SourceType.book:
        return const Color(0xFF8B5CF6); // Purple
      case SourceType.speech:
        return const Color(0xFF3B82F6); // Blue
      case SourceType.battle:
        return const Color(0xFFEF4444); // Red
      case SourceType.letter:
        return const Color(0xFF10B981); // Green
      case SourceType.dialogue:
        return const Color(0xFF06B6D4); // Cyan
      case SourceType.moment:
        return const Color(0xFFF59E0B); // Amber
      case SourceType.teaching:
        return const Color(0xFFEC4899); // Pink
      case SourceType.novel:
        return const Color(0xFF8B5CF6); // Purple (same as book)
    }
  }

  IconData _getTypeIcon() {
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

  String _getTypeLabel() {
    switch (type) {
      case SourceType.scripture:
        return 'Scripture';
      case SourceType.book:
        return 'Book';
      case SourceType.speech:
        return 'Speech';
      case SourceType.battle:
        return 'Battle';
      case SourceType.letter:
        return 'Letter';
      case SourceType.dialogue:
        return 'Dialogue';
      case SourceType.moment:
        return 'Moment';
      case SourceType.teaching:
        return 'Teaching';
      case SourceType.novel:
        return 'Novel';
    }
  }
}

/// A row of all source type chips for filtering
class SourceTypeChipRow extends StatelessWidget {
  final SourceType? selectedType;
  final Function(SourceType?) onTypeSelected;
  final bool showAll;
  final EdgeInsets padding;

  const SourceTypeChipRow({
    super.key,
    this.selectedType,
    required this.onTypeSelected,
    this.showAll = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          // All chip
          if (showAll)
            _AllChip(
              isSelected: selectedType == null,
              onTap: () => onTypeSelected(null),
            ),
          if (showAll) const SizedBox(width: 8),
          // Type chips
          ...SourceType.values.map((type) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SourceTypeChip(
                type: type,
                isSelected: selectedType == type,
                onTap: () => onTypeSelected(type),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _AllChip extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const _AllChip({
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.2)
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.grid_view,
              size: 14,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              'All',
              style: AppTextStyles.labelSmall.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Badge showing source type icon only (compact version)
class SourceTypeBadge extends StatelessWidget {
  final SourceType type;
  final double size;
  final bool showBackground;

  const SourceTypeBadge({
    super.key,
    required this.type,
    this.size = 24,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = _getTypeColor();
    final icon = _getTypeIcon();

    if (!showBackground) {
      return Icon(
        icon,
        size: size * 0.7,
        color: color,
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(size / 4),
      ),
      child: Icon(
        icon,
        size: size * 0.55,
        color: color,
      ),
    );
  }

  Color _getTypeColor() {
    switch (type) {
      case SourceType.scripture:
        return const Color(0xFFFFD700);
      case SourceType.book:
        return const Color(0xFF8B5CF6);
      case SourceType.speech:
        return const Color(0xFF3B82F6);
      case SourceType.battle:
        return const Color(0xFFEF4444);
      case SourceType.letter:
        return const Color(0xFF10B981);
      case SourceType.dialogue:
        return const Color(0xFF06B6D4);
      case SourceType.moment:
        return const Color(0xFFF59E0B);
      case SourceType.teaching:
        return const Color(0xFFEC4899);
      case SourceType.novel:
        return const Color(0xFF8B5CF6);
    }
  }

  IconData _getTypeIcon() {
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

/// Source type with full description
class SourceTypeDescription extends StatelessWidget {
  final SourceType type;

  const SourceTypeDescription({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SourceTypeBadge(type: type, size: 32),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getTypeLabel(),
                style: AppTextStyles.titleSmall,
              ),
              Text(
                _getTypeDescription(),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getTypeLabel() {
    switch (type) {
      case SourceType.scripture:
        return 'Scripture';
      case SourceType.book:
        return 'Book';
      case SourceType.speech:
        return 'Speech';
      case SourceType.battle:
        return 'Battle';
      case SourceType.letter:
        return 'Letter';
      case SourceType.dialogue:
        return 'Dialogue';
      case SourceType.moment:
        return 'Moment';
      case SourceType.teaching:
        return 'Teaching';
      case SourceType.novel:
        return 'Novel';
    }
  }

  String _getTypeDescription() {
    switch (type) {
      case SourceType.scripture:
        return 'Sacred texts like the Bible, Quran, or Vedas';
      case SourceType.book:
        return 'Published works and treatises';
      case SourceType.speech:
        return 'Notable speeches and addresses';
      case SourceType.battle:
        return 'Military campaigns and warfare';
      case SourceType.letter:
        return 'Personal correspondence and epistles';
      case SourceType.dialogue:
        return 'Philosophical conversations and debates';
      case SourceType.moment:
        return 'Specific historical events';
      case SourceType.teaching:
        return 'Sermons and educational discourses';
      case SourceType.novel:
        return 'Literary fiction and stories';
    }
  }
}
