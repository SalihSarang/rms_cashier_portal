import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class SidebarSearchField extends StatelessWidget {
  const SidebarSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: NeutralColors.darkSurface,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const TextField(
          style: TextStyle(color: TextColors.primary, fontSize: 14),
          decoration: InputDecoration(
            hintText: 'Search Table or Order #',
            hintStyle: TextStyle(color: TextColors.muted, fontSize: 13),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ),
    );
  }
}
