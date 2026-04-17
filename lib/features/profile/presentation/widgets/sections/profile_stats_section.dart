import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import '../profile_stats_row.dart';

class ProfileStatsSection extends StatelessWidget {
  const ProfileStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        final shiftData = state.data;

        return ProfileStatsRow(
          shiftStart: shiftData?.shiftStartLabel ?? '--:--',
          worked: shiftData?.workedLabel ?? '0h 0m',
        );
      },
    );
  }
}
