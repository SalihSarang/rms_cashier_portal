import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// A standardized thin divider used between list items in the profile dashboard.
class DashboardDivider extends StatelessWidget {
  final double topSpacing;
  final double bottomSpacing;

  const DashboardDivider({
    super.key,
    this.topSpacing = 0,
    this.bottomSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topSpacing, bottom: bottomSpacing),
      child: const Divider(height: 1, color: NeutralColors.divider),
    );
  }
}
