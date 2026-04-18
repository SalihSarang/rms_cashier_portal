import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standardized icon used at the top of a [StatCard].
class StatIcon extends StatelessWidget {
  final IconData icon;
  final double bottomPadding;

  const StatIcon({super.key, required this.icon, this.bottomPadding = 16});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Icon(icon, color: TextColors.muted, size: 20),
    );
  }
}
