import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import '../profile_stats_row.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        String shiftStart = '--:--';
        if (state is ShiftActive) {
          shiftStart = ProfileUtils.formatShiftTime(state.startTime);
        } else if (state is ShiftPaused) {
          shiftStart = ProfileUtils.formatShiftTime(state.startTime);
        }

        return ProfileStatsRow(
          shiftStart: shiftStart,
        );
      },
    );
  }
}
