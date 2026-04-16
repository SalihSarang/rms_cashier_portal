import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'appbar_actions.dart';
import 'appbar_logo.dart';
import 'appbar_profile.dart';

class BillingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showActions;

  const BillingAppBar({super.key, this.showActions = true});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NeutralColors.darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppBarLogo(),
          Row(
            children: [
              if (showActions) ...[
                const AppBarActions(),
                const SizedBox(width: 32),
              ],
              const AppBarProfile(),
            ],
          ),
        ],
      ),
    );
  }
}
