import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import 'package:cashier_portal/features/profile/presentation/widgets/profile_actions_area/action_button.dart';

/// The action button used to start a shift from the warning banner.
class BannerActionButton extends StatelessWidget {
  const BannerActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) {
          return const SizedBox.shrink();
        }

        return ActionButton(
          label: 'START SHIFT',
          icon: Icons.play_arrow_rounded,
          style: ActionButtonStyle.solidWarning,
          onPressed: () =>
              ProfileUtils.handleStartShift(context, authState.user),
        );
      },
    );
  }
}
