import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A consistent uppercase label used as a section title.
class SectionHeader extends StatelessWidget {
  final String title;
  final double topPadding;

  const SectionHeader(this.title, {super.key, this.topPadding = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: TextColors.muted,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
        ),
      ),
    );
  }
}
