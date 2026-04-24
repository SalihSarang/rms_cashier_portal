import 'package:flutter/material.dart';

import '../../bloc/shift_state.dart';
import '../../utils/profile_utils.dart';
import 'stat_card.dart';

/// A horizontal grid of 4 shift statistics cards.
class ProfileShiftStatsGrid extends StatelessWidget {
  final ShiftReady? data;

  const ProfileShiftStatsGrid({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.access_time_rounded,
            label: 'SHIFT START',
            value: data?.shiftStartLabel ?? '--:--',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.timelapse_rounded,
            label: 'WORKED',
            value: data?.workedLabel ?? '0h 0m',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.pause_circle_outline_rounded,
            label: 'PAUSED',
            value: data?.pauseLabel ?? '0h 0m',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatCard(
            icon: Icons.track_changes_rounded,
            label: 'STATUS',
            value: data?.statusLabel ?? 'Not Started',
            valueColor: ProfileUtils.shiftStatusColor(data?.status),
          ),
        ),
      ],
    );
  }
}
