import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'appbar_actions.dart';
import 'appbar_logo.dart';
import 'appbar_profile.dart';

class BillingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BillingAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NeutralColors.darkBackground,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarLogo(),
          Row(
            children: [AppBarActions(), SizedBox(width: 32), AppBarProfile()],
          ),
        ],
      ),
    );
  }
}
