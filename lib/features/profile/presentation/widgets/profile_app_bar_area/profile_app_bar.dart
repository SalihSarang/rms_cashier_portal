import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'profile_app_bar_actions.dart';
import 'profile_app_bar_identity.dart';
import 'profile_app_bar_title.dart';
import 'profile_app_bar_logout.dart';

/// Top app bar for the Profile Page.
///
/// Displays:
/// - Left: back button + "Staff Profile" title
/// - Center: inline avatar, name, role badge, shift status
/// - Right: logout text button
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: NeutralColors.darkSurface,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const ProfileAppBarBackAction(),
          const SizedBox(width: 12),
          Container(width: 1, height: 24, color: NeutralColors.divider),
          const SizedBox(width: 16),
          const ProfileAppBarTitle(),
          const Expanded(child: ProfileAppBarIdentity()),
          const ProfileAppBarLogoutAction(),
        ],
      ),
    );
  }
}
