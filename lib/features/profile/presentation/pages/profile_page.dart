import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';

import '../bloc/shift_bloc.dart';
import '../bloc/shift_state.dart';
import '../widgets/profile_app_bar_area/profile_app_bar.dart';
import '../widgets/profile_sidebar_area/profile_sidebar.dart';
import '../widgets/profile_overview_header.dart';
import '../widgets/profile_stats_area/profile_shift_stats_section.dart';
import '../widgets/profile_actions_area/profile_actions_section.dart';
import '../widgets/profile_history_area/shift_history_section.dart';
import '../utils/profile_utils.dart';

/// Profile Page — declarative two-column web layout.
///
/// This file acts as the "Table of Contents" for the entire screen structure.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftBloc, ShiftState>(
      listener: (context, state) {
        if (state is ShiftError) ProfileUtils.showError(context, state.message);
      },
      child: const Scaffold(
        backgroundColor: NeutralColors.darkBackground,
        appBar: ProfileAppBar(),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column (Fixed Sidebar)
            ProfileSidebar(),

            VerticalDivider(width: 1, color: NeutralColors.divider),

            // Right Column (Scrollable Dashboard)
            Expanded(
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
            ),
          ],
        ),
      ),
    );
  }
}
