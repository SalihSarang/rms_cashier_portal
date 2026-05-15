import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Title text for the Profile App Bar.
class ProfileAppBarTitle extends StatelessWidget {
  const ProfileAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Staff Profile',
      style: TextStyle(
        color: TextColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
