import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_shared_package/models/staff_model/staff_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileHeader extends StatelessWidget {
  final StaffModel staff;

  const ProfileHeader({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: NeutralColors.glassBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: NeutralColors.glassBorder),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: NeutralColors.authFieldBackground,
            backgroundImage: staff.avatar.isNotEmpty
                ? CachedNetworkImageProvider(staff.avatar)
                : null,
            child: staff.avatar.isEmpty
                ? const Icon(Icons.person, size: 40, color: NeutralColors.icon)
                : null,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  staff.name,
                  style: const TextStyle(
                    color: NeutralColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  staff.email,
                  style: const TextStyle(
                    color: NeutralColors.icon,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    staff.role.name.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
