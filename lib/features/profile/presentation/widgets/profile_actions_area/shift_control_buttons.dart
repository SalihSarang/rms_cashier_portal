import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import 'action_button.dart';

/// The horizontal wrap of shift control buttons (Start/Pause/Resume/End).
class ShiftControlButtons extends StatelessWidget {
  const ShiftControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();

        return BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            final data = shiftState.data;
            final staffId = authState.user.id;

            return Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 32),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  if (data?.canStart ?? true)
                    ActionButton(
                      label: 'Start Shift',
                      icon: Icons.play_arrow_rounded,
                      style: ActionButtonStyle.solidGreen,
                      onPressed: () => ProfileUtils.handleStartShift(
                        context,
                        authState.user,
                      ),
                    ),
                  if (data?.canPause ?? false)
                    ActionButton(
                      label: 'Pause Shift',
                      icon: Icons.pause_rounded,
                      style: ActionButtonStyle.outlineWarning,
                      onPressed: () =>
                          ProfileUtils.handlePauseShift(context, staffId),
                    ),
                  if (data?.canResume ?? false)
                    ActionButton(
                      label: 'Resume Shift',
                      icon: Icons.play_circle_outline_rounded,
                      style: ActionButtonStyle.outlineGreen,
                      onPressed: () =>
                          ProfileUtils.handleResumeShift(context, staffId),
                    ),
                  if (data?.canEnd ?? false)
                    ActionButton(
                      label: 'End Shift',
                      icon: Icons.timer_off_rounded,
                      style: ActionButtonStyle.outlineRed,
                      onPressed: () =>
                          ProfileUtils.handleEndShift(context, staffId),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
