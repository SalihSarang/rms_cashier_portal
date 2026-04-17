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
            final shiftData = shiftState.data;

            return Column(
              children: [
                if (shiftData?.canStart ?? false)
                  ProfileActionButton(
                    label: 'START SHIFT',
                    icon: Icons.play_circle_fill_rounded,
                    color: PrimaryColors.brandGreen, // Success Green
                    onPressed: () =>
                        ProfileUtils.handleStartShift(context, authState.user),
                  ),

                if (shiftData?.canPause ?? false)
                  ProfileActionButton(
                    label: 'PAUSE SHIFT',
                    icon: Icons.pause_circle_outline_rounded,
                    color: SemanticColors.warning,
                    onPressed: () =>
                        ProfileUtils.handlePauseShift(context, staffId),
                  ),
                if (shiftData?.canResume ?? false)
                  ProfileActionButton(
                    label: 'RESUME SHIFT',
                    icon: Icons.play_circle_outline_rounded,
                    color: PrimaryColors.brandGreen,
                    onPressed: () =>
                        ProfileUtils.handleResumeShift(context, staffId),
                  ),

                if (shiftData?.canEnd ?? false) ...[
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
