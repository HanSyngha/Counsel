import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counsel/l10n/generated/app_localizations.dart';

import '../models/persona.dart';
import '../models/waiting_messages.dart';
import '../config/theme.dart';

/// Animated loading indicator with persona-specific waiting messages.
/// Shows a beautiful loading animation with rotating messages from the persona.
class LoadingIndicator extends ConsumerStatefulWidget {
  final Persona? persona;
  final String? customMessage;
  final bool showCancel;
  final VoidCallback? onCancel;
  final double size;

  const LoadingIndicator({
    super.key,
    this.persona,
    this.customMessage,
    this.showCancel = false,
    this.onCancel,
    this.size = 100,
  });

  @override
  ConsumerState<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends ConsumerState<LoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _fadeController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _fadeAnimation;

  String _currentMessage = '';
  Timer? _messageTimer;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    // Rotation animation for the outer ring
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Pulse animation for the inner circle
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    // Fade animation for message transitions
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    _updateMessage();
    _startMessageRotation();
  }

  void _startMessageRotation() {
    _messageTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      _fadeController.reverse().then((_) {
        _updateMessage();
        _fadeController.forward();
      });
    });
    _fadeController.forward();
  }

  void _updateMessage() {
    if (widget.customMessage != null) {
      setState(() => _currentMessage = widget.customMessage!);
      return;
    }

    final personaId = widget.persona?.id;
    if (personaId != null) {
      final messages = WaitingMessages.getMessages(personaId);
      setState(() {
        _currentMessage = messages[_random.nextInt(messages.length)];
      });
    } else {
      setState(() => _currentMessage = '"Wisdom is being gathered..."');
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _fadeController.dispose();
    _messageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Persona image with loading animation
        if (widget.persona != null) _buildPersonaLoader() else _buildGenericLoader(),
        const SizedBox(height: 24),
        // Connecting text
        if (widget.persona != null) ...[
          Text(
            l10n.loadingConnecting,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _getPersonaName(l10n),
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          // Online indicator
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.success.withValues(alpha: 0.5),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                l10n.loadingOnline,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 24),
        // Rotating message
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              _currentMessage,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Cancel button
        if (widget.showCancel) ...[
          const SizedBox(height: 32),
          TextButton.icon(
            onPressed: widget.onCancel,
            icon: const Icon(Icons.close, size: 18),
            label: Text(l10n.cancelRequest),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textTertiary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPersonaLoader() {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer rotating ring
          AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * pi,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _GradientRingPainter(),
                ),
              );
            },
          ),
          // Pulsing persona image
          ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              width: widget.size * 0.75,
              height: widget.size * 0.75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  widget.persona!.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.surfaceVariant,
                      child: Icon(
                        Icons.person,
                        size: widget.size * 0.4,
                        color: AppColors.textTertiary,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenericLoader() {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer rotating ring
          AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * pi,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _GradientRingPainter(),
                ),
              );
            },
          ),
          // Inner pulsing circle with icon
          ScaleTransition(
            scale: _pulseAnimation,
            child: Container(
              width: widget.size * 0.6,
              height: widget.size * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surfaceVariant,
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.auto_awesome,
                size: widget.size * 0.25,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getPersonaName(AppLocalizations l10n) {
    if (widget.persona == null) return '';

    switch (widget.persona!.id) {
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
      default:
        return widget.persona!.nameKey;
    }
  }
}

/// Custom painter for the gradient rotating ring
class _GradientRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 3.0;

    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = SweepGradient(
        colors: [
          AppColors.primary.withValues(alpha: 0.0),
          AppColors.primary.withValues(alpha: 0.3),
          AppColors.primary,
          AppColors.primaryLight,
          AppColors.primary.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
      ).createShader(rect);

    canvas.drawArc(
      rect,
      0,
      2 * pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Simple loading spinner with optional message
class SimpleLoadingIndicator extends StatelessWidget {
  final String? message;
  final double size;
  final Color? color;

  const SimpleLoadingIndicator({
    super.key,
    this.message,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              color ?? AppColors.primary,
            ),
          ),
        ),
        if (message != null) ...[
          const SizedBox(height: 12),
          Text(
            message!,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
