import 'package:flutter/material.dart';

import 'profile_actions_area/profile_actions_section.dart';
import 'profile_history_area/shift_history_section.dart';
import 'profile_overview_header.dart';
import 'profile_stats_area/profile_shift_stats_section.dart';

/// The main scrollable content area of the Profile Page.
class ProfileCanvas extends StatelessWidget {
  const ProfileCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileOverviewHeader(),
            ProfileShiftStatsSection(),
            ProfileActionsSection(),
            ShiftHistorySection(),
          ],
        ),
      ),
    );
  }
}
