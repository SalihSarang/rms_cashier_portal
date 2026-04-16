import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';

class ProfileInfoCard extends StatelessWidget {
  final StaffModel staff;

  const ProfileInfoCard({super.key, required this.staff});

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
      width: 500, // Matching the large width in the screenshot
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
                  color: const Color(
                    0xFF1A1F2B,
                  ), // Deep slate blue matching screenshot
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: staff.avatar.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(staff.avatar, fit: BoxFit.cover),
                      )
                    : Text(
                        initials,
                        style: const TextStyle(
                          color: Color(0xFF4A8BF5), // Vibrant blue initials
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
        ],
      ),
    );
  }
}
