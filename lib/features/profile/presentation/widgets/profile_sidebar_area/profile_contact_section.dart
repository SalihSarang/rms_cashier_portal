import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cashier_portal/features/auth/presentation/bloc/auth_state.dart';
import 'package:cashier_portal/features/profile/presentation/utils/profile_utils.dart';
import '../section_header.dart';
import '../dashboard_divider.dart';
import 'detail_row.dart';

/// Left sidebar contact & status section.
///
/// Displays email, phone, role, and current shift status.
class ProfileContactSection extends StatelessWidget {
  const ProfileContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is! Authenticated) return const SizedBox.shrink();
        final user = authState.user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader('PERSONAL DETAILS', topPadding: 24),
            DetailRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: user.email.isNotEmpty ? user.email : '—',
              topPadding: 14,
            ),
            const DashboardDivider(),
            DetailRow(
              icon: Icons.phone_outlined,
              label: 'Phone',
              value: user.phoneNumber.isNotEmpty ? user.phoneNumber : '—',
            ),
            const DashboardDivider(),
            DetailRow(
              icon: Icons.badge_outlined,
              label: 'Role',
              value: ProfileUtils.capitalise(user.role.name),
            ),
          ],
        );
      },
    );
  }
}
