import 'package:flutter/material.dart';
import '../section_header.dart';
import 'shift_control_buttons.dart';

/// Right panel: shift action buttons (side-by-side on web).
class ProfileActionsSection extends StatelessWidget {
  const ProfileActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [SectionHeader('SHIFT CONTROLS'), ShiftControlButtons()],
    );
  }
}
