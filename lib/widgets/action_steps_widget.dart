import 'package:flutter/material.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';

/// Widget displaying a numbered list of action steps.
/// Typically shows 3 action steps from the advice response.
class ActionStepsWidget extends StatelessWidget {
  final List<String> steps;
  final bool showHeader;
  final bool isInteractive;
  final Function(int)? onStepTap;
  final Set<int>? completedSteps;

  const ActionStepsWidget({
    super.key,
    required this.steps,
    this.showHeader = true,
    this.isInteractive = false,
    this.onStepTap,
    this.completedSteps,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (steps.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          if (showHeader)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant.withValues(alpha: 0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.checklist_rounded,
                      size: 20,
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.resultActionSteps,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Spacer(),
                  // Progress indicator
                  if (isInteractive && completedSteps != null)
                    _buildProgressIndicator(),
                ],
              ),
            ),
          // Steps list
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: List.generate(steps.length, (index) {
                final isCompleted = completedSteps?.contains(index) ?? false;
                return _ActionStepItem(
                  stepNumber: index + 1,
                  text: steps[index],
                  isLast: index == steps.length - 1,
                  isCompleted: isCompleted,
                  isInteractive: isInteractive,
                  onTap: isInteractive ? () => onStepTap?.call(index) : null,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final completed = completedSteps?.length ?? 0;
    final total = steps.length;
    final progress = total > 0 ? completed / total : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$completed/$total',
            style: AppTextStyles.labelSmall.copyWith(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            height: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.success.withValues(alpha: 0.2),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.success),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionStepItem extends StatelessWidget {
  final int stepNumber;
  final String text;
  final bool isLast;
  final bool isCompleted;
  final bool isInteractive;
  final VoidCallback? onTap;

  const _ActionStepItem({
    required this.stepNumber,
    required this.text,
    required this.isLast,
    this.isCompleted = false,
    this.isInteractive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number or checkmark
          Column(
            children: [
              _buildStepIndicator(),
              // Connecting line
              if (!isLast)
                Container(
                  width: 2,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        isCompleted
                            ? AppColors.success
                            : AppColors.primary.withValues(alpha: 0.5),
                        _getNextStepCompleted()
                            ? AppColors.success
                            : AppColors.border,
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          // Step text
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.surfaceVariant.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isCompleted
                      ? AppColors.success.withValues(alpha: 0.3)
                      : AppColors.border.withValues(alpha: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isCompleted
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                        decoration:
                            isCompleted ? TextDecoration.lineThrough : null,
                        height: 1.4,
                      ),
                    ),
                  ),
                  if (isInteractive) ...[
                    const SizedBox(width: 8),
                    Icon(
                      isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      size: 20,
                      color: isCompleted
                          ? AppColors.success
                          : AppColors.textTertiary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    if (isCompleted) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.success,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.success.withValues(alpha: 0.3),
              blurRadius: 8,
            ),
          ],
        ),
        child: const Icon(
          Icons.check,
          size: 18,
          color: Colors.white,
        ),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$stepNumber',
          style: AppTextStyles.labelLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  bool _getNextStepCompleted() {
    // This is a simplified version - in a real app,
    // you'd pass this information from the parent
    return false;
  }
}

/// Compact version for inline display
class ActionStepsCompact extends StatelessWidget {
  final List<String> steps;
  final int maxSteps;

  const ActionStepsCompact({
    super.key,
    required this.steps,
    this.maxSteps = 3,
  });

  @override
  Widget build(BuildContext context) {
    final displaySteps = steps.take(maxSteps).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(displaySteps.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: index < displaySteps.length - 1 ? 8 : 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  displaySteps[index],
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
