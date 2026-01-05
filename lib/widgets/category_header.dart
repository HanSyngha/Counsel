import 'package:flutter/material.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../models/persona.dart';
import '../config/theme.dart';

/// Section header widget for persona categories.
/// Displays category name with icon and optional "See all" button.
class CategoryHeader extends StatelessWidget {
  final PersonaCategory category;
  final VoidCallback? onSeeAllTap;
  final bool showSeeAll;
  final int? itemCount;
  final EdgeInsets padding;

  const CategoryHeader({
    super.key,
    required this.category,
    this.onSeeAllTap,
    this.showSeeAll = true,
    this.itemCount,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: padding,
      child: Row(
        children: [
          // Category icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getCategoryColor().withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              _getCategoryIcon(),
              size: 20,
              color: _getCategoryColor(),
            ),
          ),
          const SizedBox(width: 12),
          // Category name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getCategoryName(l10n),
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                if (itemCount != null)
                  Text(
                    '$itemCount mentors',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
              ],
            ),
          ),
          // See all button
          if (showSeeAll && onSeeAllTap != null)
            TextButton(
              onPressed: onSeeAllTap,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.seeAll,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: _getCategoryColor(),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: _getCategoryColor(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _getCategoryColor() {
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

  IconData _getCategoryIcon() {
    switch (category) {
      case PersonaCategory.history:
        return Icons.account_balance;
      case PersonaCategory.philosophy:
        return Icons.psychology;
      case PersonaCategory.religion:
        return Icons.auto_awesome;
      case PersonaCategory.literature:
        return Icons.auto_stories;
    }
  }

  String _getCategoryName(AppLocalizations l10n) {
    switch (category) {
      case PersonaCategory.history:
        return l10n.categoryHistory;
      case PersonaCategory.philosophy:
        return l10n.categoryPhilosophy;
      case PersonaCategory.religion:
        return l10n.categoryReligion;
      case PersonaCategory.literature:
        return l10n.categoryLiterature;
    }
  }
}

/// Simple text-based category header
class CategoryHeaderSimple extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;
  final bool showSeeAll;
  final Widget? trailing;
  final EdgeInsets padding;

  const CategoryHeaderSimple({
    super.key,
    required this.title,
    this.onSeeAllTap,
    this.showSeeAll = true,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.headlineSmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),
          if (trailing != null)
            trailing!
          else if (showSeeAll && onSeeAllTap != null)
            TextButton(
              onPressed: onSeeAllTap,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.seeAll,
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Category header with gradient background
class CategoryHeaderGradient extends StatelessWidget {
  final PersonaCategory category;
  final VoidCallback? onTap;
  final String? subtitle;

  const CategoryHeaderGradient({
    super.key,
    required this.category,
    this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _getCategoryColor().withValues(alpha: 0.2),
              _getCategoryColor().withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _getCategoryColor().withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getCategoryColor().withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(),
                size: 24,
                color: _getCategoryColor(),
              ),
            ),
            const SizedBox(width: 16),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getCategoryName(l10n),
                    style: AppTextStyles.titleLarge.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                ],
              ),
            ),
            // Arrow
            if (onTap != null)
              Icon(
                Icons.chevron_right,
                size: 24,
                color: _getCategoryColor(),
              ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor() {
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

  IconData _getCategoryIcon() {
    switch (category) {
      case PersonaCategory.history:
        return Icons.account_balance;
      case PersonaCategory.philosophy:
        return Icons.psychology;
      case PersonaCategory.religion:
        return Icons.auto_awesome;
      case PersonaCategory.literature:
        return Icons.auto_stories;
    }
  }

  String _getCategoryName(AppLocalizations l10n) {
    switch (category) {
      case PersonaCategory.history:
        return l10n.categoryHistory;
      case PersonaCategory.philosophy:
        return l10n.categoryPhilosophy;
      case PersonaCategory.religion:
        return l10n.categoryReligion;
      case PersonaCategory.literature:
        return l10n.categoryLiterature;
    }
  }
}

/// Chip-style category selector
class CategoryChips extends StatelessWidget {
  final PersonaCategory? selectedCategory;
  final Function(PersonaCategory?) onCategorySelected;
  final bool showAll;
  final EdgeInsets padding;

  const CategoryChips({
    super.key,
    this.selectedCategory,
    required this.onCategorySelected,
    this.showAll = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          // All chip
          if (showAll)
            _CategoryChip(
              label: l10n.categoryAll,
              icon: Icons.grid_view,
              isSelected: selectedCategory == null,
              onTap: () => onCategorySelected(null),
            ),
          if (showAll) const SizedBox(width: 8),
          // Category chips
          ...PersonaCategory.values.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _CategoryChip(
                label: _getCategoryName(category, l10n),
                icon: _getCategoryIcon(category),
                color: _getCategoryColor(category),
                isSelected: selectedCategory == category,
                onTap: () => onCategorySelected(category),
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _getCategoryColor(PersonaCategory category) {
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

  IconData _getCategoryIcon(PersonaCategory category) {
    switch (category) {
      case PersonaCategory.history:
        return Icons.account_balance;
      case PersonaCategory.philosophy:
        return Icons.psychology;
      case PersonaCategory.religion:
        return Icons.auto_awesome;
      case PersonaCategory.literature:
        return Icons.auto_stories;
    }
  }

  String _getCategoryName(PersonaCategory category, AppLocalizations l10n) {
    switch (category) {
      case PersonaCategory.history:
        return l10n.categoryHistory;
      case PersonaCategory.philosophy:
        return l10n.categoryPhilosophy;
      case PersonaCategory.religion:
        return l10n.categoryReligion;
      case PersonaCategory.literature:
        return l10n.categoryLiterature;
    }
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.icon,
    this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? chipColor.withValues(alpha: 0.2)
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? chipColor : AppColors.border,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? chipColor : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? chipColor : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
