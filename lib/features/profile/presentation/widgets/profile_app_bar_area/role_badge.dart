import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/enums/enums.dart';

/// A pill badge showing the staff role in the profile app bar.
class RoleBadge extends StatelessWidget {
  final UserRole role;

  const RoleBadge({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: PrimaryColors.brandGreen.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          role.name.toUpperCase(),
          style: const TextStyle(
            color: PrimaryColors.brandGreen,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }
}
