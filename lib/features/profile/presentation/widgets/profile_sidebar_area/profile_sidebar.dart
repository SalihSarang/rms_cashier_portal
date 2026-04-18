import 'package:flutter/material.dart';
import 'profile_hero_section.dart';
import 'profile_contact_section.dart';

/// Fixed 320px left sidebar of the Profile Page.
///
/// Contains the staff avatar/name/role hero block and the personal
/// details + shift status contact section, both inside a scrollable column.
class ProfileSidebar extends StatelessWidget {
  const ProfileSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ProfileHeroSection(), ProfileContactSection()],
        ),
      ),
    );
  }
}
