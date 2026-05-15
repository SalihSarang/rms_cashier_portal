import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import '../section_header.dart';
import 'profile_shift_stats_grid.dart';

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
            ProfileShiftStatsGrid(data: data),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
