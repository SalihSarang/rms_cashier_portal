import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standardized text widget for primary content using [TextColors.primary].
class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextOverflow? overflow;
  final TextAlign? align;

  const PrimaryText(
    this.text, {
    super.key,
    this.fontSize = 13,
    this.fontWeight = FontWeight.w500,
    this.color,
    this.overflow,
    this.align,
  });

  /// Standard body text (13px, Medium).
  const PrimaryText.body(
    this.text, {
    super.key,
    this.color,
    this.overflow,
    this.align,
  }) : fontSize = 13,
       fontWeight = FontWeight.w500;

  /// Bold body text (13px, Bold).
  const PrimaryText.bold(
    this.text, {
    super.key,
    this.color,
    this.overflow,
    this.align,
  }) : fontSize = 13,
       fontWeight = FontWeight.bold;

  /// Medium heading text (15px, Semi-Bold).
  const PrimaryText.medium(
    this.text, {
    super.key,
    this.color,
    this.overflow,
    this.align,
  }) : fontSize = 15,
       fontWeight = FontWeight.w600;

  /// Large heading text (18px, Bold).
  const PrimaryText.large(
    this.text, {
    super.key,
    this.color,
    this.overflow,
    this.align,
  }) : fontSize = 18,
       fontWeight = FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        color: color ?? TextColors.primary,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
