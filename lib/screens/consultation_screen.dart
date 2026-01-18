import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../config/theme.dart';
import '../config/constants.dart';
import '../models/persona.dart';
import '../models/advice.dart';
import '../models/waiting_messages.dart';
import '../models/failure_messages.dart';
import '../providers/providers.dart';
import '../widgets/banner_ad_widget.dart';
import 'advice_detail_screen.dart';

/// Consultation screen - Single input wisdom request interface
class ConsultationScreen extends ConsumerStatefulWidget {
  final Persona persona;

  const ConsultationScreen({
    super.key,
    required this.persona,
  });

  @override
  ConsumerState<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends ConsumerState<ConsultationScreen>
    with TickerProviderStateMixin {
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isLoading = false;
  String? _errorMessage;
  String _waitingMessage = '';
  int _waitingMessageIndex = 0;
  String _userQuery = '';

  late AnimationController _pulseController;
  late AnimationController _glowController;
  late AnimationController _loadingController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    _focusNode.dispose();
    _pulseController.dispose();
    _glowController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categoryColor = _getCategoryColor(widget.persona.category);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Atmospheric background
          _buildAtmosphericBackground(categoryColor),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Banner ad at top - use different key for input vs loading to force reload
                StickyBannerAd(key: ValueKey('banner_${_isLoading ? 'loading' : 'input'}')),

                // Custom app bar
                _buildAppBar(l10n),

                // Scrollable content
                Expanded(
                  child: _isLoading
                      ? _buildLoadingState(l10n, categoryColor)
                      : _buildInputContent(l10n, categoryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAtmosphericBackground(Color categoryColor) {
    return Stack(
      children: [
        // Base gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                categoryColor.withOpacity(0.15),
                AppColors.background,
                AppColors.background,
              ],
              stops: const [0.0, 0.4, 1.0],
            ),
          ),
        ),

        // Radial glow from top
        Positioned(
          top: -100,
          left: 0,
          right: 0,
          child: AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                height: 400,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      categoryColor.withOpacity(_glowAnimation.value * 0.3),
                      Colors.transparent,
                    ],
                    radius: 0.8,
                  ),
                ),
              );
            },
          ),
        ),

        // Subtle noise texture overlay
        Positioned.fill(
          child: Opacity(
            opacity: 0.03,
            child: CustomPaint(
              painter: _NoisePainter(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            onPressed: () => Navigator.pop(context),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.surface.withOpacity(0.5),
            ),
          ),
          const Spacer(),
          // Era badge
          if (widget.persona.era != 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.border.withOpacity(0.5),
                ),
              ),
              child: Text(
                widget.persona.eraDisplay,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInputContent(AppLocalizations l10n, Color categoryColor) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 8),

          // Hero persona section
          _buildHeroSection(l10n, categoryColor),

          const SizedBox(height: 32),

          // Input section
          _buildInputSection(l10n, categoryColor),

          const SizedBox(height: 24),

          // Submit button
          _buildSubmitButton(l10n, categoryColor),

          // Error message
          if (_errorMessage != null) ...[
            const SizedBox(height: 16),
            _buildErrorMessage(l10n),
          ],

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeroSection(AppLocalizations l10n, Color categoryColor) {
    return Column(
      children: [
        // Persona portrait with glow
        AnimatedBuilder(
          animation: _pulseAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseAnimation.value,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: categoryColor.withOpacity(0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        categoryColor.withOpacity(0.8),
                        categoryColor.withOpacity(0.4),
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 56,
                    backgroundImage: AssetImage(widget.persona.imagePath),
                    onBackgroundImageError: (_, __) {},
                    backgroundColor: AppColors.surface,
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        // Name
        Text(
          _getPersonaName(widget.persona, l10n),
          style: AppTextStyles.displayMedium.copyWith(
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 6),

        // Title with category color
        Text(
          _getPersonaTitle(widget.persona, l10n),
          style: AppTextStyles.bodyMedium.copyWith(
            color: categoryColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        // Quote card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: categoryColor.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Text(
                _getPersonaQuote(widget.persona, l10n),
                style: AppTextStyles.quote.copyWith(
                  fontSize: 14,
                  height: 1.6,
                  color: AppColors.textPrimary.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputSection(AppLocalizations l10n, Color categoryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              l10n.inputTitle,
              style: AppTextStyles.titleMedium,
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Input field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? categoryColor.withOpacity(0.6)
                  : AppColors.border,
              width: _focusNode.hasFocus ? 2 : 1,
            ),
            boxShadow: _focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: categoryColor.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: TextField(
            controller: _inputController,
            focusNode: _focusNode,
            maxLength: AppConstants.maxInputLength,
            maxLines: 5,
            minLines: 4,
            style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
            decoration: InputDecoration(
              hintText: l10n.inputPlaceholder,
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.surface.withOpacity(0.8),
              contentPadding: const EdgeInsets.all(20),
            ),
            onChanged: (_) => setState(() {}),
            onTap: () => setState(() {}),
          ),
        ),

        // Character count
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${_inputController.text.length} / ${AppConstants.maxInputLength}',
              style: AppTextStyles.labelSmall.copyWith(
                color: _inputController.text.length > AppConstants.maxInputLength * 0.9
                    ? AppColors.warning
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(AppLocalizations l10n, Color categoryColor) {
    final isEnabled = _inputController.text.trim().isNotEmpty && !_isLoading;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: isEnabled ? _submitRequest : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: isEnabled
                  ? LinearGradient(
                      colors: [
                        categoryColor,
                        categoryColor.withOpacity(0.8),
                      ],
                    )
                  : null,
              color: isEnabled ? null : AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(16),
              boxShadow: isEnabled
                  ? [
                      BoxShadow(
                        color: categoryColor.withOpacity(_glowAnimation.value * 0.5),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: isEnabled ? Colors.white : AppColors.textTertiary,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Text(
                  l10n.seekWisdom,
                  style: AppTextStyles.labelLarge.copyWith(
                    color: isEnabled ? Colors.white : AppColors.textTertiary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
          Icon(Icons.error_outline, color: AppColors.error, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _errorMessage!,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.error,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            color: AppColors.error,
            onPressed: () => setState(() => _errorMessage = null),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(AppLocalizations l10n, Color categoryColor) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated persona with orbiting particles
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Orbiting particles
                  ...List.generate(8, (index) {
                    return AnimatedBuilder(
                      animation: _loadingController,
                      builder: (context, child) {
                        final angle = (index / 8) * 2 * math.pi +
                            _loadingController.value * 2 * math.pi;
                        final radius = 80.0;
                        final x = math.cos(angle) * radius;
                        final y = math.sin(angle) * radius;

                        return Transform.translate(
                          offset: Offset(x, y),
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: categoryColor.withOpacity(
                                0.3 + (index / 8) * 0.7,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: categoryColor.withOpacity(0.5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),

                  // Center persona
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: categoryColor.withOpacity(0.4),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(widget.persona.imagePath),
                      onBackgroundImageError: (_, __) {},
                      backgroundColor: AppColors.surface,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Persona name
            Text(
              _getPersonaName(widget.persona, l10n),
              style: AppTextStyles.headlineMedium,
            ),

            const SizedBox(height: 24),

            // Waiting message with fade animation
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                _waitingMessage.isNotEmpty ? _waitingMessage : l10n.chatLoading,
                key: ValueKey(_waitingMessage),
                style: AppTextStyles.bodyMedium.copyWith(
                  color: categoryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),

            // User's query preview
            if (_userQuery.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  children: [
                    Text(
                      l10n.adviceYourQuestion,
                      style: AppTextStyles.labelSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _userQuery,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),

            // Cancel button
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _isLoading = false;
                  _errorMessage = null;
                });
              },
              icon: const Icon(Icons.close, size: 18),
              label: Text(l10n.cancelRequest),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitRequest() async {
    final query = _inputController.text.trim();
    if (query.isEmpty || _isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _userQuery = query;
    });

    _focusNode.unfocus();
    _startWaitingMessageRotation();

    final locale = ref.read(localeProvider);
    final request = AdviceRequest(
      personaId: widget.persona.id,
      userQuery: query,
      locale: locale,
    );

    // Retry logic - try up to 3 times
    const maxRetries = 3;
    AdviceResponse? adviceResponse;

    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        // Ensure minimum 2 second loading time for ad display
        final results = await Future.wait([
          ref.read(adviceRequestProvider(request).future),
          Future.delayed(const Duration(seconds: 2)),
        ]);

        adviceResponse = results[0] as AdviceResponse;
        break; // Success, exit retry loop
      } catch (e) {
        if (attempt < maxRetries) {
          // Wait before retry
          await Future.delayed(Duration(seconds: attempt));
        }
      }
    }

    if (!mounted) return;

    // If all retries failed, show persona-specific error popup
    if (adviceResponse == null) {
      setState(() {
        _isLoading = false;
      });
      _showFailureDialog(locale.languageCode);
      return;
    }

    // Note: History is already saved via adviceRequestProvider
    // Note: Ad is shown via adviceProvider.onAdviceReceived()
    if (!mounted) return;

    // Create advice record for navigation (already saved in provider)
    final record = AdviceRecord(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      personaId: widget.persona.id,
      userQuery: query,
      response: adviceResponse,
      createdAt: DateTime.now(),
    );

    // Navigate to advice detail screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AdviceDetailScreen(
          record: record,
          persona: widget.persona,
        ),
      ),
    );
  }

  void _showFailureDialog(String languageCode) {
    final l10n = AppLocalizations.of(context)!;
    final personaMessage = FailureMessages.getMessage(
      widget.persona.id,
      languageCode: languageCode,
    );
    final personaName = _getPersonaName(widget.persona, l10n);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(widget.persona.imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                personaName,
                style: AppTextStyles.titleLarge,
              ),
            ),
          ],
        ),
        content: Text(
          personaMessage,
          style: AppTextStyles.bodyLarge.copyWith(
            fontStyle: FontStyle.italic,
            height: 1.6,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.ok),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _submitRequest(); // Retry
            },
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }

  void _startWaitingMessageRotation() {
    final locale = ref.read(localeProvider);
    final messages = WaitingMessages.getMessages(
      widget.persona.id,
      languageCode: locale.languageCode,
    );

    _waitingMessageIndex = 0;
    _waitingMessage = messages.isNotEmpty ? messages[0] : '';

    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!_isLoading || !mounted) return false;

      _waitingMessageIndex = (_waitingMessageIndex + 1) % messages.length;
      setState(() {
        _waitingMessage = messages[_waitingMessageIndex];
      });
      return _isLoading;
    });
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
      case 'vishnu': return l10n.personaVishnu;
      case 'tolstoy': return l10n.personaTolstoy;
      case 'luffy': return l10n.persona_luffy;
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
      case 'vishnu': return l10n.personaVishnuTitle;
      case 'tolstoy': return l10n.personaTolstoyTitle;
      case 'luffy': return l10n.persona_luffy_title;
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
      case 'vishnu': return l10n.personaVishnuQuote;
      case 'tolstoy': return l10n.personaTolstoyQuote;
      case 'luffy': return l10n.persona_luffy_quote;
      default: return '';
    }
  }
}

/// Custom painter for subtle noise texture
class _NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42);
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    for (int i = 0; i < 1000; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 0.5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
