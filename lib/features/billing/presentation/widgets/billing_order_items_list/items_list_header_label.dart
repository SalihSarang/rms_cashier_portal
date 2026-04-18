import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class ItemsListHeaderLabel extends StatelessWidget {
  final String text;
  final int? flex;
  final double? width;
  final Alignment? alignment;

  const ItemsListHeaderLabel(
    this.text, {
    super.key,
    this.flex,
    this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Text(
      text,
      style: const TextStyle(
        color: TextColors.secondary,
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    );

    if (alignment != null) {
      content = Align(alignment: alignment!, child: content);
    }

    if (flex != null) {
      return Expanded(flex: flex!, child: content);
    }

    if (width != null) {
      return SizedBox(width: width!, child: content);
    }

    return content;
  }
}
