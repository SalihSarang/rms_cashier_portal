import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';

/// Logout button for the Profile App Bar.
class ProfileAppBarLogoutAction extends StatelessWidget {
  const ProfileAppBarLogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) return const SizedBox.shrink();
        return InkWell(
          onTap: () => ProfileUtils.handleLogout(context),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.logout_rounded,
                  color: SemanticColors.error,
                  size: 16,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Logout',
                  style: TextStyle(
                    color: SemanticColors.error,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
