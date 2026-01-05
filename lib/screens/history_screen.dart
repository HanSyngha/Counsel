import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../providers/providers.dart';
import 'advice_detail_screen.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final history = ref.watch(adviceHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyTitle),
        actions: [
          if (history.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _showClearHistoryDialog(context, ref, l10n),
            ),
        ],
      ),
      body: history.isEmpty
          ? _buildEmptyState(l10n)
          : _buildHistoryList(context, ref, history, l10n),
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.historyEmpty,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.historyEmptySubtitle,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryList(
    BuildContext context,
    WidgetRef ref,
    List<AdviceRecord> history,
    AppLocalizations l10n,
  ) {
    // Group by date
    final groupedHistory = _groupByDate(history);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: groupedHistory.length,
      itemBuilder: (context, index) {
        final entry = groupedHistory.entries.elementAt(index);
        final date = entry.key;
        final records = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _formatDateHeader(date, l10n),
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            ...records.map((record) => _buildHistoryCard(
                  context,
                  ref,
                  record,
                  l10n,
                )),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  Widget _buildHistoryCard(
    BuildContext context,
    WidgetRef ref,
    AdviceRecord record,
    AppLocalizations l10n,
  ) {
    final persona = PersonaData.getById(record.personaId);
    final timeFormat = DateFormat.jm();

    return Dismissible(
      key: Key(record.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        return await _showDeleteConfirmDialog(context, l10n);
      },
      onDismissed: (direction) {
        ref.read(adviceHistoryProvider.notifier).deleteAdvice(record.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.historyDeleted)),
        );
      },
      child: GestureDetector(
        onTap: () => _navigateToDetail(context, record, persona),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              // Persona avatar
              CircleAvatar(
                radius: 24,
                backgroundImage: persona != null
                    ? AssetImage(persona.imagePath)
                    : null,
                backgroundColor: AppColors.surfaceVariant,
                child: persona == null
                    ? const Icon(Icons.person, color: AppColors.textTertiary)
                    : null,
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (persona != null)
                          Text(
                            _getPersonaName(persona, l10n),
                            style: AppTextStyles.titleMedium,
                          ),
                        const Spacer(),
                        Text(
                          timeFormat.format(record.createdAt),
                          style: AppTextStyles.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.userQuery,
                      style: AppTextStyles.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '"${record.response.citation.text}"',
                      style: AppTextStyles.bodySmall.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Favorite indicator
              if (record.isFavorite)
                Icon(
                  Icons.favorite,
                  color: AppColors.error,
                  size: 18,
                ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<DateTime, List<AdviceRecord>> _groupByDate(List<AdviceRecord> history) {
    final grouped = <DateTime, List<AdviceRecord>>{};

    for (final record in history) {
      final date = DateTime(
        record.createdAt.year,
        record.createdAt.month,
        record.createdAt.day,
      );
      grouped.putIfAbsent(date, () => []).add(record);
    }

    return grouped;
  }

  String _formatDateHeader(DateTime date, AppLocalizations l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (date == today) {
      return l10n.historyToday;
    } else if (date == yesterday) {
      return l10n.historyYesterday;
    } else {
      return DateFormat.yMMMd().format(date);
    }
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

  Future<bool> _showDeleteConfirmDialog(
    BuildContext context,
    AppLocalizations l10n,
  ) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.surface,
            title: Text(l10n.historyDeleteTitle),
            content: Text(l10n.historyDeleteMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
                child: Text(l10n.delete),
              ),
            ],
          ),
        ) ??
        false;
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
        title: Text(l10n.historyClearTitle),
        content: Text(l10n.historyClearMessage),
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
                SnackBar(content: Text(l10n.historyCleared)),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.clear),
          ),
        ],
      ),
    );
  }

  String _getPersonaName(Persona persona, AppLocalizations l10n) {
    final formattedKey = persona.nameKey.replaceAll('persona_', '').replaceAll('_', ' ');
    return formattedKey.split(' ').map((word) =>
      word.isNotEmpty ? '${word[0].toUpperCase()}${word.substring(1)}' : ''
    ).join(' ');
  }
}
