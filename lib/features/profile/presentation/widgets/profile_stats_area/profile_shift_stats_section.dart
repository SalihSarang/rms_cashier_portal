import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import '../section_header.dart';
import 'stat_card.dart';

/// Right panel: 4-up shift statistics grid.
class ProfileShiftStatsSection extends StatelessWidget {
  const ProfileShiftStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        final data = state.data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader('SHIFT STATISTICS'),
            const SizedBox(height: 12),
            Row(
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
            ),
            const SizedBox(height: 32), // Added spacing here
          ],
        );
      },
    );
  }
}
