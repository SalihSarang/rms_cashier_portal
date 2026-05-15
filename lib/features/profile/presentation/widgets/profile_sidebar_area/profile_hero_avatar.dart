import 'package:flutter/material.dart';
import '../profile_avatar.dart';

/// A large circular avatar with initials fallback.
class ProfileHeroAvatar extends StatelessWidget {
  final String avatarUrl;
  final String name;

  const ProfileHeroAvatar({
    super.key,
    required this.avatarUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileAvatar(
      avatarUrl: avatarUrl,
      name: name,
      radius: 48,
      fontSize: 32,
      padding: const EdgeInsets.only(bottom: 16),
    );
  }
}
