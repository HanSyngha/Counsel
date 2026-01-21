import 'dart:ui';
import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../config/persona_themes.dart';

/// A glassmorphism styled card widget with blur effect
class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double blurAmount;
  final Color? accentColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.padding,
    this.margin,
    this.blurAmount = 10,
    this.accentColor,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
          child: GestureDetector(
            onTap: onTap,
            onLongPress: onLongPress,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.15),
                    Colors.white.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                  if (accentColor != null)
                    BoxShadow(
                      color: accentColor!.withValues(alpha: 0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

/// A persona card with glassmorphism effect for carousel
class GlassPersonaCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String title;
  final String? era;
  final String? sourceTag;
  final Color categoryColor;
  final String? personaId;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const GlassPersonaCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.title,
    this.era,
    this.sourceTag,
    required this.categoryColor,
    this.personaId,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    // Get persona-specific image background color if personaId is provided
    final bgColor = personaId != null
        ? PersonaThemes.getImageBackgroundColor(personaId!)
        : categoryColor;

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: 155,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Stack(
          children: [
            // Background image with solid color background
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Stack(
                children: [
                  // Solid background color for empty space (persona theme color)
                  Positioned.fill(
                    child: Container(
                      color: bgColor.withValues(alpha: 0.25),
                    ),
                  ),
                  // Full image - centered vertically
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: bgColor.withValues(alpha: 0.3),
                            child: const Icon(
                              Icons.person,
                              size: 48,
                              color: AppColors.textTertiary,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Bottom overlay for text readability
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            AppColors.background.withValues(alpha: 0.7),
                            AppColors.background.withValues(alpha: 0.95),
                          ],
                          stops: const [0.0, 0.35, 0.65, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Glass border overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            // Category accent line
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: categoryColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            // Content
            Positioned(
              left: 12,
              right: 12,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name with optional sourceTag
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.titleSmall.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.5),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (sourceTag != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          sourceTag!,
                          style: AppTextStyles.labelSmall.copyWith(
                            color: categoryColor.withValues(alpha: 0.9),
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (era != null && era!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: categoryColor.withValues(alpha: 0.4),
                          width: 0.5,
                        ),
                      ),
                      child: Text(
                        era!,
                        style: AppTextStyles.labelSmall.copyWith(
                          color: categoryColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
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
}

/// Glass container with blur for sections
class GlassContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
