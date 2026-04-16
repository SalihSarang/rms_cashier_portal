import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import '../profile_action_button.dart';

class ProfileActionsSection extends StatelessWidget {
  const ProfileActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();
        final staffId = authState.user.id;

        return BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            final bool isShiftActive = shiftState is ShiftActive;
            final bool isShiftPaused = shiftState is ShiftPaused;
            final bool isShiftInactive =
                shiftState is ShiftInitial || shiftState is ShiftEnded;

            return Column(
              children: [
                // Show START SHIFT only if NOT currently in a session
                if (isShiftInactive)
                  ProfileActionButton(
                    label: 'START SHIFT',
                    icon: Icons.play_circle_fill_rounded,
                    color: const Color(0xFF4CAF50), // Success Green
                    onPressed: () =>
                        ProfileUtils.handleStartShift(context, staffId),
                  ),

                //  Toggle Pause/Resume button if shift is in progress
                if (isShiftActive)
                  ProfileActionButton(
                    label: 'PAUSE SHIFT',
                    icon: Icons.pause_circle_outline_rounded,
                    color: SemanticColors.warning,
                    onPressed: () =>
                        ProfileUtils.handlePauseShift(context, staffId),
                  ),
                if (isShiftPaused)
                  ProfileActionButton(
                    label: 'RESUME SHIFT',
                    icon: Icons.play_circle_outline_rounded,
                    color: const Color(0xFF4CAF50),
                    onPressed: () =>
                        ProfileUtils.handleResumeShift(context, staffId),
                  ),

                // Show END SHIFT if shift is active or paused
                if (isShiftActive || isShiftPaused) ...[
                  const SizedBox(height: 16),
                  ProfileActionButton(
                    label: 'END SHIFT',
                    icon: Icons.timer_off_rounded,
                    color: SemanticColors.error,
                    onPressed: () =>
                        ProfileUtils.handleEndShift(context, staffId),
                  ),
                ],

                const SizedBox(height: 32),

                // Logout Action (Always available)
                ProfileActionButton(
                  label: 'LOGOUT',
                  icon: Icons.logout_rounded,
                  color: SemanticColors.error,
                  onPressed: () => ProfileUtils.handleLogout(context),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
