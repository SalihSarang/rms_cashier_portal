import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The warning icon used in the shift status banner.
class BannerIcon extends StatelessWidget {
  const BannerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 12),
      child: Icon(
        Icons.warning_amber_rounded,
        color: SemanticColors.warning,
        size: 20,
      ),
    );
  }
}
