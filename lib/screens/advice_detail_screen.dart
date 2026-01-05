import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

import '../config/theme.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../providers/providers.dart';

class AdviceDetailScreen extends ConsumerStatefulWidget {
  final AdviceRecord record;
  final Persona? persona;

  const AdviceDetailScreen({
    super.key,
    required this.record,
    this.persona,
  });

  @override
  ConsumerState<AdviceDetailScreen> createState() => _AdviceDetailScreenState();
}

class _AdviceDetailScreenState extends ConsumerState<AdviceDetailScreen> {
  late bool _isFavorite;
  late Persona? _persona;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.record.isFavorite;
    _persona = widget.persona ?? PersonaData.getById(widget.record.personaId);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final response = widget.record.response;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with persona image
          _buildSliverAppBar(l10n),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User's Question
                  _buildUserQuestion(l10n),
                  const SizedBox(height: 24),

                  // Citation Section
                  _buildCitationSection(response.citation, l10n),
                  const SizedBox(height: 24),

                  // Main Advice Section
                  _buildAdviceSection(response.advice, l10n),
                  const SizedBox(height: 24),

                  // Action Steps Section
                  _buildActionStepsSection(response.actionSteps, l10n),
                  const SizedBox(height: 24),

                  // Closing Words Section
                  _buildClosingWordsSection(response.closingWords, l10n),
                  const SizedBox(height: 40),

