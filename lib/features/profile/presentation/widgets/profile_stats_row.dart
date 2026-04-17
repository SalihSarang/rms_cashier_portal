import 'package:flutter/material.dart';
import 'profile_stat_card.dart';

class ProfileStatsRow extends StatelessWidget {
  final String shiftStart;
  final String worked;

  const ProfileStatsRow({
    super.key,
    required this.shiftStart,
    required this.worked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500, // Matching the main card width
      child: Row(
        children: [
          Expanded(
            child: ProfileStatCard(
              icon: Icons.access_time_filled,
              label: 'SHIFT START',
              value: shiftStart,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ProfileStatCard(
              icon: Icons.timelapse_rounded,
              label: 'WORKED',
              value: worked,
            ),
          ),
        ],
      ),
    );
  }
}
