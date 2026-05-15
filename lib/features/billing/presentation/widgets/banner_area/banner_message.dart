import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// The descriptive message text used in the shift status banner.
class BannerMessage extends StatelessWidget {
  final String message;

  const BannerMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          message,
          style: const TextStyle(
            color: TextColors.primary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
