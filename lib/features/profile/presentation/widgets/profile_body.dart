import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

import 'profile_canvas.dart';
import 'profile_sidebar_area/profile_sidebar.dart';

/// The main layout body of the Profile Page, combining the sidebar and canvas.
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column (Fixed Sidebar)
        ProfileSidebar(),

        VerticalDivider(width: 1, color: NeutralColors.divider),

        // Right Column (Scrollable Dashboard)
        ProfileCanvas(),
      ],
    );
  }
}
