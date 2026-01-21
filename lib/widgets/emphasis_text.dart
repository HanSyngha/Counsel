import 'package:flutter/material.dart';

import '../config/theme.dart';
import '../config/persona_themes.dart';
import '../models/advice.dart';

/// 강조 표시가 있는 텍스트 위젯
/// 노트에 중요 부분을 표시하는 느낌으로 빨간 밑줄 + 별표 마크
class EmphasisText extends StatefulWidget {
  /// 전체 텍스트 (조언)
  final String text;

  /// 강조 정보 (null이면 일반 텍스트로 표시)
  final Emphasis? emphasis;

  /// 기본 텍스트 스타일
  final TextStyle? baseTextStyle;

  /// 페르소나 테마
  final PersonaTheme? personaTheme;

  /// 커스텀 테마 사용 여부
  final bool hasCustomTheme;

  /// 밑줄 색상 (기본: 빨간색)
  final Color? underlineColor;

  /// 별표 색상 (기본: amber)
  final Color? starColor;

  /// 애니메이션 활성화 여부
  final bool enableAnimation;

  const EmphasisText({
    super.key,
    required this.text,
    this.emphasis,
    this.baseTextStyle,
    this.personaTheme,
    this.hasCustomTheme = false,
    this.underlineColor,
    this.starColor,
    this.enableAnimation = true,
  });

  @override
  State<EmphasisText> createState() => _EmphasisTextState();
}

class _EmphasisTextState extends State<EmphasisText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.enableAnimation && widget.emphasis != null) {
      // 처음 표시될 때 반짝이는 효과
      _animationController.repeat(reverse: true);
      // 3초 후 애니메이션 정지
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          _animationController.stop();
          _animationController.value = 1.0;
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emphasis = widget.emphasis;

    // emphasis가 없으면 일반 텍스트로 표시
    if (emphasis == null || emphasis.text.isEmpty) {
      return Text(
        widget.text,
        style: _getBaseTextStyle(),
      );
    }

    // emphasis 텍스트 위치 찾기
    final emphasisText = emphasis.text;
    final startIndex = emphasis.startIndex ?? widget.text.indexOf(emphasisText);
    final endIndex = emphasis.endIndex ?? (startIndex + emphasisText.length);

    // 유효한 범위인지 확인
    if (startIndex < 0 || startIndex >= widget.text.length) {
      // 텍스트 내에서 찾을 수 없으면 일반 텍스트로 표시
      return Text(
        widget.text,
        style: _getBaseTextStyle(),
      );
    }

    // 텍스트를 세 부분으로 분할: 앞부분, 강조부분, 뒷부분
    final beforeText = widget.text.substring(0, startIndex);
    final highlightText = widget.text.substring(
      startIndex,
      endIndex.clamp(startIndex, widget.text.length),
    );
    final afterText = endIndex < widget.text.length
        ? widget.text.substring(endIndex)
        : '';

    return Text.rich(
      TextSpan(
        children: [
          // 앞부분 텍스트
          if (beforeText.isNotEmpty)
            TextSpan(
              text: beforeText,
              style: _getBaseTextStyle(),
            ),

          // 강조된 텍스트 (별표 포함)
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: _buildEmphasisWidget(highlightText),
          ),

          // 뒷부분 텍스트
          if (afterText.isNotEmpty)
            TextSpan(
              text: afterText,
              style: _getBaseTextStyle(),
            ),
        ],
      ),
    );
  }

  Widget _buildEmphasisWidget(String highlightText) {
    final underlineColor = widget.underlineColor ?? const Color(0xFFE53935);
    final starColor = widget.starColor ?? Colors.amber;

    return ListenableBuilder(
      listenable: _animationController,
      builder: (context, child) {
        final glowValue = _glowAnimation.value;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            // 강조 텍스트 + 밑줄
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: underlineColor,
                    width: 2.5,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                highlightText,
                style: _getEmphasisTextStyle(),
              ),
            ),

            // 별표 마크 (오른쪽 위)
            Positioned(
              top: -8,
              right: -12,
              child: Opacity(
                opacity: widget.enableAnimation ? glowValue : 1.0,
                child: Text(
                  '★',
                  style: TextStyle(
                    color: starColor,
                    fontSize: 14,
                    shadows: widget.enableAnimation
                        ? [
                            Shadow(
                              color: starColor.withOpacity(0.5 * glowValue),
                              blurRadius: 4 * glowValue,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextStyle _getBaseTextStyle() {
    final theme = widget.personaTheme;
    final textColor = widget.hasCustomTheme && theme != null
        ? theme.accentColor
        : AppColors.textPrimary;

    return widget.baseTextStyle ??
        AppTextStyles.bodyLarge.copyWith(
          color: textColor,
          height: 1.8,
        );
  }

  TextStyle _getEmphasisTextStyle() {
    final baseStyle = _getBaseTextStyle();
    return baseStyle.copyWith(
      fontWeight: FontWeight.w600,
    );
  }
}
