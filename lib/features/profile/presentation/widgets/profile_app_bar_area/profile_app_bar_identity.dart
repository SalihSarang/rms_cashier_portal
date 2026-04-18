import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_bloc.dart';
import 'package:cashier_portal/features/profile/presentation/bloc/shift_state.dart';
import '../primary_text.dart';
import '../profile_avatar.dart';
import 'role_badge.dart';
import 'shift_status_dot.dart';

/// Center identity block for the Profile App Bar.
class ProfileAppBarIdentity extends StatelessWidget {
  const ProfileAppBarIdentity({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();
        final user = authState.user;

        return BlocBuilder<ShiftBloc, ShiftState>(
          builder: (context, shiftState) {
            final isShiftActive = shiftState.data?.currentSession != null;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileAvatar(
                  avatarUrl: user.avatar,
                  name: user.name,
                  padding: const EdgeInsets.only(right: 12),
                ),
                PrimaryText.medium(user.name),
                RoleBadge(role: user.role),
                ShiftStatusDot(isActive: isShiftActive),
              ],
            );
          },
        );
      },
    );
  }
}
