import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/billing/presentation/widgets/billing_app_bar_area/billing_app_bar.dart';
import '../widgets/sections/profile_header_section.dart';
import '../widgets/sections/profile_stats_section.dart';
import '../widgets/sections/profile_actions_section.dart';

/// The Profile Page serves as a clear Table of Contents for the staff and shift management UI.
///
/// It delegates business logic and state observation to modular section widgets:
/// [ProfileHeaderSection] - User information and avatar
/// [ProfileStatsSection] - Shift timing and device tracking
/// [ProfileActionsSection] - Shift management and session logout controls
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeutralColors.darkBackground,
      appBar: BillingAppBar(showActions: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Staff Identity
                ProfileHeaderSection(),

                SizedBox(height: 16),

                // Active Session Statistics
                ProfileStatsSection(),

                SizedBox(height: 48),

                // Shift Management Actions
                ProfileActionsSection(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
