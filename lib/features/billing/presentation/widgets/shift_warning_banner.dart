import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';

class ShiftWarningBanner extends StatelessWidget {
  const ShiftWarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, shiftState) {
        final shiftData = shiftState.data;
        if (shiftData != null && shiftData.currentSession != null) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                SemanticColors.warning.withValues(alpha: 0.15),
                SemanticColors.warning.withValues(alpha: 0.05),
              ],
            ),
            border: Border(
              bottom: BorderSide(
                color: SemanticColors.warning.withValues(alpha: 0.2),
              ),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                color: SemanticColors.warning,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Your shift hasn\'t started yet. Please start your shift timer to begin working.',
                  style: TextStyle(
                    color: TextColors.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  if (authState is! Authenticated) {
                    return const SizedBox.shrink();
                  }
                  return ElevatedButton.icon(
                    onPressed: () =>
                        ProfileUtils.handleStartShift(context, authState.user),
                    icon: const Icon(Icons.play_arrow_rounded, size: 18),
                    label: const Text('START SHIFT'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SemanticColors.warning,
                      foregroundColor: TextColors.primary,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
