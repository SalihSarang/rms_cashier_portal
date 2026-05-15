import 'package:flutter/material.dart';
import '../primary_text.dart';

/// A single data cell for the shift history table rows.
///
/// Wraps content in an [Expanded] widget for use inside a [Row].
/// [flex] determines the column width (default is 1).
class HistoryDataCell extends StatelessWidget {
  final String text;
  final int flex;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign align;

  const HistoryDataCell(
    this.text, {
    super.key,
    this.flex = 1,
    this.color,
    this.fontWeight,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: PrimaryText(
        text,
        align: align,
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
