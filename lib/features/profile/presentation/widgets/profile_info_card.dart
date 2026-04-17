import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ProfileInfoCard extends StatelessWidget {
  final StaffModel staff;
  final String shiftSubtitle;

  const ProfileInfoCard({
    super.key,
    required this.staff,
    required this.shiftSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    // Generate initials for placeholder avatar
    final String initials = staff.name
        .split(' ')
        .map((e) => e[0])
        .take(2)
        .join('')
        .toUpperCase();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        color: NeutralColors.darkSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Large Avatar with Badge
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: NeutralColors
                      .background, // Using design system background color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: staff.avatar.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          staff.avatar,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        initials,
                        style: const TextStyle(
                          color: PrimaryColors
                              .defaultColor, // Using design system primary color
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              // Verified Green Badge
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: NeutralColors.darkSurface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: PrimaryColors.brandGreen,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // User Name
          Text(
            staff.name,
            style: const TextStyle(
              color: TextColors.primary,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${staff.role.name.toUpperCase()} • $shiftSubtitle',
            style: const TextStyle(
              color: TextColors.muted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
