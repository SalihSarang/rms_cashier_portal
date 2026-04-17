import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/profile_action_button.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import '../widgets/sections/profile_header_section.dart';

/// The Profile Page displays staff information and session controls.
///
/// It has been simplified to remove shift management features which are not supported.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeutralColors.darkBackground,
      appBar: const ProfileAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ProfileHeaderSection(),
                const SizedBox(height: 32),
                ProfileActionButton(
                  label: 'LOGOUT',
                  icon: Icons.logout_rounded,
                  color: SemanticColors.error,
                  onPressed: () => ProfileUtils.handleLogout(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
