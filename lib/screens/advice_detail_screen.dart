import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:path_provider/path_provider.dart';

import '../config/theme.dart';
import '../config/persona_themes.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../providers/providers.dart';
import '../widgets/banner_ad_widget.dart';
import '../widgets/themed_markdown.dart';
import '../widgets/emphasis_text.dart';

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
  late PersonaTheme _personaTheme;
  late bool _hasCustomTheme;
  final WidgetsToImageController _imageController = WidgetsToImageController();
  bool _isSharing = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.record.isFavorite;
    _persona = widget.persona ?? PersonaData.getById(widget.record.personaId);
    _personaTheme = PersonaThemes.getTheme(widget.record.personaId);
    _hasCustomTheme = PersonaThemes.hasCustomTheme(widget.record.personaId);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final response = widget.record.response;
    final themeColor = _hasCustomTheme
        ? _personaTheme.primaryColor
        : (_persona != null ? _getCategoryColor(_persona!.category) : AppColors.primary);

    return Scaffold(
      backgroundColor: _hasCustomTheme ? _personaTheme.backgroundColor : AppColors.background,
      body: Stack(
        children: [
          // Hidden widget for image capture
          Positioned(
            left: -1000,
            top: -1000,
            child: WidgetsToImage(
              controller: _imageController,
              child: _buildShareableCard(l10n),
            ),
          ),

          // Main content
          SafeArea(
            top: false,
            child: Column(
              children: [
                // Banner ad at top
                const SafeArea(
                  bottom: false,
                  child: StickyBannerAd(),
                ),

                // Scrollable content
                Expanded(
                  child: CustomScrollView(
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
                              _buildAdviceSection(response.advice, response.emphasis, l10n),
                              const SizedBox(height: 24),

                              // Action Steps Section
                              _buildActionStepsSection(response.actionSteps, l10n),
                              const SizedBox(height: 24),

                              // Closing Words Section
                              _buildClosingWordsSection(response.closingWords, l10n),
                              const SizedBox(height: 40),

                              // Action Buttons
                              _buildActionButtons(l10n),

                              // Extra bottom margin for easier button access
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(AppLocalizations l10n) {
    final bgColor = _hasCustomTheme ? _personaTheme.backgroundColor : AppColors.background;
    final themeColor = _hasCustomTheme
        ? _personaTheme.primaryColor
        : (_persona != null ? _getCategoryColor(_persona!.category) : AppColors.primary);

    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: bgColor,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: bgColor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: _hasCustomTheme ? _personaTheme.accentColor : null,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? AppColors.error : (_hasCustomTheme ? _personaTheme.accentColor : null),
            ),
          ),
          onPressed: _toggleFavorite,
        ),
        IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.share,
              color: _hasCustomTheme ? _personaTheme.accentColor : null,
            ),
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
                  return Container(color: _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surfaceVariant);
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
                    bgColor.withOpacity(0.8),
                    bgColor,
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
                      style: AppTextStyles.displaySmall.copyWith(
                        color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getPersonaTitle(_persona!, l10n),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: themeColor,
                      ),
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
    final surfaceColor = _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surfaceVariant;
    final borderColor = _hasCustomTheme ? _personaTheme.secondaryColor.withOpacity(0.3) : AppColors.border;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.help_outline,
                color: _hasCustomTheme ? _personaTheme.accentColor.withOpacity(0.6) : AppColors.textTertiary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                l10n.adviceYourQuestion,
                style: AppTextStyles.labelMedium.copyWith(
                  color: _hasCustomTheme ? _personaTheme.accentColor.withOpacity(0.7) : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.record.userQuery,
            style: AppTextStyles.bodyLarge.copyWith(
              color: _hasCustomTheme ? _personaTheme.accentColor : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCitationSection(Citation citation, AppLocalizations l10n) {
    final themeColor = _hasCustomTheme ? _personaTheme.primaryColor : AppColors.primary;
    final surfaceColor = _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surfaceVariant;
    final bgColor = _hasCustomTheme ? _personaTheme.backgroundColor : AppColors.background;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            themeColor.withOpacity(0.1),
            surfaceColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themeColor.withOpacity(0.3)),
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
                  color: themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.format_quote, color: themeColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceCitation,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Original Citation (원어)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border(
                left: BorderSide(color: themeColor, width: 4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Original text (원어)
                Text(
                  '"${citation.originalText}"',
                  style: AppTextStyles.quote.copyWith(
                    height: 1.8,
                    fontStyle: FontStyle.italic,
                    color: _hasCustomTheme ? _personaTheme.accentColor : null,
                  ),
                  softWrap: true,
                ),
                // Show translation if different from original
                if (citation.translatedText != citation.originalText) ...[
                  const SizedBox(height: 12),
                  Divider(
                    height: 1,
                    color: _hasCustomTheme ? _personaTheme.secondaryColor.withOpacity(0.3) : null,
                  ),
                  const SizedBox(height: 12),
                  // Translated text
                  Text(
                    '"${citation.translatedText}"',
                    style: AppTextStyles.bodyLarge.copyWith(
                      height: 1.7,
                      color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
                    ),
                    softWrap: true,
                  ),
                ],
              ],
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
              color: bgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: _hasCustomTheme ? _personaTheme.buttonGlowColor : AppColors.warning, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      l10n.adviceRelevance,
                      style: AppTextStyles.labelMedium.copyWith(
                        color: _hasCustomTheme ? _personaTheme.buttonGlowColor : AppColors.warning,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ThemedMarkdown(
                  data: citation.relevance,
                  personaTheme: _personaTheme,
                  hasCustomTheme: _hasCustomTheme,
                  baseTextStyle: AppTextStyles.bodyMedium.copyWith(
                    height: 1.6,
                    color: _hasCustomTheme ? _personaTheme.accentColor.withOpacity(0.8) : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceDetails(CitationSource source, AppLocalizations l10n) {
    final bgColor = _hasCustomTheme ? _personaTheme.backgroundColor : AppColors.background;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.3),
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

  Widget _buildAdviceSection(String advice, Emphasis? emphasis, AppLocalizations l10n) {
    final surfaceColor = _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surface;
    final borderColor = _hasCustomTheme ? _personaTheme.secondaryColor.withOpacity(0.3) : AppColors.border;
    final accentColor = _hasCustomTheme ? _personaTheme.primaryColor : AppColors.success;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.psychology, color: accentColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceMainCounsel,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: accentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // emphasis가 있으면 강조 표시 위젯 사용, 없으면 기존 마크다운
          if (emphasis != null && emphasis.text.isNotEmpty)
            _buildAdviceWithEmphasis(advice, emphasis)
          else
            ThemedMarkdown(
              data: advice,
              personaTheme: _personaTheme,
              hasCustomTheme: _hasCustomTheme,
              baseTextStyle: AppTextStyles.bodyLarge.copyWith(
                height: 1.8,
                color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
              ),
            ),
        ],
      ),
    );
  }

  /// 강조 표시가 포함된 조언 텍스트 빌드
  Widget _buildAdviceWithEmphasis(String advice, Emphasis emphasis) {
    // 마크다운에서 일반 텍스트 추출 (간단한 처리)
    final plainText = _stripMarkdown(advice);

    return EmphasisText(
      text: plainText,
      emphasis: emphasis,
      baseTextStyle: AppTextStyles.bodyLarge.copyWith(
        height: 1.8,
        color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
      ),
      personaTheme: _personaTheme,
      hasCustomTheme: _hasCustomTheme,
      underlineColor: const Color(0xFFE53935), // 빨간 밑줄
      starColor: Colors.amber, // 노란 별표
      enableAnimation: true,
    );
  }

  /// 마크다운 문법 제거하여 일반 텍스트 추출
  String _stripMarkdown(String markdown) {
    String text = markdown;
    // 볼드 제거: **text** -> text
    text = text.replaceAll(RegExp(r'\*\*(.+?)\*\*'), r'$1');
    // 이탤릭 제거: *text* -> text
    text = text.replaceAll(RegExp(r'\*(.+?)\*'), r'$1');
    // 헤더 제거: # text -> text
    text = text.replaceAll(RegExp(r'^#+\s*', multiLine: true), '');
    // 리스트 마커 제거: - text -> text
    text = text.replaceAll(RegExp(r'^\s*[-*]\s+', multiLine: true), '');
    // 번호 리스트 제거: 1. text -> text
    text = text.replaceAll(RegExp(r'^\s*\d+\.\s+', multiLine: true), '');
    // 인라인 코드 제거: `code` -> code
    text = text.replaceAll(RegExp(r'`(.+?)`'), r'$1');
    // 링크 제거: [text](url) -> text
    text = text.replaceAll(RegExp(r'\[(.+?)\]\(.+?\)'), r'$1');
    return text.trim();
  }

  Widget _buildActionStepsSection(List<String> actionSteps, AppLocalizations l10n) {
    final surfaceColor = _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surface;
    final borderColor = _hasCustomTheme ? _personaTheme.secondaryColor.withOpacity(0.3) : AppColors.border;
    final headerColor = _hasCustomTheme ? _personaTheme.secondaryColor : AppColors.categoryHistory;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: headerColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.checklist, color: headerColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceActionSteps,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: headerColor,
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
                      gradient: _hasCustomTheme
                          ? LinearGradient(colors: _personaTheme.gradientColors)
                          : AppColors.primaryGradient,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: _hasCustomTheme ? _personaTheme.textOnPrimary : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _hasCustomTheme ? _personaTheme.backgroundColor.withOpacity(0.5) : AppColors.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ThemedMarkdown(
                        data: step,
                        personaTheme: _personaTheme,
                        hasCustomTheme: _hasCustomTheme,
                        baseTextStyle: AppTextStyles.bodyMedium.copyWith(
                          color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
                          height: 1.6,
                        ),
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
    final themeColor = _hasCustomTheme ? _personaTheme.primaryColor : AppColors.primary;
    final surfaceColor = _hasCustomTheme ? _personaTheme.surfaceColor : AppColors.surfaceVariant;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            surfaceColor,
            themeColor.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themeColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.auto_awesome, color: themeColor, size: 24),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.adviceClosingWords,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: themeColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '"$closingWords"',
            style: AppTextStyles.quote.copyWith(
              fontSize: 18,
              color: _hasCustomTheme ? _personaTheme.accentColor : AppColors.textPrimary,
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
                  color: _hasCustomTheme ? _personaTheme.accentColor.withOpacity(0.7) : AppColors.textSecondary,
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
    final citation = response.citation;
    final citationText = citation.originalText != citation.translatedText
        ? '"${citation.originalText}"\n\n"${citation.translatedText}"'
        : '"${citation.translatedText}"';

    final text = '''
${l10n.adviceCitation}:
$citationText
- ${citation.source.name}, ${citation.source.location}

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

  // App store link (placeholder for now)
  static const String _appLink = 'https://play.google.com/store/apps/details?id=com.counsel.app';

  Future<void> _shareAdvice(AppLocalizations l10n) async {
    if (_isSharing) return;

    setState(() => _isSharing = true);

    try {
      // Capture the shareable card as image
      final Uint8List? bytes = await _imageController.capture();

      if (bytes == null) {
        throw Exception('Failed to capture image');
      }

      // Save to temp file
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/counsel_wisdom_${DateTime.now().millisecondsSinceEpoch}.png');
      await file.writeAsBytes(bytes);

      final personaName = _persona != null ? _getPersonaName(_persona!, l10n) : '';

      // Share text with original question and app link
      final shareText = '''${l10n.appTitle} - $personaName

${l10n.adviceYourQuestion}: ${widget.record.userQuery}

$_appLink''';

      // Share the image
      await Share.shareXFiles(
        [XFile(file.path)],
        text: shareText,
        subject: '${l10n.appTitle} - $personaName',
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.adviceShareError)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSharing = false);
      }
    }
  }

  Widget _buildShareableCard(AppLocalizations l10n) {
    final response = widget.record.response;
    final personaName = _persona != null ? _getPersonaName(_persona!, l10n) : '';
    final categoryColor = _persona != null ? _getCategoryColor(_persona!.category) : AppColors.primary;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 400,
        maxWidth: 500,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: categoryColor.withOpacity(0.3), width: 2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          // Header with persona
          Row(
            children: [
              if (_persona != null)
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(_persona!.imagePath),
                  onBackgroundImageError: (_, __) {},
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      personaName,
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (_persona != null)
                      Text(
                        _getPersonaTitle(_persona!, l10n),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: categoryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // User's original question
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.help_outline, color: AppColors.textTertiary, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.record.userQuery,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Citation quote
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: categoryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border(
                left: BorderSide(color: categoryColor, width: 4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${response.citation.originalText}"',
                  style: AppTextStyles.quote.copyWith(
                    fontSize: 12,
                    height: 1.5,
                    color: AppColors.textSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                if (response.citation.translatedText != response.citation.originalText) ...[
                  const SizedBox(height: 8),
                  Text(
                    '"${response.citation.translatedText}"',
                    style: AppTextStyles.bodySmall.copyWith(
                      height: 1.5,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                // Source info
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.background.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.menu_book, size: 12, color: categoryColor),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${response.citation.source.name} · ${response.citation.source.location}${response.citation.source.year != null && response.citation.source.year!.isNotEmpty ? ' · ${response.citation.source.year}' : ''}',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 10,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Main advice (full) with markdown rendering
          ThemedMarkdownForImage(
            data: response.advice,
            categoryColor: categoryColor,
            baseTextStyle: AppTextStyles.bodyMedium.copyWith(
              height: 1.6,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),

          // Closing words
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '"${response.closingWords}"',
              style: AppTextStyles.bodySmall.copyWith(
                fontStyle: FontStyle.italic,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // App branding
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, size: 16, color: categoryColor),
              const SizedBox(width: 6),
              Text(
                l10n.appTitle,
                style: AppTextStyles.labelMedium.copyWith(
                  color: categoryColor,
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }

  Color _getCategoryColor(PersonaCategory category) {
    switch (category) {
      case PersonaCategory.philosophy:
        return AppColors.categoryPhilosophy;
      case PersonaCategory.religion:
        return AppColors.categoryReligion;
      case PersonaCategory.history:
        return AppColors.categoryHistory;
      case PersonaCategory.literature:
        return AppColors.categoryLiterature;
      case PersonaCategory.anime:
        return AppColors.categoryAnime;
    }
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
      case 'vishnu': return l10n.personaVishnuTitle;
      case 'luffy': return l10n.persona_luffy_title;
      case 'gon_freecss': return l10n.persona_gon_freecss_title;
      case 'natsu_dragneel': return l10n.persona_natsu_dragneel_title;
      case 'izuku_midoriya': return l10n.persona_izuku_midoriya_title;
      case 'son_goku': return l10n.persona_son_goku_title;
      case 'edward_elric': return l10n.persona_edward_elric_title;
      case 'eren_yeager': return l10n.persona_eren_yeager_title;
      case 'naruto_uzumaki': return l10n.persona_naruto_uzumaki_title;
      case 'tsunayoshi_sawada': return l10n.persona_tsunayoshi_sawada_title;
      case 'tanjiro_kamado': return l10n.persona_tanjiro_kamado_title;
      case 'ichigo_kurosaki': return l10n.persona_ichigo_kurosaki_title;
      case 'martin_luther_king': return l10n.persona_martin_luther_king_title;
      case 'albert_einstein': return l10n.persona_albert_einstein_title;
      case 'julius_caesar': return l10n.persona_julius_caesar_title;
      case 'david': return l10n.persona_david_title;
      case 'aslan': return l10n.persona_aslan_title;
      case 'jean_valjean': return l10n.persona_jean_valjean_title;
      case 'liu_bei': return l10n.persona_liu_bei_title;
      case 'zhuge_liang': return l10n.persona_zhuge_liang_title;
      case 'cao_cao': return l10n.persona_cao_cao_title;
      default: return '';
    }
  }
}
