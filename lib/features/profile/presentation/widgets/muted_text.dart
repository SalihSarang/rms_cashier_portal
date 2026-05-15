import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standardized text widget for muted/auxiliary content using [TextColors.muted].
class MutedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final double topPadding;
  final double bottomPadding;

  const MutedText(
    this.text, {
    super.key,
    this.fontSize = 12,
    this.letterSpacing,
    this.fontWeight,
    this.align,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  /// Small metadata label (10px, spacing 1.4).
  const MutedText.label(
    this.text, {
    super.key,
    this.align,
    this.topPadding = 0,
    this.bottomPadding = 0,
  }) : fontSize = 10,
       letterSpacing = 1.4,
       fontWeight = FontWeight.w700;

  /// Standard muted body text (12px, spacing 0.6).
  const MutedText.body(
    this.text, {
    super.key,
    this.align,
    this.topPadding = 0,
    this.bottomPadding = 0,
  }) : fontSize = 12,
       letterSpacing = 0.6,
       fontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          color: TextColors.muted,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