                  // Action Buttons
                  _buildActionButtons(l10n),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(AppLocalizations l10n) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? AppColors.error : null,
            ),
          ),
          onPressed: _toggleFavorite,
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.share),
          ),
          onPressed: () => _shareAdvice(l10n),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (_persona != null)
              Image.asset(
                _persona!.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: AppColors.surfaceVariant);
                },
              ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background.withOpacity(0.8),
                    AppColors.background,
                  ],
                  stops: const [0.0, 0.7, 1.0],
                ),
              ),
            ),
            // Persona info
            Positioned(
              bottom: 16,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_persona != null) ...[
                    Text(
                      _getPersonaName(_persona!, l10n),
                      style: AppTextStyles.displaySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getPersonaTitle(_persona!, l10n),
                      style: AppTextStyles.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserQuestion(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.help_outline, color: AppColors.textTertiary, size: 18),
              const SizedBox(width: 8),
              Text(
                l10n.adviceYourQuestion,
                style: AppTextStyles.labelMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.record.userQuery,
            style: AppTextStyles.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildCitationSection(Citation citation, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.surfaceVariant,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.format_quote, color: AppColors.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceCitation,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Citation Text (The Quote)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border(
                left: BorderSide(color: AppColors.primary, width: 4),
              ),
            ),
            child: Text(
              '"${citation.text}"',
              style: AppTextStyles.quote.copyWith(
                height: 1.8,
              ),
              softWrap: true,
            ),
          ),
          const SizedBox(height: 20),

          // Source Details
          _buildSourceDetails(citation.source, l10n),
          const SizedBox(height: 16),

          // Relevance
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: AppColors.warning, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      l10n.adviceRelevance,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: AppColors.warning,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  citation.relevance,
                  style: AppTextStyles.bodyMedium.copyWith(
                    height: 1.6,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceDetails(CitationSource source, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Source Type
          _buildSourceDetailRow(
            icon: Icons.category_outlined,
            label: l10n.adviceSourceType,
            value: _getSourceTypeName(source.type, l10n),
            color: AppColors.categoryPhilosophy,
          ),
          const Divider(height: 16),

          // Source Name
          _buildSourceDetailRow(
            icon: Icons.book_outlined,
            label: l10n.adviceSourceName,
            value: source.name,
            color: AppColors.categoryHistory,
          ),
          const Divider(height: 16),

          // Location
          _buildSourceDetailRow(
            icon: Icons.location_on_outlined,
            label: l10n.adviceSourceLocation,
            value: source.location,
            color: AppColors.categoryReligion,
          ),

          // Year (if available)
          if (source.year != null && source.year!.isNotEmpty) ...[
            const Divider(height: 16),
            _buildSourceDetailRow(
              icon: Icons.calendar_today_outlined,
              label: l10n.adviceSourceYear,
              value: source.year!,
              color: AppColors.categoryLiterature,
            ),
          ],
          const Divider(height: 16),

          // Context
          _buildSourceDetailRow(
            icon: Icons.history_edu_outlined,
            label: l10n.adviceSourceContext,
            value: source.context,
            color: AppColors.primary,
            isMultiLine: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSourceDetailRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    bool isMultiLine = false,
  }) {
    return Row(
      crossAxisAlignment: isMultiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdviceSection(String advice, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.psychology, color: AppColors.success, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceMainCounsel,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            advice,
            style: AppTextStyles.bodyLarge.copyWith(
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionStepsSection(List<String> actionSteps, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.categoryHistory.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.checklist, color: AppColors.categoryHistory, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceActionSteps,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.categoryHistory,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...actionSteps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        step,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          height: 1.6,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildClosingWordsSection(String closingWords, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.surfaceVariant,
            AppColors.primary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.auto_awesome, color: AppColors.primary, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceClosingWords,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '"$closingWords"',
            style: AppTextStyles.quote.copyWith(
              fontSize: 18,
              color: AppColors.textPrimary,
              height: 1.7,
            ),
            softWrap: true,
          ),
          if (_persona != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '- ${_getPersonaName(_persona!, l10n)}',
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(AppLocalizations l10n) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _copyToClipboard(l10n),
            icon: const Icon(Icons.copy),
            label: Text(l10n.adviceCopy),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _shareAdvice(l10n),
            icon: const Icon(Icons.share),
            label: Text(l10n.adviceShare),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    ref.read(adviceHistoryProvider.notifier).toggleFavorite(widget.record.id);
    setState(() => _isFavorite = !_isFavorite);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite
              ? AppLocalizations.of(context)!.adviceAddedToFavorites
              : AppLocalizations.of(context)!.adviceRemovedFromFavorites,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _copyToClipboard(AppLocalizations l10n) {
    final response = widget.record.response;
    final text = '''
${l10n.adviceCitation}:
"${response.citation.text}"
- ${response.citation.source.name}, ${response.citation.source.location}

${l10n.adviceMainCounsel}:
${response.advice}

${l10n.adviceActionSteps}:
${response.actionSteps.asMap().entries.map((e) => '${e.key + 1}. ${e.value}').join('\n')}

${l10n.adviceClosingWords}:
"${response.closingWords}"
''';

    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.adviceCopied)),
    );
  }

  Future<void> _shareAdvice(AppLocalizations l10n) async {
    final response = widget.record.response;
    final personaName = _persona != null ? _getPersonaName(_persona!, l10n) : '';

    final shareText = '''
${l10n.appTitle} - $personaName

"${response.citation.text}"

${response.advice}

${l10n.adviceClosingWords}:
"${response.closingWords}"
''';

    await Share.share(shareText, subject: '${l10n.appTitle} - $personaName');
  }

  String _getSourceTypeName(SourceType type, AppLocalizations l10n) {
    switch (type) {
      case SourceType.scripture:
        return l10n.sourceTypeScripture;
      case SourceType.book:
        return l10n.sourceTypeBook;
      case SourceType.speech:
        return l10n.sourceTypeSpeech;
      case SourceType.battle:
        return l10n.sourceTypeBattle;
      case SourceType.letter:
        return l10n.sourceTypeLetter;
      case SourceType.dialogue:
        return l10n.sourceTypeDialogue;
      case SourceType.moment:
        return l10n.sourceTypeMoment;
      case SourceType.teaching:
        return l10n.sourceTypeTeaching;
      case SourceType.novel:
        return l10n.sourceTypeNovel;
    }
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
      default: return persona.id;
    }
  }

  String _getPersonaTitle(Persona persona, AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates': return l10n.personaSocratesTitle;
      case 'plato': return l10n.personaPlatoTitle;
      case 'aristotle': return l10n.personaAristotleTitle;
      case 'seneca': return l10n.personaSenecaTitle;
      case 'confucius': return l10n.personaConfuciusTitle;
      case 'laozi': return l10n.personaLaoziTitle;
      case 'jesus': return l10n.personaJesusTitle;
      case 'buddha': return l10n.personaBuddhaTitle;
      case 'muhammad': return l10n.personaMuhammadTitle;
      case 'lincoln': return l10n.personaLincolnTitle;
      case 'napoleon': return l10n.personaNapoleonTitle;
      case 'steve_jobs': return l10n.personaSteveJobsTitle;
      case 'sherlock_holmes': return l10n.personaSherlockHolmesTitle;
      case 'dumbledore': return l10n.personaDumbledoreTitle;
      case 'gandhi': return l10n.personaGandhiTitle;
      case 'rumi': return l10n.personaRumiTitle;
      case 'krishna': return l10n.personaKrishnaTitle;
      case 'brahma': return l10n.personaBrahmaTitle;
      case 'tolstoy': return l10n.personaTolstoyTitle;
      default: return '';
    }
  }
}
