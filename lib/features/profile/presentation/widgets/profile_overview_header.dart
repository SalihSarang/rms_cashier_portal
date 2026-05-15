import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The large "Overview" title header for the profile dashboard.
class ProfileOverviewHeader extends StatelessWidget {
  const ProfileOverviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Text(
        'Overview',
        style: TextStyle(
          color: TextColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
