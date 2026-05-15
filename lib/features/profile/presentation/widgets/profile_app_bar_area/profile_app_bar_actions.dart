import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

/// Back button for the Profile App Bar.
class ProfileAppBarBackAction extends StatelessWidget {
  const ProfileAppBarBackAction({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      borderRadius: BorderRadius.circular(8),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: TextColors.muted,
          size: 16,
        ),
      ),
    );
  }
}
