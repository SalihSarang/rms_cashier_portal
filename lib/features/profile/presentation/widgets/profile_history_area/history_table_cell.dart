import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A single header cell for the shift history table.
///
/// Wraps content in an [Expanded] widget for use inside a [Row].
/// [flex] determines the column width (default is 1).
class HistoryHeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  final TextAlign align;

  const HistoryHeaderCell(
    this.text, {
    super.key,
    this.flex = 1,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: align,
        style: const TextStyle(
          color: TextColors.muted,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
