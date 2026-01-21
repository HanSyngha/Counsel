import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../config/theme.dart';
import '../config/persona_themes.dart';

/// A themed markdown widget that applies persona-specific styling
/// Supports: bold, italic, headers (h1-h3), bullet lists, numbered lists, blockquotes, inline code
class ThemedMarkdown extends StatelessWidget {
  final String data;
  final PersonaTheme? personaTheme;
  final bool hasCustomTheme;
  final TextStyle? baseTextStyle;
  final bool selectable;
  final bool shrinkWrap;

  const ThemedMarkdown({
    super.key,
    required this.data,
    this.personaTheme,
    this.hasCustomTheme = false,
    this.baseTextStyle,
    this.selectable = false,
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = personaTheme;
    final textColor = hasCustomTheme && theme != null
        ? theme.accentColor
        : AppColors.textPrimary;
    final secondaryTextColor = hasCustomTheme && theme != null
        ? theme.accentColor.withOpacity(0.8)
        : AppColors.textSecondary;
    final primaryColor = hasCustomTheme && theme != null
        ? theme.primaryColor
        : AppColors.primary;
    final surfaceColor = hasCustomTheme && theme != null
        ? theme.surfaceColor
        : AppColors.surfaceVariant;

    final baseStyle = baseTextStyle ??
        AppTextStyles.bodyLarge.copyWith(
          color: textColor,
          height: 1.8,
        );

    final styleSheet = MarkdownStyleSheet(
      // Paragraphs
      p: baseStyle,
      pPadding: const EdgeInsets.only(bottom: 8),

      // Bold
      strong: baseStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),

      // Italic
      em: baseStyle.copyWith(
        fontStyle: FontStyle.italic,
      ),

      // Headers
      h1: AppTextStyles.headlineLarge.copyWith(
        color: primaryColor,
        height: 1.4,
      ),
      h1Padding: const EdgeInsets.only(top: 16, bottom: 8),

      h2: AppTextStyles.headlineMedium.copyWith(
        color: primaryColor,
        height: 1.4,
      ),
      h2Padding: const EdgeInsets.only(top: 12, bottom: 6),

      h3: AppTextStyles.headlineSmall.copyWith(
        color: primaryColor,
        height: 1.4,
      ),
      h3Padding: const EdgeInsets.only(top: 8, bottom: 4),

      // Lists
      listBullet: baseStyle.copyWith(
        color: primaryColor,
      ),
      listIndent: 24,
      listBulletPadding: const EdgeInsets.only(right: 8),

      // Blockquotes
      blockquote: AppTextStyles.quote.copyWith(
        color: secondaryTextColor,
        fontSize: baseStyle.fontSize,
        height: 1.6,
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: primaryColor.withOpacity(0.5),
            width: 4,
          ),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),

      // Inline code
      code: AppTextStyles.bodyMedium.copyWith(
        color: primaryColor,
        backgroundColor: surfaceColor.withOpacity(0.5),
        fontFamily: 'monospace',
      ),
      codeblockDecoration: BoxDecoration(
        color: surfaceColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: primaryColor.withOpacity(0.2),
        ),
      ),
      codeblockPadding: const EdgeInsets.all(12),

      // Horizontal rule
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),

      // Table styling (basic support)
      tableHead: baseStyle.copyWith(fontWeight: FontWeight.bold),
      tableBody: baseStyle,
      tableBorder: TableBorder.all(
        color: primaryColor.withOpacity(0.3),
        width: 1,
      ),
      tableCellsPadding: const EdgeInsets.all(8),

      // Links (in case they appear)
      a: baseStyle.copyWith(
        color: primaryColor,
        decoration: TextDecoration.underline,
      ),
    );

    if (selectable) {
      return MarkdownBody(
        data: data,
        styleSheet: styleSheet,
        shrinkWrap: shrinkWrap,
        selectable: true,
      );
    }

    return MarkdownBody(
      data: data,
      styleSheet: styleSheet,
      shrinkWrap: shrinkWrap,
    );
  }
}

/// A simpler themed markdown for share images that works better with widgets_to_image
class ThemedMarkdownForImage extends StatelessWidget {
  final String data;
  final PersonaTheme? personaTheme;
  final bool hasCustomTheme;
  final TextStyle? baseTextStyle;
  final Color? categoryColor;

  const ThemedMarkdownForImage({
    super.key,
    required this.data,
    this.personaTheme,
    this.hasCustomTheme = false,
    this.baseTextStyle,
    this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = personaTheme;
    final textColor = hasCustomTheme && theme != null
        ? theme.accentColor
        : AppColors.textPrimary;
    final primaryColor = categoryColor ??
        (hasCustomTheme && theme != null ? theme.primaryColor : AppColors.primary);

    final baseStyle = baseTextStyle ??
        AppTextStyles.bodyMedium.copyWith(
          color: textColor,
          height: 1.6,
        );

    final styleSheet = MarkdownStyleSheet(
      p: baseStyle,
      pPadding: const EdgeInsets.only(bottom: 6),
      strong: baseStyle.copyWith(fontWeight: FontWeight.bold),
      em: baseStyle.copyWith(fontStyle: FontStyle.italic),
      h1: AppTextStyles.titleLarge.copyWith(color: primaryColor, height: 1.3),
      h1Padding: const EdgeInsets.only(top: 8, bottom: 4),
      h2: AppTextStyles.titleMedium.copyWith(color: primaryColor, height: 1.3),
      h2Padding: const EdgeInsets.only(top: 6, bottom: 3),
      h3: AppTextStyles.titleSmall.copyWith(color: primaryColor, height: 1.3),
      h3Padding: const EdgeInsets.only(top: 4, bottom: 2),
      listBullet: baseStyle.copyWith(color: primaryColor),
      listIndent: 16,
      listBulletPadding: const EdgeInsets.only(right: 6),
      blockquote: baseStyle.copyWith(
        fontStyle: FontStyle.italic,
        color: textColor.withOpacity(0.8),
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: primaryColor.withOpacity(0.5), width: 3),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
      code: baseStyle.copyWith(
        fontFamily: 'monospace',
        color: primaryColor,
        fontSize: (baseStyle.fontSize ?? 14) - 1,
      ),
      a: baseStyle.copyWith(color: primaryColor),
    );

    return MarkdownBody(
      data: data,
      styleSheet: styleSheet,
      shrinkWrap: true,
    );
  }
}
