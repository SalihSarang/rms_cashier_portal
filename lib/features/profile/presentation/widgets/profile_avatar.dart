import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'primary_text.dart';

/// A reusable circular profile avatar with automatic initials fallback and flexible padding.
class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final double radius;
  final EdgeInsets padding;
  final double fontSize;

  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
    required this.name,
    this.radius = 18,
    this.padding = EdgeInsets.zero,
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    final initials = name
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();

    return Padding(
      padding: padding,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: NeutralColors.surfaceLighter,
        backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
        child: avatarUrl.isEmpty
            ? PrimaryText(
                initials,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              )
            : null,
      ),
    );
  }
}
