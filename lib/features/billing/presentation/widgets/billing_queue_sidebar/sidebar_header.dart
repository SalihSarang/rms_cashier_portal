import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SidebarHeader extends StatelessWidget {
  const SidebarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Text(
        'Billing Queue',
        style: TextStyle(
          color: TextColors.secondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
