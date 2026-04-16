import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sarah J.',
              style: TextStyle(
                color: TextColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Cashier ID: 4421',
              style: TextStyle(color: TextColors.muted, fontSize: 11),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 20,
          backgroundColor: NeutralColors.darkSurface,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
        ),
      ],
    );
  }
}
