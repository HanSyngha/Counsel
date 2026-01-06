import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../config/constants.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../models/waiting_messages.dart';
import '../providers/providers.dart';
import '../widgets/banner_ad_widget.dart';
import 'advice_detail_screen.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final Persona persona;

  const ChatScreen({
    super.key,
    required this.persona,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  bool _isLoading = false;
  String? _errorMessage;
  AdviceResponse? _currentAdvice;
  String _waitingMessage = '';
  int _waitingMessageIndex = 0;

  late AnimationController _typingAnimationController;

  @override
  void initState() {
    super.initState();
    _typingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _typingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: _buildAppBar(l10n),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: _buildChatContent(l10n),
            ),
            const StickyBannerAd(),
            _buildInputArea(l10n),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(AppLocalizations l10n) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(widget.persona.imagePath),
            onBackgroundImageError: (_, __) {},
            backgroundColor: AppColors.surfaceVariant,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getPersonaName(widget.persona, l10n),
                  style: AppTextStyles.titleMedium,
                ),
                Text(
                  _getPersonaTitle(widget.persona, l10n),
                  style: AppTextStyles.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatContent(AppLocalizations l10n) {
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        // Persona Introduction
        _buildPersonaIntroCard(l10n),
        const SizedBox(height: 20),

        // Prompt suggestions
        if (_currentAdvice == null && !_isLoading) ...[
          Text(
            l10n.chatSuggestionsTitle,
            style: AppTextStyles.labelMedium,
          ),
          const SizedBox(height: 12),
          _buildSuggestionChips(l10n),
          const SizedBox(height: 20),
        ],

        // Loading indicator
        if (_isLoading) _buildLoadingIndicator(l10n),

        // Error message
        if (_errorMessage != null) _buildErrorMessage(l10n),

        // Advice response
        if (_currentAdvice != null) _buildAdvicePreview(l10n),
      ],
    );
  }

  Widget _buildPersonaIntroCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(widget.persona.imagePath),
            onBackgroundImageError: (_, __) {},
            backgroundColor: AppColors.surface,
          ),
          const SizedBox(height: 12),
          Text(
            _getPersonaName(widget.persona, l10n),
            style: AppTextStyles.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            _getPersonaTitle(widget.persona, l10n),
            style: AppTextStyles.bodyMedium,
          ),
          if (widget.persona.era != 0) ...[
            const SizedBox(height: 4),
            Text(
              widget.persona.eraDisplay,
              style: AppTextStyles.labelSmall.copyWith(
                color: _getCategoryColor(widget.persona.category),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Text(
            '"${_getPersonaQuote(widget.persona, l10n)}"',
            style: AppTextStyles.quote.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.chatIntroMessage,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionChips(AppLocalizations l10n) {
    final suggestions = [
      l10n.chatSuggestion1,
      l10n.chatSuggestion2,
      l10n.chatSuggestion3,
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: suggestions.map((suggestion) {
        return ActionChip(
          label: Text(
            suggestion,
            style: AppTextStyles.bodySmall,
          ),
          backgroundColor: AppColors.surface,
          side: const BorderSide(color: AppColors.border),
          onPressed: () {
            _messageController.text = suggestion;
            _sendMessage();
          },
        );
      }).toList(),
    );
  }

  Widget _buildLoadingIndicator(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // Animated typing indicator
          AnimatedBuilder(
            animation: _typingAnimationController,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final delay = index * 0.2;
                  final animationValue = (_typingAnimationController.value + delay) % 1.0;
                  final opacity = (1 - animationValue).clamp(0.3, 1.0);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(opacity),
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            _waitingMessage.isNotEmpty ? _waitingMessage : l10n.chatLoading,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _errorMessage!,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            color: AppColors.error,
            onPressed: () {
              setState(() => _errorMessage = null);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAdvicePreview(AppLocalizations l10n) {
    return GestureDetector(
      onTap: () => _navigateToAdviceDetail(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Citation preview
            Container(
              padding: const EdgeInsets.all(12),
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
                      Icon(
                        Icons.format_quote,
                        color: AppColors.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.adviceCitation,
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentAdvice!.citation.text,
                    style: AppTextStyles.quote.copyWith(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Advice preview
            Text(
              _currentAdvice!.advice,
              style: AppTextStyles.bodyLarge,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),

            // View full button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: _navigateToAdviceDetail,
                  icon: const Icon(Icons.arrow_forward),
                  label: Text(l10n.chatViewFullAdvice),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea(AppLocalizations l10n) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              focusNode: _focusNode,
              maxLength: AppConstants.maxInputLength,
              maxLines: 4,
              minLines: 1,
              style: AppTextStyles.bodyLarge,
              decoration: InputDecoration(
                hintText: l10n.chatInputHint,
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.surfaceVariant,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: _isLoading ? null : _sendMessage,
              icon: Icon(
                _isLoading ? Icons.hourglass_empty : Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final query = _messageController.text.trim();
    if (query.isEmpty || _isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _currentAdvice = null;
    });

    _messageController.clear();
    _focusNode.unfocus();

    // Start waiting message rotation
    _startWaitingMessageRotation();

    try {
      final locale = ref.read(localeProvider);
      final request = AdviceRequest(
        personaId: widget.persona.id,
        userQuery: query,
        locale: locale,
      );

      final adviceAsync = await ref.read(adviceRequestProvider(request).future);

      setState(() {
        _currentAdvice = adviceAsync;
        _isLoading = false;
      });

      // Show interstitial ad every 5 requests
      final adService = ref.read(adServiceProvider);
      await adService.onAdviceReceived();

      // Scroll to bottom to show response
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _startWaitingMessageRotation() {
    final messages = WaitingMessages.getMessages(
      ref.read(localeProvider).languageCode,
    );

    _waitingMessageIndex = 0;
    _waitingMessage = messages.isNotEmpty ? messages[0] : '';

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!_isLoading) return false;

      _waitingMessageIndex = (_waitingMessageIndex + 1) % messages.length;
      if (mounted) {
        setState(() {
          _waitingMessage = messages[_waitingMessageIndex];
        });
      }
      return _isLoading;
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: AppConstants.animationNormal,
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _navigateToAdviceDetail() {
    if (_currentAdvice == null) return;

    final record = AdviceRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      personaId: widget.persona.id,
      userQuery: _messageController.text,
      response: _currentAdvice!,
      createdAt: DateTime.now(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdviceDetailScreen(
          record: record,
          persona: widget.persona,
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
      default: return '';
    }
  }

  String _getPersonaQuote(Persona persona, AppLocalizations l10n) {
    switch (persona.id) {
      case 'socrates': return l10n.personaSocratesQuote;
      case 'plato': return l10n.personaPlatoQuote;
      case 'aristotle': return l10n.personaAristotleQuote;
      case 'seneca': return l10n.personaSenecaQuote;
      case 'confucius': return l10n.personaConfuciusQuote;
      case 'laozi': return l10n.personaLaoziQuote;
      case 'jesus': return l10n.personaJesusQuote;
      case 'buddha': return l10n.personaBuddhaQuote;
      case 'muhammad': return l10n.personaMuhammadQuote;
      case 'lincoln': return l10n.personaLincolnQuote;
      case 'napoleon': return l10n.personaNapoleonQuote;
      case 'steve_jobs': return l10n.personaSteveJobsQuote;
      case 'sherlock_holmes': return l10n.personaSherlockHolmesQuote;
      case 'dumbledore': return l10n.personaDumbledoreQuote;
      case 'gandhi': return l10n.personaGandhiQuote;
      case 'rumi': return l10n.personaRumiQuote;
      case 'krishna': return l10n.personaKrishnaQuote;
      case 'brahma': return l10n.personaBrahmaQuote;
      case 'tolstoy': return l10n.personaTolstoyQuote;
      case 'vishnu': return l10n.personaVishnuQuote;
      default: return '';
    }
  }
}
